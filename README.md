# Dot, dot, dot...
My attempt to get my dot files and configs into a repo with some tooling to get setup,
and keep different environments that I work in synced with the latest changes to my 
preferred workflow tooling.

## Dependencies (These things won't be installed automatically by the tooling in this repo [yet].)
- Zsh
- Alacritty
- Python3
- Git
- curl
- Neovim
- tmux

## Qtile WM setup dependencies (These are only required if you're intending to use qtile)
Current qtile setup is based off of the default qtile that comes with the Endeavouros qtile CE and as such to start with most of the dependencies relating to that OS install are listed here for now.

More info on the endeavoros qtile CE: <https://discovery.endeavouros.com/window-tiling-managers/qtile/2022/01/>
- Rofi
- picom
- dunst
- feh
- pcmanfm-gtk3?


## To setup a new env with these configs
1. Install the dependencies
2. Clone the repo and cd into it `git clone git@github.com:disc0ninja/configs.git && cd configs`
3. Setup the virtual env and install python requirements
    ```
    python3 -m venv .env
    source .env/bin/activate
    pip install -r requirements.txt
    ```
4. (optional) install asdf, and use it to install the tools that
mason and neovim need for LSP configuration and setup. `./asdf_setup.sh`
5. Run the python install script to setup the various dots `python3 main.py`
6. Exit the virtual environment `deactivate`
