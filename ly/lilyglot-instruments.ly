%%
%% Collection of instrument/vocal names
%% for use with lilyglot.
%%
%% Thomas Richter <thomas-richter AT aon.at>
%% This program is free software. Use, redistribute, and modify it
%% as you wish.
%%
%%
%% This file defines just a selection of important names of instruments
%% and voices, as well as short names with the lower-case form of the
%% respective symbol for use with `\glotInstrument`.
%% Some of the definitionns are uncertain.
%%
%% Languages:
%%  en = English
%%  de = German
%%  it = Italian
%%  fr = French
%%  es = Spanish
%%
%% Sources:
%% *  Leuchtmann, Horst (Hrsg.):
%%    Wörterbuch Musik: engl.-dt., dt.-engl., 2. erw. Auflage,
%%    Verlag Dokumentation, München 1977
%%
%% *  Frans Absil Music - Instrument names and orchestral terms
%%    F.G.J. Absil, 2013.
%%
%% *  IMSLP - Abbreviations for Instruments
%%    http://imslp.org/index.php?title=IMSLP:Abbreviations_for_Instruments&oldid=1169597
%%

\version "2.22.0"


\glotTable #'(
(lang en de it fr es)

(V
  "Voice"
  "Stimme"
  "Voce"
  "Voix"
  "Voz")
(v
  "V."
  "St.")
(S
  "Soprano"
  "Sopran")
