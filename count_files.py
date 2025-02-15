import os

def count_files(directory):
    return len([f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))])

folders = ["Pandas", "SQL"]
results = {folder: count_files(folder) for folder in folders}

readme_path = "README.md"
with open(readme_path, "r", encoding="utf-8") as f:
    content = f.readlines()

start_marker = "<!-- FILE_COUNT_START -->"
end_marker = "<!-- FILE_COUNT_END -->"

new_stats = "\n".join([f"- `{folder.capitalize()}`: {count} {'file' if count%10 == 1 else 'files'}" for folder, count in results.items()])

in_section = False
new_content = []
for line in content:
    if start_marker in line:
        new_content.append(line)
        new_content.append(new_stats + "\n")
        in_section = True
    elif end_marker in line:
        new_content.append(line)
        in_section = False
    if not in_section:
        new_content.append(line)

with open(readme_path, "w", encoding="utf-8") as f:
    f.writelines(new_content)

print("README.md has been updated!")
