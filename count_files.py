import os
import json
from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse

app = FastAPI()

FOLDERS = ["Pandas", "SQL", "OtherFolder"]  
DATA_FILE = "data.json"


def count_files(directory):
    return len([f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))])


def update_data():
    data = {folder: count_files(folder) for folder in FOLDERS}
    with open(DATA_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)


def load_data():
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r", encoding="utf-8") as f:
            return json.load(f)
    return {}


@app.get("/badge")
def get_badge(folder: str = Query(..., description="Folder for the badge")):
    data = load_data()

    if folder not in data:
        return JSONResponse(content={"error": "Folder not found"}, status_code=404)

    response = {
        "schemaVersion": 1,
        "label": folder,
        "message": str(data[folder]),
        "color": "blue"
    }
    return JSONResponse(content=response)


@app.get("/update")
def update():
    update_data()
    return {"status": "updated"}
