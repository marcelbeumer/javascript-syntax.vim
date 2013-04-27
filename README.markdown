#Javascript Syntax for Vim

JavaScript syntax highlighter that does what I want it to do for modern JS development.

I aim to map language features to the proper VIM highlighting identifiers, and make sure it plays nice with my favorite color themes [Molokai](https://github.com/mrtazz/molokai.vim) and [Spacedust](http://github.com/marcelbeumer/spacedust.vim).

The highlighter was initially forked from [this syntax highlighter](https://github.com/jelera/vim-javascript-syntax) and still contains 90% of the regexes. I tried to make the syntax file more readable, removed unwanted DOM/HTML/CSS things, fixed identifier mappings and added a few things such as:

- function name coloring (jsFuncName controlled by hi Function)
- class names (controlled by hi Structure)
- this/that acesss (jsContext and jsContextAccess controlled by hi Special)
- Browser, development and module keywords


Customization
-------------

Tastes and opinions differ. I invite you to fork this repository and make changes in the highlighter or play with options commenting stuff in and out. In case you do, I recommend using the [vim-reload plugin](https://github.com/xolox/vim-reload) to automatically reload your plugins when editing them.

Screenshot
----------

![screenshot](https://raw.github.com/marcelbeumer/javascript-syntax.vim/master/screenshots/syntaxspacedust.png)

Install
-------

Either:

- Copy ftdetect and syntax directories into ~/.vim
- Or use [pathogen.vim](http://www.vim.org/scripts/script.php?script_id=2332)
- Or use the awesome [vundle](https://github.com/gmarik/vundle) plugin manager (recommended)

##Credits

- [Jose Elera Campana](https://github.com/jelera)

