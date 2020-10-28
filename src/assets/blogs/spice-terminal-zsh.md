# How to make an aesthetic cse terminal

From

![Basic bland terminal](assets/images/basic-terminal.png)

to

![Basic bland terminal](assets/images/pretty-terminal.png)

## Assumptions

- you've watched [Tom Kunc's Secrets of CSE workshop]()
- you haven't messed with the cse terminal before, and your login shell is still bash (ie you havent emailed SS to change it)

## Some basic colours :)

So, you want some colours eh?

Simply run the command

```
1511 colours
```

should setup your bash terminal to now be colourful! Make sure to refresh your terminal configuration with

```
source ~/.bashrc
```

in order to see it take effect.

![Basic bland terminal](assets/images/1511-colours.png)

## Powerlevel10k

### What is powerlevel10k?

Powerlevel10k is one of the most popular plugin frameworks for Zsh. It comes with many features and extensions, and allows you to customise nearly everything to your liking. It brags an "out of box" experience, meaning that theres not much setup we have to do get it working :D

![Powerlevel10k](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png)

### What is zsh?

You may be thinking, hold up - what is zsh?

let's take a step back - a terminal is a program that runs a shell - so when you open your terminal in Vlab or elsewhere, a shell is automatically opened, and executed. On CSE Servers, the default login shell is `bash`.

ZSH (aka the Z Shell) - is nothing more than a different shell. So why do we care if we use `bash` vs `zsh` as our shell? What's the difference?

### bash vs zsh

The difference mainly between zsh and bash is that zsh comes with an extended set of features, and many well supported plugin and theme managers, such as powerlevel10k - which we mentioned above. Some of the useful features include:

- command history shared across all running shells, rather than just the current running shell
- better tab completion (zsh cycles through all options, rather than listing them all)
- spelling correction and autofill
- Directory aliases (such as `~` or `..` - you can make your own)
- git command completion and aliases
- path expansionn e.g. Enter cd /u/lo/b, press tab, and it will be completed to cd /usr/local/bin since it is the only matching pattern

Most importantly to us - it allows us to make our terminal LOOK PRETTY

## Installing zsh on CSE

We dont need to do this, its already installed for us :)

## Installing Powerlevel10k

### Installing ohmyzsh

ohmyzsh is a plugin manager for managing zsh configurations. We'll use this to install powerlevel10k soon.

The default location is `~/.oh-my-zsh` (hidden in your home directory, you can access it with `cd ~/.oh-my-zsh`)

To install ohmyzsh - follow the instructions [here](https://github.com/ohmyzsh/ohmyzsh#getting-started), or trust that I'm not trying to hack your computer, and run the following:

```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This will install and setup a default zsh theme, and put some sane presets in `~/.zshrc`

### Installing powerlevel10k

Now that we've got ohmyzsh, we want to install the powerlevel10k theme.

Take a look at the instructions [here] (https://www.smh.com.au/national/nsw/sydney-schools-evacuated-after-threatening-emails-received-20201027-p568zv.html), or trust me again (???) and run

```
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

and then finally, we set the theme (should be on line 11) in our `~/.zshrc`:

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

after you save this, we need to once again make sure to refresh your terminal configuration with

```
source ~/.zshrc
```

in order to see it take effect.

### Ruh Roh - shits broke

OH NO everything is broken :(

If you're looking at something like this (without the first line)

![Broken CSE ZSH](assets/images/zsh-cse-broke.png)

then don't worry - I knew that would break, so lets talk about how to fix it.

You may be wondering "thats strange, I guess we don't have the right version of zsh because powerlevel10k is using a really new version of zsh! The prompt says 5.1, it must be super new for CSE to not support it!"

Well I hate to break it to you folks but ZSH 5.1. was realeased **five years ago** (31.5.2015)

It seems that we're still on a zsh version (5.0.7) from 2014 :(

No fear though! We can fix this :D

## Installing zsh on CSE (round 2)

So, you want the latest version of zsh eh?

We're gonna have to use our broken terminal for now - but it should be nothing more than copying and pasting commands. Enter the following commands one at a time. You'll know when the command is done when you see the little '->' arrow on the bottom left

```
cd ~
wget -O zsh-5-8.tar.xz https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download
tar xf zsh-5-8.tar.xz
cd zsh-5.8
./configure --prefix="$HOME/bin"
make && make install
cd ~
rm -rf zsh-5-8.tar.xz zsh-5-8
```

If succesful, you should see three folders once you navigate to `~/bin` which are (`bin`, `share`, and `lib`).

Then, to make sure that we run OUR version of zsh every time, we add the folllowing to the TOP (!!) of `~/.bashrc`

```
export PATH="$HOME/bin/bin:$PATH";
export SHELL="$HOME/bin/bin/zsh";
export MODULE_PATH="$Home/bin/lib/zsh/5.8/zsh";
exec "$SHELL" -l;
```

Finally, run

```
source ~/.bashrc
```

and you'll be met with the Powerlevel10k configuration wizard (YAY!)

Go through and answer the questions, formatting your terminal to your liking.

Congratulations you now have a pretty terminal!

### Assorted CSE x Powerlevel10k Issues

You have a pretty terminal, but you may start to notice a few issues

#### fetching gitstatusd

@insou22 has kindly provided a script to fix this issue, which you can run using

```
curl https://gitstatus.insou.dev/ | sh
```

followed by

```
source ~/.bashrc
```

This will download `gitstatusd` and ensure that every time we open zsh - the computer knows where to find it, wheras whats happenning currently is that the cache is wiped every time you log off which is #notgood

## Further extensions + customisation

### Plugins!

#### zsh-syntax-highlighting

#### zsh-autosuggestions

#### zsh-z

### Extras

#### exa
