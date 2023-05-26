# Dotfiles

This repository contains my personal dotfiles, which are the configuration files for various applications and tools on my system. I use [GNU Stow](https://www.gnu.org/software/stow/) as a convenient tool to manage these dotfiles.

## How to Use

Feel free to utilize these dotfiles in your own setup. GNU Stow simplifies the process of incorporating them into your system. Here's a brief guide on how to get started:

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/jgsn13/dotfiles
   ```

2. Install GNU Stow if you haven't already. Refer to the official [GNU Stow documentation](https://www.gnu.org/software/stow/) for instructions specific to your operating system.

3. Navigate to the cloned repository:

   ```shell
   cd dotfiles
   ```

4. Use GNU Stow to selectively apply the desired dotfiles:

   ```shell
   stow <directory-name>
   ```

   Replace `<directory-name>` with the name of the specific directory containing the dotfiles you wish to use. For example, if you want to apply the dotfiles for the Kitty terminal emulator, use `stow .config/kitty` to symlink the Kitty configuration files to the appropriate locations. 

   You can stow multiple directories or individual dotfiles based on your requirements.

5. Make any necessary adjustments or customizations to the dotfiles according to your preferences.

## Contributing

If you have any suggestions, improvements, or bug fixes for these dotfiles, feel free to open an issue or submit a pull request. I appreciate your contributions!

## License

This repository is licensed under the [GNU General Public License v2.0](LICENSE). You are free to use and modify these dotfiles as per the terms of the GPL-2.0 license.
