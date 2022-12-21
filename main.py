import logging
import os
import shutil
import filecmp
from os.path import exists
from rich.logging import RichHandler

FORMAT = "%(message)s"
logging.basicConfig(
    level="NOTSET", format=FORMAT, datefmt="[%X]", handlers=[RichHandler()]
)

log = logging.getLogger("rich")


class Dot:
    def __init__(self, src, dst, linux=True, macos=True):
        self.src = src
        self.dst = dst
        self.linux = linux
        self.macos = macos
        self.isDir = os.path.isdir(src)

    def backup(self):
        try:
            shutil.copy2(self.dst, self.dst + '.bak')
        except Exception as e:
            log.error(
                f'Exception copying {self.dst} to {self.dst + ".bak"}. {e}')
        pass

    def compare_existing(self):
        if self.isDir:
            same = filecmp.dircmp(self.src, self.dst)
        else:
            same = filecmp.cmp(self.src, self.dst)
        if same:
            log.info(f'{self.src} and {self.dst} match')
            return True
        else:
            log.info(f'{self.src} and {self.dst} differ')
            return False

    def copy_files(self):
        if self.isDir:
            try:
                shutil.copytree(self.src, self.dst)
            except Exception as e:
                log.error(f'Exception copying {self.src} to {self.dst}. {e}')
        else:
            try:
                shutil.copy2(self.src, self.dst)
            except Exception as e:
                log.error(f'Exception copying {self.src} to {self.dst}. {e}')

    def check_os_compat(self):
        OS = os.uname().sysname
        log.debug(OS)
        if ('Linux' in OS and self.linux) or ('Macos' in OS and self.macos):
            log.debug(f'OS {OS} is compatible')
            return True
        else:
            log.debug(f'OS {OS} is NOT compatible')
            return False

    def install(self):
        if self.check_os_compat():
            if exists(self.dst):
                log.info(f'{self.dst} exists. Comparing with {self.src}')
                same = self.compare_existing()
                if not same:
                    self.backup()
                    self.copy_files()
                else:
                    log.info(f'Skipping. {self.src} matches {self.dst}')
            else:
                log.info(f'{self.dst} is empty.')
                self.copy_files()


def main():
    HOME = str(os.environ.get('HOME'))
    XDG_CONFIG = str(os.environ.get('XDG_CONFIG', HOME + '/.config'))
    log.debug(f'HOME: {HOME}. XDG_CONFIG: {XDG_CONFIG}')

    alacritty = Dot(
        src='./dots/_alacritty.yml',
        dst=HOME + '/.alacritty.yml',
    )

    bash_profile = Dot(
        src='./dots/_bash_profile',
        dst=HOME + '/.bash_profile',
    )

    bashrc = Dot(
        src='./dots/_bashrc',
        dst=HOME + '/.bashrc',
    )

    tmux = Dot(
        src='./dots/_tmux.conf',
        dst=HOME + '/.tmux.conf',
    )

    zshrc = Dot(
        src='./dots/_zshrc',
        dst=HOME + '/.zshrc',
    )

    kitty = Dot(
        src='./dots/XDG_CONFIG/kitty',
        dst=XDG_CONFIG + '/kitty',
    )

    nvim = Dot(
        src='./dots/XDG_CONFIG/nvim',
        dst=XDG_CONFIG + '/nvim',
    )

    qtile = Dot(
        src='./dots/XDG_CONFIG/qtile',
        dst=XDG_CONFIG + '/qtile',
        macos=False
    )

    wezterm = Dot(
        src='./dots/XDG_CONFIG/wezterm',
        dst=XDG_CONFIG + '/wezterm',
    )

    alacritty.install()
    bash_profile.install()
    bashrc.install()
    tmux.install()
    zshrc.install()
    kitty.install()
    nvim.install()
    qtile.install()
    wezterm.install()


if __name__ == "__main__":
    main()
