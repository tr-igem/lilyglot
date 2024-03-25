%% lilyglot - Polyglot support with LilyPond.
%% Copyright (C) 2013-2024  Thomas Richter <thomas-richter@aon.at>
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License at <http://www.gnu.org/licenses/>
%% for more details.
%%
%%
%% File: lilyglot.ily
%% Latest revision: 2024-03-25
%%

\version "2.22.0"


%% Internals

%% Table of multilingual texts.
%% Each entry is a list of strings mapped onto a symbol.
#(define glot-table (make-hash-table))

%% List of supported languages
#(define glot-lang '())

%% Index into glot-lang of the current language
#(define glot-idx 0)

#(define (glot-hash sym size)
  (remainder (symbol-hash sym) size))

#(define (glot-ref name)
  ;; Return the string referred by @var{name} for the current language
  ;; or for the first language if there is no appropriate entry
  ;; or if the entry is #f. Returns #f if @var{name} does not exist.
  (let ((e (hashx-ref glot-hash assq glot-table (if (string? name) (string->symbol name) name))))
    (cond
      ((not e) #f)
      ((< glot-idx (length e)) (or (list-ref e glot-idx) (car e)))
      (else (car e)))))


%% Main settings

glotTable =
#(define-void-function (tab)
  (list?)
  (for-each
    (lambda (e)
      (cond
        ((or (not (list? e)) (> 2 (length e))) '())
        ((eq? 'lang (car e))
          (hash-clear! glot-table)
          (set! glot-lang (cdr e))
          (set! glot-idx 0))
        (else (hashx-set! glot-hash assq glot-table (car e) (cdr e)))))
    tab))

glotLanguage =
#(define-void-function (lang)
  (string?)
  (let* ((l (string->symbol lang))
         (l (if (eq? 'option l)
              (or (ly:get-option 'glot-language) l) l))
         (m (memq l glot-lang)))
    (if m (set! glot-idx (- (length glot-lang) (length m))))))


%% Public scheme procedures

#(define-public (glot-language)
  (if (null? glot-lang)
    '()
    (list (symbol->string (list-ref glot-lang glot-idx)))))

#(define-public (glot-string name)
  (or (glot-ref name) (if (symbol? name) (symbol->string name) name)))

#(define-public (glot-xform str . args)
  (if (= 1 (length args))
    (case (car args)
      ((cap) (string-capitalize str))
      ((uc)  (string-upcase str))
      ((ucf) (string-append
               (string-upcase (string-take str 1))
               (string-drop str 1)))
      (else (format #f str (car args))))
    (apply format #f str args)))

#(define-public (glot-string-x name . args)
  (apply glot-xform (glot-string name) args))


%% Markup commands

#(define-markup-command (glot layout props name)
  (markup?)
  (interpret-markup layout props
    (glot-string name)))

#(define-markup-command (glot-x layout props arg name)
  (string-or-symbol? markup?)
  (interpret-markup layout props
    (glot-string-x name arg)))

%% \ekm-wordwrap-string is a workaround for bug with utf8
%% in \wordwrap-string in 2.24

#(define (ekm-wordwrap-stencils stencils space width dir)
  (define (stencil-len s)
    (interval-end (ly:stencil-extent s X)))
  (define (maybe-shift s)
    (if (= dir LEFT)
      (ly:stencil-translate-axis s (- width (stencil-len s)) X)
      s))
  (if (null? stencils)
    '()
    (let clines ((lines '())
                 (sil stencils))
      (let cwords ((line (car sil))
                   (sl (cdr sil)))
        (if (null? sl)
          (reverse! lines (list (maybe-shift line)))
          (let ((l (if (= dir LEFT)
                     (ly:stencil-stack (car sl) X RIGHT line space)
                     (ly:stencil-stack line X RIGHT (car sl) space))))
            (if (<= (stencil-len l) width)
              (cwords l (cdr sl))
              (clines (cons (maybe-shift line) lines) sl))))))))

#(define (ekm-string->words str)
  (let* ((lines (map
                  (lambda (l)
                    (filter!
                      (lambda (w) (not (string-null? w)))
                      (string-split l #\space)))
                  (string-split str #\newline)))
         (pars (fold
                 (lambda (l par)
                   (if (null? l)
                     (if (null? (car par)) par (cons '() par))
                     (begin
                       (set-car! par (append! (car par) l))
                       par)))
                 (list '())
                 lines)))
    (reverse! (if (null? (car pars)) (cdr pars) pars))))

#(define-markup-command (ekm-wordwrap-string layout props str)
  (string?)
  #:properties ((line-width)
                (word-space)
                (text-direction RIGHT)
                (baseline-skip))
  (stack-lines DOWN 0.0 baseline-skip
    (concatenate
      (map
        (lambda (par)
          (ekm-wordwrap-stencils
            (map
              (lambda (w) (interpret-markup layout props w))
              par)
            word-space line-width text-direction))
        (ekm-string->words str)))))

#(define-markup-command (glot-wordwrap layout props name)
  (markup?)
  (interpret-markup layout props
    (make-ekm-wordwrap-string-markup (glot-string name))))


%% Music functions

glotText =
#(define-music-function (name)
  (markup?)
  #{ - \markup { \italic \glot #name } #})

glotTempo =
#(define-music-function (name)
  (markup?)
  #{ \tempo \markup { \glot #name } #})

glotTextSpan =
#(define-music-function (left style right)
  (markup? string? markup?)
  #{
    \override TextSpanner.style =
      #(if (string-null? style) 'none (string->symbol style))
    \override TextSpanner.bound-details.left.text =
      #(if (string? left) (glot-string left) left)
    \override TextSpanner.bound-details.right.text =
      #(cond
        ((not (string? right)) right)
        ((string-null? right) #f)
        ((equal? "edge" right) #{
          \markup { \path #0.1 #'((moveto 0 0) (rlineto 0.5 0) (rlineto 0 -0.75)) }
        #})
        (else (glot-string right)))
    \override TextSpanner.bound-details.left-broken.text = ##f
    \override TextSpanner.bound-details.right-broken.text = ##f
    \override TextSpanner.bound-details.right.padding = #0
  #})

glotInstrument =
#(define-music-function (name)
  (markup?)
  (let ((long (/ (or (paper-variable #f 'indent) 20) 2))
        (short (/ (or (paper-variable #f 'short-indent) 10) 2)))
    (make-music
      'SequentialMusic
      'elements
      (list
        (make-music
          'ContextSpeccedMusic
          'context-type 'Staff
          'element
          (make-music
            'PropertySet
            'symbol 'instrumentName
            'value (markup #:hcenter-in long #:glot name)))
        (make-music
          'ContextSpeccedMusic
          'context-type 'Staff
          'element
          (make-music
            'PropertySet
            'symbol 'shortInstrumentName
            'value (markup #:hcenter-in short #:glot (string-downcase name))))))))

glotTocItem =
#(define-music-function (name)
  (symbol-list-or-symbol?)
  (add-toc-item! 'tocItemMarkup
    (glot-string (if (pair? name) (car (last-pair name)) name))
    name))

glotTocItemII =
#(define-music-function (name name2)
  (symbol-list-or-symbol? symbol?)
  (add-toc-item! 'tocItemMarkup
    (string-append
      (glot-string (if (pair? name) (car (last-pair name)) name))
      (glot-string name2))
    name))
