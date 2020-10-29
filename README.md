# Dotfiles

> _These are my dotfiles. There are many like them, but these ones are mine._

## What are they?

**TL;DR**: Configuration files for programs/commands in UNIX-like Operating
Systems (like GNU/Linux).

Assume for a moment you want to configure a program (e.g. change the default
background color of your terminal emulator). It's certainly doable... but
where are those changes saved?

In UNIX and its derivatives [everything is a file], and naturally, when you
configure a program, that config is saved in a file, which is located in the
your home directory (`$HOME`, aka `~`, aka `/home/<your username>/`).

[everything is a file]: https://en.wikipedia.org/wiki/Everything_is_a_file

You don't want those files and directories to be visible by default: Someone
may mess with them or delete them by mistake. Hiding them from the common
sight sounds like a good idea.

In UNIX-like OSs, files whose name start with a dot (`.`) are hidden by
default. This behavior wasn't intended, it a happy accident from the
programmers of the original UNIX, and was subsequently inherited by UNIX
derivatives. Rob Pike wrote on the [origin of dot file names].

[origin of dot file names]: http://xahlee.info/UnixResource_dir/writ/unix_origin_of_dot_filename.html

That's where the name _dotfiles_ comes from.

## Where do they live?

**TL;DR**: In `$XDG_CONFIG_HOME` if they're cool. `$HOME` otherwise.

In ancient times (from the 70's up to early 2000's), user-wide configurations
lived in hidden files and directories directly under `$HOME`, like
`/home/user/.vimrc` and `/home/user/.mutt/`, respectively. This worked, but
you could end up with a lot of hidden files in your home directory.

Then someone came with a brilliant idea: _Why don't we standardize user
directories?_ And that's how the [XDG Base Directory Specification] was born.

[XDG Base Directory Specification]: https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

The XDG spec says that user configs must be located inside the
`$XDG_CONFIG_HOME`, which defaults to `$HOME/.config/` (aka
`/home/user/.config/`). With this, almost all config files are organized under
one directory.

## Install instructions

Download the repository, change the current working directory to the repo, run
the script:

```sh
git clone <git-repo-url> .dotfiles
cd .dotfiles
./install.sh
```

## Ansible

```sh
sudo apt-get --yes install ansible
ansible-playbook --ask-become-pass local.yml
```

## License

This work is under the UNLICENSE - see the [UNLICENSE] file for details.

[UNLICENSE]: UNLICENSE
