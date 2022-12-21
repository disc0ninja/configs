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
        self.linux = macos
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

    def install(self):
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
    bashrc = Dot(
        src='./dots/_bashrc',
        dst=HOME + '/.bashrc',
        linux=True,
        macos=True
    )

    zshrc = Dot(
        src='./dots/_zshrc',
        dst=HOME + '/.zshrc',
        linux=True,
        macos=True
    )

    qtile = Dot(
        src='./dots/XDG_CONFIG/qtile',
        dst=XDG_CONFIG + '/qtile',
        linux=True,
        macos=False
    )

    bashrc.install()
    zshrc.install()
    qtile.install()


if __name__ == "__main__":
    main()