(s "S.")
(Mez
  "Mezzo-soprano"
  "Mezzosopran"
  "Mezzosoprano"
  "Messo-soprano"
  #f)
(mez
  "Mez."
  #f
  #f
  "Mes."
  #f)
(A
  "Alto"
  "Alt"
  "Contralto"
  "Alto"
  "Contralto")
(a "A.")
(T
  "Tenor"
  #f
  "Tenore"
  "Ténor"
  #f)
(t "T.")
(Bar
  "Baritone"
  "Bariton"
  "Baritono"
  "Baryton"
  "Baritono")
(bar "Bar.")
(B
  "Bass"
  #f
  "Basso"
  "Basse"
  "Bajo")
(b "B.")

(Ch
  "Choir"
  "Chor"
  "Coro"
  "Choeur"
  "Coro")
(ch
  "Ch."
  #f
  "Coro"
  #f
  "Coro")
(MixCh
  "Mixed choir"
  "gemischter Chor"
  "Coro miste"
  "Choeur mixtes"
  "Coro mixtas")
(FCh
  "Female choir"
  "Frauenchor"
  "Coro femminile"
  "Choeur de femmes"
  "Coro femenino")
(MCh
  "Male choir"
  "Männerchor"
  "Coro maschile"
  "Choeur d'homme"
  "Coro masculino")

(Orch
  "Orchestra"
  "Orchester"
  "Orchestra"
  "Orchestre"
  "Orquesta")
(orch
  "Orch."
  #f
  #f
  #f
  "Orq.")

(Str
  "Strings"
  "Streicher"
  "Archi"
  "Cordes"
  "Cuerdas")
(str
  "Str."
  "Str."
  "Arc."
  "Crd."
  "Crd.")
(Vn
  "Violin"
  "Violine" ; Geige
  "Violino"
  "Violon"
  "Violin")
(vn
  "Vn.")
(VnI
  "Violin 1"
  "1.Violine"
  "1° Violino"
  "1er Violon"
  "1.Violin")
(vni
  "Vn. 1"
  "1.Vn."
  "1°Vn."
  "1er Vn."
  "1.Vn.")
(VnII
  "Violin 2"
  "2.Violine"
  "2° Violino"
  "2e Violon"
  "2.Violin")
(vnii
  "Vn. 2"
  "2.Vn."
  "2°Vn."
  "2e Vn."
  "2.Vn.")
(Vla
  "Viola"
  #f ; Bratsche
  #f
  "Alto"
  #f)
(vla
  "Vla."
  #f
  #f
  "Alto"
  #f)
(Vlc
  "Violoncello" ; Cello
  #f
  #f
  "Violoncelle"
  "Violonchelo")
(vlc
  "Vlc.")
(Cb
  "Double-bass"
  "Kontrabass"
  "Contrabasso"
  "Contrebasse"
  "Contrabajo")
(cb
  "Db."
  "Kb."
  "Cb."
  "Cb."
  "Cb.")

(Hp
  "Harp"
  "Harfe"
  "Arpa"
  "Harpe"
  "Arpa")
(hp
  "Hp."
  "Hf."
  "Ap."
  "Hp."
  "Ap.")

(Wood
  "Woodwinds"
  "Holzbläser" ; Holzblasinstrument
  "Legni" ; Fiati, Strumento a fiato di legno
  "Bois" ; Instrument à vent en bois
  "Instrumento de madera")
(Fl
  "Flute"
  "Flöte"
  "Flauto"
  "Flûte"
  "Flauta")
(fl
  "Fl.")
(Picc
  "Piccolo flute"
  "Piccoloflöte"
  "Flauto piccolo" ; Ottavino
  "Petite flûte"
  "Flautín")
(picc
  "Picc.")
(AFl
  "Alto flute"
  "Altflöte"
  "Flauto contralto"
  "Flûte alto"
  "Flauta alto")
(afl
  "A.Fl.")
(BFl
  "Bass flute"
  "Bassflöte"
  "Flauto basso"
  "Flûte basse"
  "Flauta bajo")
(bfl
  "B.Fl.")
(Ob
  "Oboe"
  #f ; Hoboe
  #f
  "Hautbois"
  #f)
(ob
  "Ob."
  #f
  #f
  "Hb."
  #f)
(EH
  "English horn"
  "Englischhorn"
  "Corno inglese"
  "Cor anglais"
  "Corno inglése")
(eh
  "E.H."
  "Eh.")
(Cl
  "Clarinet"
  "Klarinette"
  "Clarinetto"
  "Clarinette"
  "Clarinete")
(cl
  "Cl."
  "Kl.")
(BCl
  "Bass clarinett"
  "Bassklarinette"
  "Clarinetto basso"
  "Clarinette basse"
  "Clarinete bajo")
(bcl
  "B.Cl."
  "Bkl.")
(Bn
  "Bassoon"
  "Fagott"
  "Fagotto"
  "Basson"
  "Fagot")
(bn
  "Bn." ; Bssn.
  "Fag."
  "Fag."
  "Bon."
  "Fag.")
(DBn
  "Double bassoon" ; Contrabassoon
  "Kontrafagott"
  "Contrafagotto"
  "Contre-basson"
  "Contrafagot")
(dbn
  "D.Bn."
  "Kfag."
  "Cfag."
  "C.Bon."
  "Cfag.")
(Sax
  "Saxophone"
  "Saxophon"
  "Sassofono"
  "Saxophone"
  "Saxofón")
(sax
  "Sax.")
(Har
  "Harmonica" ; mouth-organ
  "Mundharmonika"
  "Armonica a bocca"
  "Harmonica à bouche"
  "Armónica de boca")
(har
  "Har."
  #f
  "Arm."
  #f
  "Arm.")
(Rec
  "Recorder"
  "Blockflöte"
  "Flauto dolce"
  "Flûte à bec"
  "Fluta recta")
(rec
  "Rec."
  "Blkfl.")

(Brass
  "Brass"
  "Blechbläser" ; Blechblasinstrument
  "Ottoni" ; strumento a fiato di ottone
  "Cuivres" ; instrument à vent de cuivres
  "Instrumento de viento-metal")
(Hn
  "Horn"
  "Horn"
  "Corno"
  "Cor"
  "Corno")
(hn
  "Hn."
  "Hr."
  "Cor."
  "Cor"
  "Cor.")
(Crnt
  "Cornet"
  "Kornett"
  "Cornetta"
  "Cornet"
  "Cornetin")
(crnt
  "Crnt."
  "Kor.")
(Flg
  "Flugelhorn"
  "Flügelhorn"
  "Flicorno"
  "Bugle"
  "Fiscorno")
(flg
  "Flg."
  #f
  "Flc."
  "Bug."
  "Fsc.")
(Tpt
  "Trumpet"
  "Trompete"
  "Tromba"
  "Trompette"
  "Trompeta")
(tpt
  "Tpt."
  "Trp."
  "Tr.")
(Tbn
  "Trombone"
  "Posaune"
  "Trombone" ; accr. di tromba
  "Trombone"
  "Tronbón")
(tbn
  "Tbn."
  "Pos."
  "Tbn."
  "Trb."
  "Trb.")
(Tb
  "Tuba")
(tb
  "Tb.")

(Perc
  "Percussion"
  "Schlagzeug"
  "Percussione"
  "Percussion"
  "Percusión")
(perc
  "Perc."
  "Schzg.")
(Mar
  "Marimba"
  "Marimbaphon" ; Marimba
  "Marimbafono"
  "Balafon"
  "Marimbafón")
(mar
  "Mar.")
(Xyl
  "Xylophone"
  "Xylophon"
  "Xilofono" ; Gigelira
  "Xylophone" ; Claquebois
  "Xilofón")
(xyl
  "Xyl."
  "Xyl."
  "Xil."
  "Xyl."
  "Xil.")
(Vib
  "Vibraphone"
  "Vibraphon"
  "Vibrafono"
  "Vibraphone"
  "vibráfon")
(vib
  "Vib.")
(TBell
  "Tubular bells"
  "Röhrenglocken"
  "Campani tubulari"
  "Tubes de cloches"
  "Campanas") ; ?
(tbell
  "T.Bell"
  "Rglk."
  "Camp.T."
  "T.Cloch."
  "Camp.")
(Glsp
  "Glockenspiel"
  "Glockenspiel"
  "Campanelli"
  "Jeu de timbres"
  "Juego de timbres")
(glsp
  "Glsp.")

(Timp
  "Kettledrums"
  "Pauken"
  "Timpani"
  "Timbales"
  "Timbales")
(timp
  "Timp."
  "Pk."
  "Timp."
  "Timb."
  "Timb.")
(Cymb
  "Cymbals"
  "Becken"
  "Piatti"
  "Cymbales"
  "Platillos")
(cymb
  "Cymb."
  "Bck."
  "Ptti."
  "Cymb."
  "Plat.") ; ?
(Dr
  "Drum"
  "Trommel"
  "Tamburo"
  "Tambour"
  "Tambor")
(dr
  "Dr."
  "Tr."
  "Tmb." ; ?
  "Tmb."
  "Tmb.")

(Pf
  "Piano"
  "Klavier"
  "Pianoforte"
  "Piano"
  "Piano")
(pf
  "Pf."
  "Klv."
  "Pfte."
  "Pno."
  "Pno.")
(Hpd
  "Harpsichord"
  "Cembalo"
  "Cembalo"
  "Clavecin"
  "Clavecémbalo")
(hpd
  "Hpd."
  "Cem."
  "Cem."
  "Cla." ; ?
  "Cla.")
(Org
  "Organ"
  "Orgel"
  "Organo"
  "Orgue"
  "Órgano")
(org
  "Org.")
(Acc
  "Accordion"
  "Akkordeon" ; Ziehharmonika
  "Fisarmonica"
  "Accordéon"
  "Acordeóon")
(acc
  "Acc."
  "Akk."
  "Fsa." ; ?
  "Acc."
  "Aco.")
(Gtr
  "Guitar"
  "Gitarre"
  "Chitarra"
  "Guitare"
  "Guitarra")
(gtr
  "Gtr."
  "Git."
  "Chit.")
(EGtr
  "Electric guitar"
  "Elektrische Gitarre"
  "Chitarra elettrica"
  "Guitarre électrique"
  "Guitarra elétrica")
(egtr
  "E.Gtr."
  "E.Git."
  "Chit.e."
  "Gtr.e."
  "Gtr.e.")


;;; Definitions with markup

(ClA
  ,(markup #:center-column ("Clarinet" "in A"))
  ,(markup #:center-column ("Klarinette" "in A"))
  ,(markup #:center-column ("Clarinetto" "in la"))
  ,(markup #:center-column ("Clarinette" "en la"))
  ,(markup #:center-column ("Clarinete" "en La")))
(cla
  "A Cl."
  "A-Kl."
  "La Cl.") ; ?
(ClB
  ,(markup #:center-column ("Clarinet" #:concat ("in B" #:flat)))
  ,(markup #:center-column ("Klarinette" "in B"))
  ,(markup #:center-column ("Clarinetto" "in Si bemolle"))
  ,(markup #:center-column ("Clarinette" "en si bémol"))
  ,(markup #:center-column ("Clarinete" "en si bemol")))
(clb
  "Bb Cl."
  "B-Kl."
  "Sib Cl.") ; ?

;; variable flat symbol using Ekmelily
;; (ClB
;;   ,(markup #:center-column ("Clarinet"
;;     #:concat ("in B" #:general-align Y DOWN #:ekmelic-char -1/2))))

;; alternative instrument
(Tab
  ,(markup #:center-column ("Tablas" "(Bongos)")))
)
