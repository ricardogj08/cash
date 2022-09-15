# cash

A `dialog` curses cash register written in POSIX `sh`.

## Dependencies

* `sh`, `ksh`, `bash` `zsh` or another shell like UNIX.
* GNU Coreutils, BusyBox, Toybox, sbase or another UNIX utilities.
* [dialog](https://invisible-island.net/dialog/) - A tool to display dialog boxes from shell scripts.
* [MySQL](https://www.mysql.com)/[MariaDB](https://mariadb.com) database server.

## Installation

    git clone https://github.com/ricardogj08/cash.git
    cd cash
    sudo cp cash /usr/local/bin
    cp my.cnf "$HOME/.my.cnf"
    chmod 600 "$HOME/.my.cnf"

## Configuration

`$HOME/my.cnf` - Is a file that contains MySQL/MariaDB client options.

## References

* [dialog program documentation](https://invisible-island.net/dialog/manpage/dialog.html)

## License
