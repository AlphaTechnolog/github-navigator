# Github Navigator

Sample project i did just for learning purposes, i was learning selenium and
then i made this lmao.

This cli program receives the next arguments:

```
$ ./github-navigator --help
usage: github-navigator [-h] [-H] -r REPO
                        [-s SCREENSHOT_PATH]
                        [-b BRANCH] [-R]
                        [-p PATH [PATH ...]]

options:
  -h, --help            show this help message and
                        exit
  -H, --headless        Run in headless mode
  -r REPO, --repo REPO  Repository to navigate to
  -s SCREENSHOT_PATH, --screenshot-path SCREENSHOT_PATH
                        Path to save screenshot
  -b BRANCH, --branch BRANCH
                        Branch to navigate to
  -R, --open-raw        Open raw file
  -p PATH [PATH ...], --path PATH [PATH ...]
                        Path to navigate to inside
                        the repository
```

example of the usage:

```sh
./github-navigator -RHb awesomewm-vertical -r alphatechnolog/dotfiles -p cfg awesome rc.lua -s raw-file-screenshot.png
```

In that command the tool will do this:

- opens github.com
- uses the github search input and types `alphatechnolog/dotfiles`, then it press enter
- it analyzes every link in the results and select the appropiated one, no matters if it's upper case or lower case, and same to your query string.
- opens the right link of the repo
- if you pass the branch it will search for the branch button and click it
- it will wait for branches in the list
- searches for the right branch link and selects it itself
- then it starts analyzing the `-p` parameter which defines the file where the app has to navigate to
- starts navigating throught the folders and files of the repository
- if found `--open-raw` or in this case `-R`, it searchs for the Open in raw mode button
- it clicks it and wait to get the content
- after every step, it takes a screenshot of the current page with the screenshot path specified (it has to be .png btw)
- then it gets the content of the page and removes the headers of the navigator
- after getting the content, it dumps it in a file called `content` which will have the processated content of the file that was specified by `-p`

## Installation

You can use the nix way which will automatize the installation process of the geckodriver and
the python deps (and the python installation too btw lol). Or if you wanna go manual, you can do it
by creating a venv too so it's ok.

### Nix Way

You can run it directly without cloning it.

```sh
nix run github:alphatechnolog/github-navigator -- --help
```

### Manual way

In this way you will need to install the geckodriver (google it yourself ._.) and you need to
have python3 installed too.

```sh
git clone https://github.com/alphatechnolog/github-navigator
cd github-navigator
python -m venv venv
. venv/bin/activate
python -m pip install -r requirements.txt
```

Then to run the program, use:

```sh
./github-navigator --help
```

> And follow the app help lol

## Enjoy

it's just for learning ._. don't do nothing special, it's just satisfying to see how
the navigator gets controlled by itself lol.
