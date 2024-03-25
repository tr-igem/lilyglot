%%
%% Sample for lilyglot
%%
%% This is taken from:
%% Ekmelischer Satz für Streichquartett, by Franz Richter Herf
%% with some modifications, e.g. quarter tones instead of sixth tones
%% to allow compilation without the Ekmelily extension.
%%

\version "2.22.0"
\language "deutsch"

\include "lilyglot.ily"


%% Definitions of multilingual texts

\glotTable #'(
  (lang en de)

  ;; text for header variable "subtitle" (glot-string)
  (subtitle
    "for string quartet"
    "für Streichquartett")

  ;; text for paragraph (\glot-wordwrap)
  (description
    "In the first and the last part of this quadripartite movement,
    floating sounds are used."
    "Im ersten und im letzten Teil dieses vierteiligen Satzes werden
    schwebende Klänge verwendet.")

  ;; long and short instrument names (\glotInstrument)
  (VnI
    "Violin 1"
    "1.Violine")
  (vni
    "Vn. 1"
    "1.Vn.")
  (VnII
    "Violin 2"
    "2.Violine")
  (vnii
    "Vn. 2"
    "2.Vn.")
  (Vla
    "Viola")
  (vla
    "Vla.")
  (Vlc
    "Violoncello")
  (vlc
    "Vlc.")

  ;; tempo specification (\glotTempo)
  (modslow
    "Moderately slow"
    "Mäßig langsam")

  ;; articulation "molto legato" (\glotText)
  (verysmoothly
    "very smoothly"
    "sehr sanft")

  ;; start of a text spanner (\glotTextSpan)
  (slowlyforceful
    "slowly more forceful"
    "langsam kräftiger")
)


%% Selection of the current language

\glotLanguage en
% \glotLanguage de


%% Score with multilingual elements

\book {
  \header {
    composer  = "Franz Richter Herf"
    title     = "Ekmelischer Satz"
    subtitle  = #(glot-string 'subtitle)    %% <-
  }

  \paper {
    indent = 20 \mm
    short-indent = 11 \mm
    ragged-last = ##t
  }

  \markup { \column {
    \vspace #2
    \override #'(line-width . 40)
    \glot-wordwrap description      %% <-
    \vspace #3
  }}

  \score {
    <<
      \new Staff \relative c''' {
        \glotInstrument VnI      %% <-
        \numericTimeSignature
        \clef G
        \glotTempo modslow      %% <-
        \time 4/4 R1 R \tuplet 3/2 { r4 r aih~ \pp } aih2~  aih1~
        \time 5/4 aih1~ ^ \glotText verysmoothly      %% <-
        \< aih8 \p gisih
        \time 4/4 aih1~ aih2~ aih8 gih aih4
      }

      \new Staff \relative c'' {
        \glotInstrument VnII      %% <-
        \numericTimeSignature
        \clef G
        R1 R \tuplet 3/2 { r4 des2~ } des2~ des1~ des~ des4~
        des1:32~ des:
      }

      \new Staff \relative c' {
        \glotInstrument Vla      %% <-
        \numericTimeSignature
        \clef C
        R1 R feh~ \pp
        \glotTextSpan slowlyforceful line edge      %% <-
        feh~ \startTextSpan feh~ feh4~
        feh2~ feh8 \p geseh \stopTextSpan feh4~ feh1
      }

      \new Staff \relative c {
        \glotInstrument Vlc      %% <-
        \numericTimeSignature
        \clef F
        %% Note: "pizz." without a defined multilingual text
        %% is simply drawn in italic style
        c4 ^ \glotText "pizz."
        c aeh'2 r2 c,4 c aeh'2 c,4 c aeh'2 c,4 c r4 aeh'2 c,4 c
        r aeh' c, c aeh'2 c,4 c
      }
    >>

    \layout { }
  }
}
