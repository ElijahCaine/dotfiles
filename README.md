# Dotfiles!

These are some of my dotfiles.

If you end up using any of them and you find an issue, please make an issue or submit a Pull Request.
Heck, even if you've just got a great config you want to share, send it my way.

~ Thanks

## Format

Each file has the following format:

```
#
# Location: /path/to/location/on/disk.conf
#
...
```

Where:

- `#` is the file's comment character.
- `disk.conf` is the name of the file as it is in the repo.
- `...` is the rest of the file's contents.

## Usage

I have this repository cloned locally and symlink (`ln -s /path/to/repo/thing/foo.conf /path/to/config/foo.conf`) to my system.
This means I just update the config in the repo and it's automatically updated in my system.

You can use them however you want, I'm not your dad.
