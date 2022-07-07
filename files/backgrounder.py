import os
import random
import subprocess
import time


def set_random_background(wallpaper_dir, selected_dir):
    commands = ["feh", "--bg-fill", "--randomize", f"{wallpaper_dir}/{selected_dir.name}"]

    output = subprocess.run(commands, stdout = subprocess.PIPE)

def obtain_new_dir():
    all_dirs = list(filter(lambda x: x.is_dir(), os.scandir()))
    selected_dir = random.choice(all_dirs)
    return selected_dir

def main():
    pid = os.fork()
    if pid > 0:
        return

    os.setsid()

    wallpaper_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(wallpaper_dir)

    os.environ["DISPLAY"] = ":0"

    n_shifts = 0

    while True:
        if n_shifts == 0:
            picture_dir = obtain_new_dir()

        set_random_background(wallpaper_dir, picture_dir)


        n_shifts = (n_shifts + 1) % 3

        time.sleep(10*60)


if __name__ == "__main__":
    main()



