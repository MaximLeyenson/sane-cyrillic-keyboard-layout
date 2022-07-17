# sane-cyrillic-keyboard-layout

Providing sane phonetic cyrillic keyboard layout for the Linux terminal

**Synopsis** 

  *  use v for Cyrillic в 
  *  use ' for Cyrillic ь 
  *  use ; for Cyrillic ж 


**Usage** 

```bash
$ru
```

**Installation for one user**
```bash
   $ mkdir -pv ~/bin
   $ cd ~/bin/
   $ git clone  https://gitlab.com/maxim.leyenson/sane-cyrillic-keyboard-layout
```

and then add the lines

   ```bash
   PATH=$PATH:$HOME/bin/sane-cyrillic-keyboard-layout
   export PATH
   ```
to your .bashrc file.

Under the BSD 4-clause license

