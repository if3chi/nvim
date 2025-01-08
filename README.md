# 💤 If3chi Nvim Config

Neovim's configurations are located under the following paths, depending on your OS:

| OS                   | PATH                                      |
| :------------------- | :---------------------------------------- |
| Linux, MacOS         | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)        | `%userprofile%\AppData\Local\nvim\`       |
| Windows (powershell) | `$env:USERPROFILE\AppData\Local\nvim\`    |

- Make a backup of your current Neovim files:

  ```sh
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

#### Clone the repo

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/if3chi/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/if3chi/nvim.git %userprofile%\AppData\Local\nvim\
```

If you're using `powershell.exe`

```
git clone https://github.com/if3chi/nvim.git $env:USERPROFILE\AppData\Local\nvim\
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```
