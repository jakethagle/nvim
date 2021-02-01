import neovim
import os


@neovim.plugin
class Main(object):
    def __init__(self, vim):
        self.vim = vim

    @neovim.function('loadDirectories')
    def loadDirectories(self, args):
        # self.vim.command('echo "hello from DoItPython"')
        print(os.curdir())
        # TODO: Get the root project dir and loop through 
        # on all directories that have some target file package.json .git whatever
        # set the g:WorkingDirecotries = [all the dirs you find]
