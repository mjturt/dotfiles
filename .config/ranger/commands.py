#┃ ~/.config/ranger/commands.py
#┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

from ranger.api.commands import *
import os

class count_size(Command):
    """:count_size <filename>

    Count size of selected directory(du -sh)
    """
    def execute(self):
        import subprocess
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            target_filename = self.fm.thisfile.path

        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return
        else:
            command = subprocess.check_output(["du", "-sh"]+target_filename.split(), universal_newlines=True).strip()
            self.fm.notify("Size: " + command)
            return

    def tab(self):
        return self._tab_directory_content()

class empty(Command):
    """:empty

    Empties the trash directory ~/.trash
    """

    def execute(self):
        self.fm.run("rm -rf /home/mjt/.trash/{*,.[^.]*}")
        self.fm.notify("Trash emptied")
        return

class shebang(Command):
    """:shebang <type> <file>

    New script
    """

    def execute(self):
        script_type = self.rest(1)
        script_name = self.rest(2)
        self.fm.run("shebang " + script_type + " " + script_name)
        return

class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
                    -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
                    -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


