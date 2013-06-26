# nclipper.vim

## Usage

Start visual mode with `V` and select some lines.

![before](http://gyazo.com/ef8121528e4a269ce894e25c289b489a.png)

Type `<C-y>`

![after](http://gyazo.com/2b56de0c4f7603df7a00e9845704b39c.png)

Now your clipboard or Vim register `"+` has the lines you selected with line numbers. Paste it anywhere you want!

![on skype](http://gyazo.com/5000e1cca5ad81203541fb7e3ce82a50.png)

If you also want to copy the filename in the 1st line, use `<M-y>` (meta + y which is cmd + y on OSX and alt + y on Linux.)

## Author

Tatsuhiro Ujihisa

## Configulation

If you don't want to map `<C-y>`, assign a true value into `g:nclipper_nomap` in your `~/.vimrc`.

    let g:nclipper_nomap = 1

And you can map the functionality on any key like the following example.

    vmap <space>y <Plug>(nclipper)
    vmap <space>Y <Plug>(nclipper-with-filename)

If you want to change the format of yanked string,
you can specify the format with `g:nclipper_format`.
Here is the default value:

    let g:nclipper_format = 'printf("%" . max_len . "d %s", v:key + begin, v:val)'

You can use these variables:

- `v:key`
    - current line's index number
- `v:val`
    - current line's string
- `begin`
    - the first line number
- `end`
    - the last line number
- `max_len`
    - max string length between `begin` and `end`.
    for e.g.: when `begin` is 98 and `end` is 102, `max_len` is 3.
    this value is identical to `len(end)`.
