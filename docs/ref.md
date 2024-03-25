Lilyglot Reference
==================

Lilyglot facilitates multilingual texts identified by symbolic names.
The following markup commands and music functions accept a string as the name
(except for `\glotTocItem` which requires a symbol) and substitute it with the text
corresponding to the name and to the selected lilyglot language.
Note: This is independent of the language selected for music entry.


Commands
--------

### Main settings

    \glotTable #'(
      (lang LANGUAGE ...)
      (NAME TEXT ...)
      ...
    )

Define multilingual texts (as an alist) for use in the current LilyPond
input file. The lists of several `\glotTable` commands are merged together.

*   The special key `lang` specifies the languages of the TEXTs in the
    subsequent entries of this and of each further `\glotTable` command.
    It also clears an already existing table, i.e. it should always be
    the first entry.

*   LANGUAGE (a symbol) is the name of a lilyglot language.
    The first is selected by default.

*   NAME (a symbol) is the name of a multilingual text. It is unique in
    the input file, i.e. it overrides an already defined NAME without warning.

    NAME can then be used with the following commands and Scheme procedures.
    If a specified name is not defined with `\glotTable`, the name itself
    is taken as the text.

*   TEXT (a markup) is the text for the corresponding language in the same order
    as in the `lang` entry. The first text in the entry will be taken
    if TEXT is missing, i.e. if the entry is shorter than the `lang` entry,
    or if TEXT is `#f`.

####

    \glotLanguage LANGUAGE

Select a lilyglot language. LANGUAGE (a string) must have been specified
in the `lang` entry of the `\glotTable` command.
The special value `option` takes the language name from the command line
option `-dglot-language=LANGUAGE`.


### Markup commands

    \glot NAME
    \glot-x ARG NAME

Draw the text identified by NAME as markup.
See the Scheme procedure `glot-xform` below for the meaning of ARG.

    \glot-wordwrap NAME

Draw the text identified by NAME like \wordwrap-string.


### Music functions

    \glotText NAME

Draw the text identified by NAME in italic style as a post-event.

    \glotTempo NAME

Set the text identified by NAME as a tempo specification.

    \glotInstrument NAME

Set the instrument name identified by NAME and the short instrument name
identified by the lower-case form of NAME.
Both are centered according to the indentation.

    \glotTocItem NAME
    \glotTocItemII NAME NAME2

Set the text identified by NAME (concatenated with the text identified
by NAME2) as an item in the table of contents.
NAME is a symbol or a list of symbols, e.g. `WorkA.PartII`, to specify a
hierarchy of toc levels where the last symbol also identifies the text.

    \glotTextSpan LEFT STYLE RIGHT

Set (override) the properties of a text spanner.

*   LEFT (a markup) is the left side (start) of the spanner.
    A string is the name identifying the left text.

*   STYLE (a string) is the line style:

    *   `"line"`: Solid line.
    *   `"dashed-line"`: Dashes.
    *   `"dotted-line"`: Dots.
    *   `""` or `none`: No line.

*   RIGHT (a matkup) is the right side (stop) of the spanner.
    A string is either the name identifying the right text,
    or one of the special values:

    *   `"edge"`: Vertical edge.
    *   `""`: Nothing.


Public Scheme Procedures
------------------------

    glot-string NAME

Return the text identified by NAME (a symbol or string).

    glot-string-x NAME ARG ...

Equivalent to `glot-xform` but with the text identified by NAME
(a symbol or string) for FMT.

    glot-xform FMT ARG ...

Return the formatted output of FMT and ARG ... as a string equivalent
to `(format #f FMT ARG ...)`.
If ARG is a single argument and one of the following symbols,
the case of FMT is converted:

*   `'cap`: Words capitalized.
*   `'uc`: All characters to upper-case.
*   `'ucf`: First character to upper-case.
####

    glot-language

Return the lilyglot language as a list with a single string, or the empty
list if no language is set.
