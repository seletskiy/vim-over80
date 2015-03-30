Enable indication of 80 character limit for text by using `cursorcolumn`.

Unfortunately, there are highlighting issues with this approach, in which
background syntax coloring is not applying to the charachers with the same
column number as 'cursorcolumn'; so the hack was made to disable this
highlighting in the case of searching, so matched text located in the
'cursorcolumn' still be visible.
