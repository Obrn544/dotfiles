# [Gh0stzk dotfiles](https://github.com/gh0stzk/dotfiles) for ubuntu

## 💾 Installation:

> [!IMPORTANT]
> The installer only works for **Ubuntu 24** or latest versions.

<b>Open a terminal in HOME</b>

- **First clone the repository**

```sh
git clone https://github.com/Obrn544/dotfiles.git
```

- **Enter the dotfiles folder**

```sh
cd dotfiles
```

- **Move the RiceInstaller file to HOME**

```sh
mv RiceInstaller ~
```

- **Return to the main directory (HOME)**

```sh
cd ~
```

- **Now give it execute permissions**

```sh
chmod +x RiceInstaller
```

- **Finally run the installer**

```sh
./RiceInstaller
```

> [!NOTE]
> If you want, you can delete the dotfiles folder

```sh
rm -rf dotfiles
```

## ⌨️ Very useful keybindings to know...

| Keys                                                                                                                                                                                                     | Action                                                                |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------- |
| <kbd>super</kbd> + <kbd>Enter</kbd><br><kbd>super</kbd> + <kbd>alt</kbd> + <kbd>Enter</kbd>                                                                                                              | Open a terminal<br>Open a floating terminal.                          |
| <kbd>alt</kbd> + <kbd>@space</kbd>                                                                                                                                                                       | Display menu to select a theme.                                       |
| <kbd>super</kbd> + <kbd>@space</kbd>                                                                                                                                                                     | Apps Menu.                                                            |
| <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>w</kbd>                                                                                                                                                         | Opens a menu to select a wallpaper.                                   |
| <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>h</kbd><br><kbd>super</kbd> + <kbd>alt</kbd> + <kbd>u</kbd>                                                                                                     | Hides bar/s<br>unhide bar/s                                           |
| <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>s</kbd>                                                                                                                                                         | Takes screenshot.                                                     |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>[plus,minus,t]</kbd>                                                                                                                                             | Changes transparency on focused window.                               |
| <kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>p</kbd><br><kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>r</kbd><br><kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>k | Power off computer<br>Restart computer<br>Brute kill a window/process |
| <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>r</kbd>                                                                                                                                                         | Restart bspwm.                                                        |
| `alt` + `F1`                                                                                                                                                                                             | Show keybinds cheatsheet                                              |

And more.. You need to look sxhkdrc file for more, or press Alt + F1 for a cheatsheet.

---

## ⚠️ Possible errors

> [!WARNING]
> If you can't change the brightness intensity, please follow the steps below

- **Create a udev rule file**

```sh
sudo nano /etc/udev/rules.d/90-backlight.rules
```

- **Add the following line**

```sh
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod 666 /sys/class/backlight/intel_backlight/brightness"
```

- **Restart the udev service**

```sh
sudo udevadm control --reload-rules
```

```sh
sudo udevadm trigger
```

- **Restart your computer to verify that it is working properly.**
