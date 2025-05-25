# dotfiles

Managed by [`stow(8)`](https://www.gnu.org/software/stow/).

[Quickstart info](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) via `info stow`

## templated colorschemes

Uses [pollen](https://docs.racket-lang.org/pollen/) preprocessor to populate
a few stylesheets from a single place.

Root `pollen.rkt` contains `rrggbb` triplets for a `base16` colorscheme. These are used inside several stylesheets through pollen preprocessor.

Update using `make apply-colors`.
