# nclipper.vim

## Usage

Start visual mode with `V` and select some lines.

![before](http://gyazo.com/ef8121528e4a269ce894e25c289b489a.png)

Type `<C-y>`

![after](http://gyazo.com/2b56de0c4f7603df7a00e9845704b39c.png)

Now your clipboard or Vim register `"+` has the lines you selected with line numbers. Paste it anywhere you want!

![on skype](http://gyazo.com/5000e1cca5ad81203541fb7e3ce82a50.png)

## Author

Tatsuhiro Ujihisa

## Configulation

If you don't want to map `<C-y>`, assign a true value into `g:nclipper_nomap` in your `~/.vimrc`.

    let g:nclipper_nomap = 1

And you can map the functionality on any key like the following example.

    vmap <space>y <Plug>(nclipper)
