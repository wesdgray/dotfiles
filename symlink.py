import json
import os
from pathlib import Path

def symlink_paths(path_map_filename: str):
    with open(path_map_filename) as file:
        path_map: dict[str, str] = json.load(file)
    for from_dir, to_dir in path_map.items():
        from_dir = Path(from_dir).absolute()
        to_dir = Path(os.path.expandvars(to_dir)).absolute()
        print(f"{from_dir=}\n{to_dir=}")
        if to_dir.is_symlink():
            to_dir.unlink()
        os.symlink(from_dir, to_dir, target_is_directory=True)
if __name__ == '__main__':
    symlink_paths("path_map.json")
