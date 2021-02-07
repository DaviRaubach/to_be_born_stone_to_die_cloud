\version "2.19.82"

\paper {
  %#(set-paper-size "a4landscape")
  print-page-number = ##t
    print-first-page-number = ##t
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    oddFooterMarkup = \markup {
      \fill-line { \pad-around #2
        \on-the-fly \print-page-number-check-first
        \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
    
  system-system-spacing = #'((basic-distance . 27)
       (minimum-distance . 1)
       (padding . 1)
       (stretchability . 1))
  
  
  top-margin = 12
  left-margin = 12
  right-margin = 12
  bottom-margin = 8

%annotate-spacing = ##t 
}

\layout {
 

   
  \context {
   
   
  % \Score
%   \override VerticalAxisGroup.staff-staff-spacing =
%     #'((basic-distance . 3)
%        (minimum-distance . 1)
%        (padding . 1)
%        (stretchability . 1))
  
   \RemoveEmptyStaves
    % \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #1
  }
}


\header {
  title = "nascer pedra, morrer nuvem"
  dedication = "para Eric Moreira"
  composer = "Davi Raubach"
  arranger = " "
  tagline = ##f
  footer = "borning stone, dying cloud"
  maintainerEmail = "raubachdavi@gmail.com"
}

global = {
  
   %diminuir fonte dinâmica
  \override Score.DynamicText.font-size = #-0.5

  %números na métrica de compasso
  \override Staff.TimeSignature #'style = #' numbered

  %pausas com haste
  \override Score.Stem.stemlet-length = #0.75
  \override TupletNumber.text = #tuplet-number::calc-fraction-text

  %tamanho fonte da métrica
  \override Staff.TimeSignature.font-size = #-0.6

  % linhas de crescendo com desenho diferente
  %\override Hairpin.stencil = #flared-hairpin

  %linhas de crescendo cruzando barra de compasso
  \override Hairpin.to-barline = ##f
  \key c \major
  %ligaduras
  \override Tie.layer = #-2
  \override Staff.TimeSignature.layer = #-1
  \override Staff.KeySignature.layer = #-1
  \override Staff.TimeSignature.whiteout = ##t
  %\override Staff.KeySignature.whiteout = ##t
  
  % cordas fora da pauta
  \override StringNumber.outside-staff-priority = #1
  
  
  %casa-x: indicação de casa
#(define-markup-command (casa-x layout props text) (markup?)
  #:properties ()
  "Draw a double box around text."
  (interpret-markup layout props
    #{\markup \fontsize #-2 { #text } #})) 

}
pestaninhaIV = \markup \concat {
  \combine
  \fontsize #-2 \roman C 
  \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0) 
  \fontsize #-2 " IV"
} 
pestaninhaV = \markup \concat {
  \combine
  \fontsize #-2 \roman C 
  \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0) 
  \fontsize #-2 " V"
} 
pestaninhaVII = \markup \concat {
  \combine
  \fontsize #-2 \roman C 
  \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0) 
  \fontsize #-2 " VII"
} 
pestaninhaIX = \markup \concat {
  \combine
  \fontsize #-2 \roman C 
  \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0) 
  \fontsize #-2 " IX"
} 
pestaninhaXII = \markup \concat {
  \combine
  \fontsize #-2 \roman C 
  \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0) 
  \fontsize #-2 " XII"
} 
glissandoSkipOn = {
  \override NoteColumn.glissando-skip = ##t
  \hide NoteHead
  \override NoteHead.no-ledgers = ##t
}
glissandoSkipOff = {
  \revert NoteColumn.glissando-skip
  \undo \hide NoteHead
  \revert NoteHead.no-ledgers
}
subito = \markup { \fontsize #-2 \italic \center-align "subito"}
half = \markup {\fontsize #-3 \note-by-number #1 #0 #0.9 }
dottedquarter = \markup {\fontsize #-3 \note-by-number #2 #1 #-0.9 }
xMark = \markup {\fontsize #-3 \override #'(style . cross) \note-by-number #2 #0 #0 }
Rdo = {
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \override NoteHead.text = \markup {
    %\combine
      %\halign #3 \draw-line #'(0 . 3)
        \fontsize #2 \musicglyph "arrowheads.close.11"
  }
}
hideStaff = {\stopStaff \startStaff \omit Staff.StaffSymbol}
showStaff = {\stopStaff \startStaff \undo \omit Staff.StaffSymbol}
upper = \relative c'' {
  \global
  
  
  \override StringNumber.font-size = #-5.5
  \set Staff.connectArpeggios = ##t
  \set stringNumberOrientations = #'(up)
  \override NoteHead.style = #'harmonic-mixed
  %\override Stem.stencil = #ly:stem::print 
\tempo 4 = 52 
\time 4/4 s1

\time 3/4 s2. 
\shape #'(((0 . 0.5) (0 . 2) (0 . 2) (0 . 2))
          ((0 . 4) (0 . 3) (0 . 5) (0 . 1))) PhrasingSlur
\time 2/4 <as\6 g\3 >2\(\f \laissezVibrer
\time 6/8 s16 \pppp \< s16 s8 s8 s8 s8 s8
s8 s8 s8 s8 s8 s8\mf\>\break
s8 s8 s8 s8 s8 s8\p

\time 3/8 s4.
\time 5/8 s16\< s8 s8 s8\mf s8 \> s16
\time 2/4 \tuplet 3/2 {s8 s8 s8\mp} s4
\time 2/4 <d,\4 e\5>2\)\f\laissezVibrer
\time 8/8 s1
s1
\time 3/8 s4.\mp
s4.\<
\time 2/8 s4\mf
\time 3/4 s4.\> s8\p s4
\time 4/4 <a\5 b\6>2\f <gis'\6 a\5>2\f~ 
1
\time 3/4
s8\pppp\< s8 s8 s8 s8 s8 
\once \omit Staff.TimeSignature
\time 1/4 s8 s8\mf
\once \override Score.BarNumber.Y-offset = 3
\once \omit Staff.TimeSignature

\time 4/4 s1
\time 3/16 s8. \revert NoteHead.style
\time 8/8 \override Hairpin.stencil = #constante-hairpin

dis8\2\mp\<\glissando [ \glissandoSkipOn  8 8 8 8 8 8 8 ]
     
\time 6/8 \glissandoSkipOff eeh8 \glissando \glissandoSkipOn 8 8 8 8 \glissandoSkipOff dis8\!
dis8 [8 8 8 8 16] s16
\time 4/8 s2
\revert Hairpin.stencil
\time 6/8 dis8_\markup \center-align { \italic subito }\p\<  [e-0 dis\mf\> b g-0 bes\mp]
\time 4/8 bes8 [8 8 8 \time 6/8 8 8 8 8 8 8]
\time 4/8 \slurDown a16 (bes8) g16-0~ g8-0 g-0 
\time 8/8 \stemDown d-0 [d d d \once \hide Accidental d d d d]
a8\rest d8 [8 8 8 8 8 
16] s16 
\time 3/4 ees16\mf\6^"L.V." [a\5 d,-0 ees]
g-0 [ees16 a d,] ees g b8\rest
\compoundMeter #'((3 4) (1 8))
 ees,16\mp\<\6^"L.V." [d-0 ais'\5 b-0] 
 f'\f\>\3 e-0 f b, \stemUp ais\mp [d,]   
\override TupletBracket.X-positions =#'(0.2 . 4.2)
\tuplet 3/2 8 {ees r8} s8 
 \time 1/4 ees16\mf\<^"L.V."\5 d-0 ais'\3 b-0 

\override NoteHead.style = #'harmonic-mixed

 \compoundMeter #'((3 2 8))
 \stemUp e'16\rest\mf gis,8.~\6 8~4
 \time 1/4 <g\3 a\4>4\laissezVibrer
 \time 8/8 s1
 \time 3/8 s4.
 s4.
 s4.
 \time 7/8 s2 s4.
     \footnote "***)" #'(0 . 1) \markup 
     \magnify #0.9
     \column {\override #'(line-width . 108)
  \null
  \justify-string #"***) Here starts a ''cross fade'' section. The notes articulated convencionaly fade out quite gradually and the noise of the fingers scraping the strings fade in."} Staff.TimeSignature
     
\compoundMeter #'((5 5 16))
 s4. s4
 s4. s4
 s4. s4
 s4. s4
 s4. s4
 s4. s4
 s4. s4
 s4. s4
 \time 6/8
 s4. s4.
 s4. s4.
 s4. s4.
 \override Score.BarNumber.Y-offset = 3

\time 4/4
s1
s1
s1
\time 6/4 s1 s2
\time 4/4
s1
\time 5/4
s1 s4
\time 4/4
s1
s1
s1
s1
s1
s1
\time 6/4 s1 \showStaff s2 
\override Voice.NoteHead.style = #'harmonic-mixed

\bar "||"
\undo \hide Stem

\time 3/8 <a\4 g\3>4.^\f~
\time 6/4
<a g>2^\markup {L.V. \italic sempre (possible)} <e\5 gis\6>4.^\f\laissezVibrer g'4.^\mp\3 fis4\2
\time 3/8 <d,\4 e\5>4.^\f~
\time 6/4 <d e>2 <gis\6 a\5>4. \laissezVibrer g'4.^\mp fis4 
\time 3/8 <d,\4 gis\6>4.~^\markup {\dynamic f "etc."}
\time 4/4 <d gis>2 <gis\6 a\5>2 ^\pestaninhaIV
\break
  % \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details 
  % #'((Y-offset . 27))
  % \break
  
<b,\6 a'\4 fis'\2>2^\pestaninhaVII \arpeggio
<cis'\5 d\4>2 
\time 3/8 <gis\6 g'\3>4. \laissezVibrer
\time 2/4 \tuplet 3/2 { r8 <cis\5 fis\4>4^\pestaninhaIV \laissezVibrer} \tuplet 3/2 { r8 <cis!\5 d\4>4~ }
\time 4/4 <cis d>2
<e,\6 d'\4>2 \once \override LaissezVibrerTie.direction = ##f 
<e,\6 d'\4 >2\arpeggio \laissezVibrer   gis'\6 \laissezVibrer
\break
<e\5 a\4 d\3>1^\pestaninhaVII 

      % \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details 
  % #'((Y-offset . 48))
     %  \break
\once \override Staff.Arpeggio.X-offset = #-1
\time 6/8 <e,\6 d'\4 g\3>4. ^\pestaninhaV  \laissezVibrer \arpeggio gis'4.\6 \laissezVibrer
\once \override LaissezVibrerTie.direction = ##f
\time 5/8 <a,\5 b'\2 e\1>4^\pestaninhaXII \laissezVibrer s4.
\time 6/8 <e\6 a!\5 g'\3>2.^\pestaninhaXII \arpeggio \laissezVibrer
\time 4/4 s1
\break
\time 3/8 <g'\3 cis\5>4.~
\time 4/4 <g cis>2 b2\6
  
     %  \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details 
  % #'((Y-offset . 71))
    %   \break
      
<cis\5 b\2>2 <cis\5 d\4>2 
<e,\5 a\4 fis'\2>2^\pestaninhaVII \arpeggio
<a\5 d\4 b'\2>2^\pestaninhaV \once \override LaissezVibrerTie.details = #'((center-staff-line-clearance . 3)(note-head-gap . 0.5))
<gis\6 fis'\4>4.^\pestaninhaIX \laissezVibrer
g <gis\6 cis\5 fis\4>4^\pestaninhaIV
<cis\5 d\4>2 <e,\6 g'\3>2^\pestaninhaV
r8 <gis\6 a\5>4. <e\5 gis!\6>2 \laissezVibrer
s2.
s1
s1
s1
\revert NoteHead.style

e1\1
}
middle = \relative c' {
  \set stringNumberOrientations = #'(down)
  \override StringNumber.font-size = #-6
  \set Staff.connectArpeggios = ##t
  \set Staff.midiMinimumVolume = #0.6
  \set Staff.midiMaximumVolume = #0.8
  \global
  s1 
  s2.
  s2 
  
  \stemUp %\once \override Voice.Beam.positions = #'(8.3 . 8.3)
  f'16\rest  \set stringNumberOrientations = #'(up) as,8\1 [as as as as \tieUp as16~]
  
  \override Accidental.hide-tied-accidental-after-break = ##t

  as16 [  \set stringNumberOrientations = #'(up) as8 as as as as \tieUp as16~]
  
  as16 [  \set stringNumberOrientations = #'(up) aes8 aes aes aes aes \tieUp aes16~]
  

  aes16 aes8 g8 e16-0~
  
  e-0 [ e8 g] as [g e16~]
  
  \once \override Voice.TupletBracket.direction = #up
  \tuplet 3/2 {e4 e8\laissezVibrer} s4
  s2
  
  c'16\rest e,8[\2\glissando \glissandoSkipOn e8 e8 e8 e8 e8 e8 \glissandoSkipOff feh16~]
  
  %\once \override Voice.Beam.positions = #'(6.7 . 6.7)
  feh16\glissando \glissandoSkipOn  e8 e8 e8 e8 e8 e8  \glissandoSkipOff e! e16^0\laissezVibrer
  
  \once \override Voice.Beam.positions = #'(6 . 4)
  b'8\rest [e,8.^0 b16^0] 
  
  \once \override Voice.Beam.positions = #'(4 . 5)
  f'8\rest [b,^0 dis]
  
  \once \override Voice.Beam.positions = #'(7.7 . 4)
  e'16\rest e,8^0 [c16\3] 
  \stemDown
  \once \override TupletBracket.X-positions =#'(0 . 4.2)
		\tuplet 3/2 {r8 \tieDown a4~}   \once \override TupletBracket.X-positions =#'(0 . 4.2)
 \tuplet 3/2 4 {a4 g8~} g4
  
  r4. c4.\3\mp \laissezVibrer b4\mp \laissezVibrer
  s1
  \once \override Voice.Beam.positions = #'(8.3 . 8.3)
  \stemUp 
  
  f''16\rest \set stringNumberOrientations = #'(up) a,8\1 [a a a a a] s8
  \once \hide Stem
  
a16
  \hideStaff
  \once \omit Staff.Clef
  s1
  \showStaff
  \clef "treble_8"
 s8.
 
  <<
    {d,,16\rest \stemDown cis'8\3 [8 8 8 8 8 8 16~]
 16 8 8 8 8 8 16 
 \stemDown
  a16\rest cis8 [8 8 8 8 ]  
 c16\rest
      
      
      % \override Hairpin.stencil = #constante-hairpin
%      dis,8\2\mp\<\glissando [ \glissandoSkipOn  8 8 8 8 8 8 8 ]
%      \glissandoSkipOff eeh8 \glissando \glissandoSkipOn 8 8 8 8 \glissandoSkipOff dis8\!
%      
    }
    
    \new Staff = "ruidoI" \with {
      \override VerticalAxisGroup.staff-staff-spacing =
 #'((basic-distance . 10)
      (minimum-distance . 1)
      (padding . 1)
      (stretchability . 1))
      alignAboveContext = #"electrostaff"}
    {
      \override NoteHead.style = #'slash
      \numericTimeSignature
      \stopStaff
      \hide Staff.Clef
      r2
      \override Hairpin.stencil = #flared-hairpin \footnote "*)" #'(1 . 0) \markup  \magnify #0.9 \column {\override #'(line-width . 108)                                                                                    
  \null
  \justify-string #"*) Ruído das cordas: raspar lateral do polegar e/ou parte da m.d. sobre as cordas 6, 5 e 4 com movimentos curtos. Cada semicolcheia indica dois movimentos (para um lado e para outro), cada movimento corresponde a uma fusa."}
b'16:32\ppp\<
      
[\hide Staff.NoteHead 16:32 16:32 16:32 16:32 16:32 16:32 16:32 ] 16:32 [ 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32\f] 
 
\revert NoteHead.style 
 
    } 
  >> 
   %^\markup \musicglyph #"noteheads.s2slash"
 \stemDown 
 r2 r16 cis,8 g-0 cis bes\4   \override NoteHead.style = #'harmonic-mixed
 a\5 \tieDown a16\laissezVibrer
 r16 a8 a a a] a [a a a a] c16\rest
\revert NoteHead.style
\once \override Voice.Beam.positions = #'(-5 . -4) r8 [aes8] \slurUp f16 (e8) ees16~
<<
{\stemUp ees16  8 ^"(optional bend)" \glissando \glissandoSkipOn 8 8 \glissandoSkipOff dih8\glissando \once \hide Accidental \glissandoSkipOn eeh8 8 8 \glissandoSkipOff eeh!16~
16 ees8 8 8 8 8 8 8 c'16\rest}

\new Staff \with { 
      alignAboveContext = #"electrostaff"}
    {
      \override NoteHead.style = #'slash
      \numericTimeSignature
      \omit Staff.StaffSymbol
      \override Staff.NoteHead.no-ledgers = ##t
      \omit Staff.Clef
      \override Hairpin.stencil = #flared-hairpin
      \stemDown 
      b'16:32\ppp\<
      
[\hide Staff.NoteHead 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 16:32 
% \shape #'(
%            ((0 . -2) (0 . -3) (0 . 13) (0 . 12))
%            ((-1 . 0) (0 . 0.3) (0 . -1) (-0.5 . -0.5))
%            ) Slur
\slurDown 16:32\f(] 
\stopStaff
%\once \omit Staff.TimeSignature 
\hide Staff.TimeSignature
\change Staff = "violao" 
\stemUp
\override NoteHead.style = #'harmonic

\voiceOne 
\tieUp a2.)^\f~ \autoBeamOff 8.   
\override NoteHead.style = #'slash \stemDown 
d,,16-> \sf
    s2 s8 \tupletDown \tuplet 3/2 8 {16\f [16 16]}
    s2 s8 \tuplet 3/2 8 {g,16\rest 16\f [16]} 8
    }
    
>>
 \revert Hairpin.stencil

s4 s4. s4 s4
e'''16\rest a,8 [8 8 8 8 8 8 16~]
16 bes8 aes e16~-0 16 c8\3 bes g16~8 ees8 \slurNeutral c16  (des16 bes8) [8\> 8 8\pp] 8\< [8 8\f]
s4 s4.
s4 s4.
s4 s4.
s4 s4.
s4 s4.
s4 s4.
s4 s4.
s4 s4.
s4. s4.
s4. s4.
s4. s4.
s1 s1 s1 s1 s2
s1 s4 s1 
s1 s1 s1 s1 s1 s1 
s1 s2


  \revert NoteHead.style
  r4.
  r4. f''4.\mp  e2.^0
  r4. 
  r4. c4.\mp b2. 
  r4. 
  r4.  
  \once \override Tie.details = #'((ratio . 0.333) (center-staff-line-clearance . 0.6) (tip-staff-line-clearance . 0.45) (note-head-gap . 1.7) (stem-gap . 0.35) (height-limit . 1.0) (horizontal-distance-penalty-factor . 10) (same-dir-as-stem-penalty . 8) (min-length-penalty-factor . 26) (tie-tie-collision-distance . 0.45) (tie-tie-collision-penalty . 25.0) (intra-space-threshold . 1.25) (outer-tie-vertical-distance-symmetry-penalty-factor . 10) (outer-tie-length-symmetry-penalty-factor . 10) (vertical-distance-penalty-factor . 10) (outer-tie-vertical-gap . 0.25) (multi-tie-region-size . 3) (single-tie-region-size . 4) (between-length-limit . 1.0))
  \once \override Tie.Y-offset = #0.7
 
   \stemUp d4._\markup {\dynamic mp "etc."}  s4
  \stemDown \footnote "8*)" #'(1 . 3) \markup \magnify #0.9
  \column {\override #'(line-width . 108)
  \null
  \justify-string #"8*) Nos casos de um bloco que mistura harmônicos e notas naturais, ambos devem soar com mesma intensidade."} c4. f e4
  r4.
  \stemDown \tieDown g!4 fis~ 
  fis4. d b4
  \stemDown f4.\5\laissezVibrer  a' e4
  f2 e2 
 

  f,8  ais'4 \once \override NoteColumn.force-hshift = 0.4 \once \hide NoteHead gis8 e4 
  f4.\3 e4-0 \once \override LaissezVibrerTie.Y-offset = #-1
  ais,2.\laissezVibrer
  
   
}
lower = \relative c' {
  \global
  \set stringNumberOrientations = #'(down)
  \override StringNumber.font-size = #-6
 s1 
 s2.
 s2 
 \stemDown g'8\2 [g g g g g]
 
 g8 [g g g g g]
 
 g8 [g g g g g]
 
 f8\2 f8 f 
 
 d f\2 b,_0 b_0 f'\2
 \once \override Voice.TupletBracket.direction = #down
 d4 a8\rest b8
 s2
 
 d8\3\pppp\< [d d d d d d d\mf\>] 
 
 d8 [d d d d d d d\p]  
 d16\2 [(f8) dis16 c8\3] 
 a16 [(gis8) c g16_0  ] 
 fis'8\2 [dis] 
 \stemUp b4-0 b2 
  s1 s1
  %\once \override Score.StaffSymbol.forced-spacing = #12
  \override TextSpanner.Y-offset = #-1
  \override TextSpanner.bound-details.left.text = #"rallentando"
 \stemNeutral gis'!8\2 [8 8 8 8 8] \hide Stem

 \bar ".|:" 
 \footnote "*)" #'(0 . 2) \markup
 \magnify #0.9
 \column {\override #'(line-width . 108)
  \null
  \justify-string #"*) Repetir livremente até a entrada da deixa eletroacústica."
 %Repeat freely until tape enters with clicks cue.
 } Staff.BarLine
gis!4
   \bar ":|." \break
 s4\startTextSpan s4 s4 s4\stopTextSpan
 \undo \hide Stem
 gis16\<( [a\2\mf) e-0\laissezVibrer]
 
 s1 s2. 
 \stemDown 
 \tieDown
 c,2\f\>~ 8.\p   
 \override NoteHead.style = #'slash \footnote "**)" #'(1 . -0.3) \markup 
 \magnify #0.9
 \column {\override #'(line-width . 108)
  \null
  \justify-string #"**) Ruído das cordas: raspar polpa do(s) dedo(s) da m.e. em direção à casa XII." 
 %String noise: scrape sixth and fifth strings with the fingers pulp (left hand) toward XII fret.
 }d16\sf 
 
 s2.
 s2
 <<
   { s2 s2 s4 }
    %\new Staff = "bass" { r2 s2. }

   \new Staff \with {
     alignAboveContext = #"ruidoI"}{\omit Staff.StaffSymbol
                \hide Staff.Clef
                \override Hairpin.stencil = #flared-hairpin
                \override NoteHead.style = #'slash 
\shape #'((0 . 0) (5 . 2) (-5.5 . -10.5) (-2 . -3.5)) Slur
    
b''16:32\ppp\<( [\hide NoteHead 16:32 16:32 16:32 16:32 16:32 16:32 16:32\f] 
\undo \hide NoteHead 
\hide Staff.TimeSignature
\revert NoteHead.style 
\change Staff = "violao"  \stemDown cis,,2)_\laissezVibrer s8. \override NoteHead.style = #'slash d16->\sf}
   

>>
 
 
 s2 s1 s1 s2. s2. s8 s4 
 \revert NoteHead.style
 f'4.\2 e4_0 
 s4 
 g8\ppp\< [8 8 8 8 8 8 8] 
 8 8 8 
 ees b_0 aes\4 
 \slurDown e16[(f8) d8.-0]
 e,16\rest a8\f [8 8 8 8 8] \override NoteHead.style = #'slash d16
 \revert NoteHead.style
 
 <<
 {\stemNeutral ees^\markup \line {"L.V." \italic "sempre"} ^\6 bes'^\5 d,-0 ees g-0
 ees a d, ees g
 
 bes,^\6 a-0 fis'^\4 bes, g'-0
 bes, a d bes g'
 
 ees\mp ^\6 a^\5 d,-0 ees g-0
 ees [f d \parenthesize ees g16\rest]
 
 bes,16\p^\6 a-0 fis'^\4 bes, g'-0
 bes, [a \parenthesize d g8\rest]
 
 ees16\pp ^\6 a^\5 d,-0 ees g-0
 ees [f d \parenthesize ees g16\rest]
 
 bes,16\pp^\6 a-0 fis'^\4 bes, g'-0
 bes, [a \parenthesize d g8\rest]
 
 ees16\ppp ^\6 a^\5 d,-0 ees g-0
 ees [f \parenthesize d g8\rest]
 
 bes,16\ppp^\6 a-0 fis'^\4 bes, g'-0
 bes, [a \parenthesize fis' g8\rest]
 
 ees16\pppp ^\6 a^\5 d,-0 ees \parenthesize g8-0
 bes,16\pppp^\6 [a-0 fis'^\4  bes, \parenthesize g'8]
 
  ees16_\markup \italic {"quasi niente"} [a d,  ees \parenthesize g8]
  
 bes,16 [a fis' \parenthesize bes, g'8]

 ees16_\markup \italic {"niente"} [bes'  d, \parenthesize ees c'8\rest]
 bes,16 \parenthesize a g'4\rest
 


\override NoteHead.style = #'slash 
\stopStaff
\startStaff
\omit Staff.StaffSymbol
\omit Staff.Clef
\omit Staff.ClefModifier

 b2\rest b4\rest

\override Hairpin #'circled-tip = ##t
\set subdivideBeams = ##t
\override Beam.breakable = ##t


d16:32[\<^"m.d." d16:32 d16:32 d16:32

d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32\f
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
\undo \omit Staff.Clef
\once \hide Staff.Clef
d16:32\>^"(m.d.)" d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32\!]\noBreak 

b1\rest r4 r8 

  <<
  {\global
   \override NoteHead.style = #'slash 
   \set subdivideBeams = ##t
   \override Beam.breakable = ##t

s8 
d16:32 d16:32^\mp d16:32 d16:32
d16:32 d16:32 d16:32 d16:32 
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32

\once \hide Staff.Clef

s2 s2.


d16:32^"(m.d.)" [d16:32^\mp d16:32 d16:32
d16:32 d16:32 d16:32 d16:32 
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32]

\once \hide Staff.Clef

d16:32 [d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32^\< d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32]
\undo \omit Staff.Clef
\once \hide Staff.Clef
d16:32^\> [d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32^\< d16:32 d16:32^\ff d16:32]
\hide Stem 
s8 \footnote "7*)" #'(1 . 3) \markup 
\magnify #0.9
\column {\override #'(line-width . 108)
  \null
  \justify-string #"7*) Ruído de cordas: Movimentos esparsos, lentos e irregulares das duas mãos."} d8
d8 [s8]
s2.
d8 s16 d16 s8 d8 s8 d16 d16  s16 d16 d16 s16

  }\\
  {\global
  \xNote
\footnote "4*)" #'(-0.4 . 0) \markup 
\magnify #0.9
\column {\override #'(line-width . 108)
  \null
  \justify-string #"4*) Percutir com polpa dos dedos (e unhas?) da m.d. 'aleatoriamente' sobre o tampo o mais rápido possível."} g,8:64\<~[

\once \override Score.FootnoteItem.annotation-line = ##f
\xNote g8:64-\footnote "6*)" #'(-8 . 0) \markup
\magnify #0.9
\column {\override #'(line-width . 108)
  \null
  \justify-string #"6*) Equilibrar a intensidade dos dois sons: a percussão sobre o tampo deve soar na mesma intensidade que o rasgueado, em direção a uma fusão entre os dois."}\f]


\override Beam.breakable = ##t

r8 s4 s4 r8 \xNotesOn g8:64~\mf 
[g8:64] r8 r8 [g8:64\mp] b2\rest^\fermata r8 g8:64~\<
[g8:64\f] r8 s4 s4 r4 
r8 [g8:64~\<]
g16:64\sf [r8.] 


r2 r4
r4 r8 [g8:64\<] g4:32~\sfz  g8:32 [r8] r2.
\once \hide Staff.Clef
\tieUp g1:32^\fermata ^\markup { \hspace #4 "4 compassos 4/4"} _\markup { \dynamic ff " Rearticular livremente "} 

\stopStaff \startStaff 
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             \undo \omit Staff.Clef
             \undo \omit Staff.ClefModifier
             \override NoteHead.style = #'harmonic-mixed
\textLengthOff
\set Staff.forceClef = ##t \ottava #1

g''16\ppp\<\3^"L.V." fis\2 g fis 
g fis g fis
g fis g fis
g fis g fis\f 
\revert TupletBracket.X-positions
\tuplet 5/4 {g8 fis g fis g} \tuplet 3/2 2 {fis4 g fis} 
g4 fis4
\ottava #0
  }
  >>
}
 
 \new Staff \with {alignAboveContext = #"electrostaff"}
 {\global
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \clef "treble_8"
             \omit Staff.Clef
             \override Hairpin.stencil = #flared-hairpin
             \override NoteHead.style = #'slash 
             \numericTimeSignature
             
\stemDown
\textLengthOn
r8. r8 r4 g16\sf^"m.e."
r8. r8 r4 d16\sf 
\override Hairpin.stencil = #constante-hairpin
r8. r8 r8. d16\f d16
r8. r8 r8 d16\ff d16 d16 
r8. r8 r8. \tuplet 3/2 8 {d16\ff d16 d16}
r8. r8 s16 \tuplet 3/2 8 {r16 d16\ff d16} \tuplet 3/2 8 {d16 d16 d16}
r8. r8 r16 \tuplet 3/2 8 {r16 d16\ff d16} \tuplet 3/2 8 {d16 d8}
r8. r8 r16 \tuplet 3/2 8 {r16 d16\ff d16} d8
r4 d8\ff
r4 \tuplet 3/2 8 {d16\ff d16 d16}
r4 \tuplet 3/2 8 {d16\ff d16 d16}
r4 d16:32 d16:32
r8. [d16:32 d16:32 d16:32]
r16 [d16:32 d16:32 d16:32 d16:32 d16:32]

\set subdivideBeams = ##t
d16:32 [d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32

\revert Hairpin.stencil
\once \override Hairpin #'circled-tip = ##t

d16:32\> d16:32 d16:32 d16:32
d16:32 d16:32 d16:32 d16:32\!]

r2 
             \stopStaff \startStaff 
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             
             \override NoteHead.style = #'harmonic-mixed
            
\undo \omit Staff.Clef 
 r4.\ottava #1 g4.\3\laissezVibrer fis4\2\laissezVibrer \ottava #0
             
             \stopStaff \startStaff 
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \omit Staff.Clef
             \override NoteHead.stencil = #ly:text-interface::print
             \override NoteHead.text = \markup \fontsize #2 \vcenter \center-align {\hspace #-0.4 \arrow-head #Y #UP ##t }

r1 r4 r8
\override Beam.breakable = ##t
%\override NoteHead.style = #'triangle
\footnote "5*)" #'(-0.4 . 0) \markup 
\magnify #0.9
\column {\override #'(line-width . 108)
  \null
  \justify-string #"5*) Rasqueado de m.e. com cordas abafadas pela m.d., com vários dedos em defasagem e usando as 6 cordas (som percussivo granular)."} b,8:64~[
b8:64]

\omit Staff.ClefModifier
r8 s2 r8 b8:64~ 

[b8:64] r8 r8 [b8:64] 
 \stopStaff \startStaff 
             \undo \omit Staff.ClefModifier
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             \undo \omit Staff.Clef
             \revert NoteHead.stencil
             \override NoteHead.style = #'harmonic-mixed

\set Staff.forceClef = ##t \ottava #1 g'2\mf\3\fermata \laissezVibrer \ottava #0 

\stopStaff \startStaff 
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \omit Staff.Clef
             \omit Staff.ClefModifier
             \override NoteHead.stencil = #ly:text-interface::print
             \override NoteHead.text = \markup \fontsize #2 \vcenter \center-align {\hspace #-0.4 \arrow-head #Y #UP ##t }

r8 b,8:64~
[b8:64] r8 r4 
 \stopStaff \startStaff 
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             \undo \omit Staff.Clef
             \undo \omit Staff.ClefModifier
             \revert NoteHead.stencil
             \override NoteHead.style = #'harmonic-mixed

\set Staff.forceClef = ##t \ottava #1 g'4~\mf\3 g16\laissezVibrer [fis8.\laissezVibrer] \ottava #0 

\stopStaff \startStaff 
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \omit Staff.Clef
             \omit Staff.ClefModifier
\override NoteHead.stencil = #ly:text-interface::print
             \override NoteHead.text = \markup \fontsize #2 \vcenter \center-align {\hspace #-0.4 \arrow-head #Y #UP ##t }
r8 [b,8:64~]
b16:64 [r8.]
 \stopStaff \startStaff 
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             \undo \omit Staff.Clef
             \undo \omit Staff.ClefModifier
             \revert NoteHead.stencil
             \override NoteHead.style = #'harmonic-mixed
\textLengthOff
\set Staff.forceClef = ##t \ottava #1
\undo \omit Staff.ClefModifier
g'16\ppp\<\3^"L.V." fis\2 g fis 
g fis g fis 
g\mf\> fis g fis 
g fis g fis\ppp
\ottava #0 

\stopStaff \startStaff 
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \omit Staff.Clef
\override NoteHead.stencil = #ly:text-interface::print
             \override NoteHead.text = \markup \fontsize #2 \vcenter \center-align {\hspace #-0.4 \arrow-head #Y #UP ##t }
             
r8 [b,8:64~] b4:32~ b8:64 [r8] r4
\stopStaff \startStaff 
             \undo \omit Staff.StaffSymbol
             \revert Staff.NoteHead.no-ledgers
             \undo \omit Staff.Clef
             \revert NoteHead.stencil
             \override NoteHead.style = #'harmonic-mixed
\textLengthOff
\set Staff.forceClef = ##t \ottava #1 g'16\ppp\<\3^"L.V." fis\2 g fis 
g fis g fis\f \ottava #0
\once \omit Staff.ClefModifier

\stopStaff \startStaff 
             \omit Staff.StaffSymbol
             \override Staff.NoteHead.no-ledgers = ##t
             \omit Staff.Clef
\override NoteHead.stencil = #ly:text-interface::print
             \override NoteHead.text = \markup \fontsize #2 \vcenter \center-align {\hspace #-0.4 \arrow-head #Y #UP ##t } 
            

s16 g,4:32\fermata _"parar após a deixa eletr." \glissando  s16 s8 s4 s8 s16 
\once \hide NoteHead \once \hide Stem           g16
 }
>>


 \revert NoteHead.style
 
  s4. 
  s1 s2 
  s4. 
  s1 s2 
  s4. 
  s4.  \once \override Rest.staff-position = #-6 r4. \stemDown b,,4
  s1
  s4.
  s2
  s1  
  \once \override Rest.staff-position = #-8 
  s1
  s1
  s2.
  s2 s8
  \once \override Rest.staff-position = #-11 
  r4 \once \override Rest.staff-position = #-11 r8 g'4.\glissando \glissandoSkipOn  g2^\half \glissandoSkipOff  gih4.\pp r8
  s4.
  \once \override Rest.staff-position = #-6
  r4. c,4.\2 b4-0 %mi mudar?
  \once \override Rest.staff-position = #-6
  r4. ais4. b8[  \once \override NoteHead.style = #'harmonic-mixed
 b\6]
 c4. dis\3 e4
 fis4.\3 \once \override Rest.staff-position = #-0.5  r8 \once \override Rest.staff-position = #-0.5 \once \override Beam.positions = #'(-3 . -2.5) r8 [g8] \once \override NoteColumn.force-hshift = -0.5 \once \hide NoteHead gis8 fis!8
 \once \override Rest.staff-position = #0 r4. dis4. e4 
 f4. c4. b4 ~
 \time 3/4 b4\laissezVibrer e2\3 \glissando \glissandoSkipOn  
 \time 4/4  e2  f2\fermata \glissandoSkipOff
 f2\fermata \glissando \glissandoSkipOn e\fermata e\fermata \glissandoSkipOff
 \textLengthOn e\fermata _"esperar" _"fim do tape"
 e1\3 \bar"|."  
 % \override NoteHead.style = #'harmonic-mixed
%  e,,1_\markup \general-align #Y #DOWN { 
%    \hspace #-4
%    \fontsize #-2 " VI"
%    \draw-line #'(0 . 1.5)
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 0.6) 
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 0.6)
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 1)
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 0.6) 
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 0.6)
%    \hspace #-0.7
%    \draw-line #'(1.5 . 0)
%    \hspace #-0.7
%    \draw-line #'(0 . 1.5)
%    \fontsize #-2 " VII"
% }
% s1 s1 s1
 
}
electro = \relative c {
  \global
  \override Staff.Glissando.thickness = #2
  % \override Staff.Glissando.style = #'zigzag
%   \override Staff.Glissando.zigzag-length = #0.502
%   \override Staff.Glissando.zigzag-width = #25
  \clef "treble_8"
  \omit Staff.TimeSignature
  \once \override Hairpin.circled-tip = ##t
  gih''1~\<
  4~:64 2~\!  
  gih4~ 8~ 8~:64^>
  \override Glissando.breakable = ##t
  \override Glissando.after-line-breaking = ##t

  % \once \override Glissando.stencil = #ly:text-interface::print
%   \once \override Glissando.Y-offset = #2
%     \once \override Glissando.X-offset = #2
% 
%   \once \override Glissando.text = \markup {
%    \override #'(orientation . -1)
%     \draw-squiggle-line #8 #'(12 . 0) ##t
%     \hspace #'-0.6 
%     \draw-squiggle-line #4 #'(12 . 0) ##t
%     \hspace #'-0.6 \override #'(orientation . -1) 
%     \draw-squiggle-line #3 #'(6 . 0) ##t
%     \hspace #'-0.6
%     \draw-squiggle-line #2 #'(6 . 0) ##t
%     \hspace #'-0.6 \override #'(orientation . -1) 
%     \draw-squiggle-line #1.5 #'(6 . 0) ##t
%     \hspace #'-0.6
%     \draw-squiggle-line #1.2 #'(6 . 0) ##t
%   }
  <<{gih2. \laissezVibrer 
  \glissando} 
   {s8 \stopStaff \startStaff \omit Staff.StaffSymbol 
     s8 s8 s8 s8 s8 }
  >>
 \once \omit Staff.BarLine
 s2.
 %\hide NoteHead 
\once \hide Stem \once \hide Dots 
 \showStaff 
 \once \omit Staff.BarLine
 aih8 \glissando \hideStaff s8 s2
 \once \omit Staff.BarLine
 s4. \once \omit Staff.BarLine
 s2 s8  

 % \undo \hide NoteHead
%  \undo \hide Accidental 
 \set Staff.forceClef = ##t 


    \showStaff  dih,8~ dih8:64~^> 4\glissando \hideStaff 
    \once \hide Staff.Clef
 s2 
 s1
 s1 \once \hide Staff.Clef
 s4.
 s4.\once \omit Staff.Clef
 s4 
 \showStaff
 \set Staff.forceClef = ##t 
aih2~ aih4:32~  aih1 \once \hide Staff.Clef
 \hideStaff
 
 \undo \hide NoteHead \undo \hide Stem 
 s1 
 s1
 s4.
 s4.
 s4
 s2
 s1
 s1
 
 s8.
 s1
  
  \omit Staff.StaffSymbol
 
  \override NoteHead.style = #'cross
    
  
  
  %\makeClusters {
   % <e>4\ppp <e>
    %2
   % \< <e>4
  %<c d>8 <f e> <f>4 <g> \sfz
  %  <f>
  
}
electroII = {\global
  \override Staff.Glissando.thickness = #2
  % \override Staff.Glissando.style = #'zigzag
%   \override Staff.Glissando.zigzag-length = #0.502
%   \override Staff.Glissando.zigzag-width = #25
  \clef "treble_8"
  \omit Staff.TimeSignature
  \override Glissando.breakable = ##t
  \override Glissando.after-line-breaking = ##t
  \override Rest.font-size = #-2
  \override Staff.NoteHead.no-ledgers = ##t
  s1 s2 \xNotesOn b'16 16 16 16 s2 s2. s2. s2. s4. s2  s8 
  s4 s8 r16[ b']
   s2 s1 s1 s4. s4. s4 
   r8. [b'16] r2
   s4.  \slurUp  \shape #'((-0.4 . -1)(0 . -0.8)(0 . 0)(0 . 4)) Slur
 d''8:32 ( s2)
 s1 s2. s4 
 \once \omit Staff.Clef
 
 \startStaff r4 s2\fermata \stemDown r16 [ g'16:64^"deixa:" b' 16 16]
 s8. \once \omit Staff.BarLine
 s1  \once \omit Staff.BarLine
 s2. \once \omit Staff.BarLine
 s2.
 \stopStaff
 r4. r16 \stemDown g'16
 \startStaff
}
electroIII = {
  
  \override Staff.Glissando.thickness = #2
  % \override Staff.Glissando.style = #'zigzag
%   \override Staff.Glissando.zigzag-length = #0.502
%   \override Staff.Glissando.zigzag-width = #25
  \clef "treble_8"
  \omit Staff.TimeSignature
  \override Glissando.breakable = ##t
  \override Glissando.after-line-breaking = ##t
  \override Rest.font-size = #-2
   s1| s2. | s2 | s2.| s2.| s2. | s4. | s2 s8 |
   s4 s16 s16 s8 |
   s2 | s1 | s1 | s4. | s4. | s4 |
   s4 s16 s8. s4 |   \revert Staff.Glissando.style
   %\override Staff.Clef.whiteout = ##t

   r4. s8 \stemDown gisih'2\glissando |
   \once \omit Staff.BarLine
   s1 |  \once \omit Staff.BarLine
   s2. | \once \omit Staff.BarLine
   s4  | \once \omit Staff.BarLine
   s1 |  
   \once \omit Staff.Clef
   s8. | %\set Staff.forceClef = ##t
  
   s1 |
   s2.|
   \showStaff  dis'4\glissando \glissandoSkipOn dis'4 \glissandoSkipOff cis'8.:64 [r16] |
   s2
   cisih'2.\glissando |
   
   s4 s4 
   aih2.
   
   \hideStaff \stopStaff s2 \once \omit Staff.BarLine
   s1
   s1
   s2.
   s2. s8
   s4
   s8 s8 s8 s8 s8
   s4
   s1
   s4.
   s4.
   s4.
   s8 s8 s8 s8 s8 s8 s8
   %compasso41 ->
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8
   %53 ->
   s8 s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8 s8
   s8 s8 s8 s8 s8 s8
    \once \omit Staff.Clef 
   s1
   s1
   \once \hide Staff.Clef
   \once \omit Staff.ClefModifier
   

   \xNotesOn 
   b1\laissezVibrer
   r1 b4\p\< 16 32 32 32 32 16\f
   16 s8. s4 s4 s4
   \once \omit Staff.Clef 
   \once \omit Staff.ClefModifier
   r8 [b8] b8 \tuplet 3/2 {b16 b b} r2 r4 
   r4 b16 16 16 16 r2
   \once \omit Staff.Clef 
   b16 16 16 16 b4 r4 r4
   \once \omit Staff.Clef
   \once \omit Staff.ClefModifier
   s1
   b16 16 16 16     16 16 16 16   16\> 16 16 16\!  r4 \once \hide Staff.Clef
   s2 s4 \showStaff \xNotesOff \set Staff.forceClef = ##t  fis'4^\markup {\hspace #2 "deixa"}\<\fermata~fis'4\fp\laissezVibrer
   
   

}
  
{% middleMidi = \relative c' {
%   \global
%    \set Staff.connectArpeggios = ##t
%   \set Staff.midiMinimumVolume = #0.3
%   \set Staff.midiMaximumVolume = #0.4
%   \global
%   \override Rest.Y-offset = #0
% 
%   r4.
%   r4. f4. \once \override Tie.direction = #up e2.-0
%   r4. 
%   r4. c4. b2 
%   r4. 
%   r4. \stemUp  d4. ~ d4
%    c4. f e4
%   r4.
%   \stemDown \tieDown g!4 fis~ 
%   fis4. d b4
%   \stemDown f4.\5\laissezVibrer  a' e4
%   f2 e2 
%   
% 
%   f,8 ais'4 \once \override NoteColumn.force-hshift = 0.4 \once \hide NoteHead r8 e4 
%   f4. e4-0
%   ais,2.\laissezVibrer
%   
%   
%   
% }
% lowerMidi = \relative c' {
%   \global
%   s4. 
%   s1 s2 
%   s4. 
%   s1 s4 
%   s4. 
%   s4.  \once \override Rest.staff-position = #-6 r4. \stemDown b4
%   s1
%   s4.
%   s2
%   s1  
%   \once \override Rest.staff-position = #-8 
%   s1
%   s1
%   s2.
%   s2 s8
%   \once \override Rest.staff-position = #-10 
%   r4 \once \override Rest.staff-position = #-10 r8 g'4.\glissando \glissandoSkipOn  g2^\half \glissandoSkipOff  gih4.\pp r8
%   s4.
%   \once \override Rest.staff-position = #-6
%   r4. dis4. e4-0
%   \once \override Rest.staff-position = #-6
%   r4. ais,4. b8[  \once \override NoteHead.style = #'harmonic-mixed
%  r8]
%  c4. dis\3 e4
%   fis4.\3 \once \override Rest.staff-position = #-3  r8 \once \override Rest.staff-position = #-3 \once \override Beam.positions = #'(-4 . -3) r8 [g8] \once \override NoteColumn.force-hshift = -0.5 \once \hide NoteHead r8 fis!8
%    r4. dis4. e4 
%  f4. c4. b4
% }
}
classicalGuitarPart = \new StaffGroup = "violao"
\with {
%   \override StaffGrouper.staff-staff-spacing =
%   #'((basic-distance . 2)
%     (minimum-distance . 2)
%     (padding . 1)
%     (stretchability . 9))
%   
%    \override StaffGrouper.staffgroup-staff-spacing =
%   #'((basic-distance . 10)
%     (minimum-distance . 1)
%     (padding . 1)
%     (stretchability . 15))
%   
%   
%   
  fontSize = #-1
  midiInstrument = "acoustic guitar (nylon)"
  instrumentName = "Violão"
  shortInstrumentName = #"V. "

  \consists "Span_arpeggio_engraver"
  \override Arpeggio.arpeggio-direction = #UP
} 

  
\new Staff = "violao" { 
  
  \set Staff.clefGlyph = #"clefs.G"
  \set Staff.clefPosition = #-2
  \set Staff.clefTransposition = #0
  \set Staff.middleCPosition = #1
  \set Staff.middleCClefPosition = #1
   << \upper \\ \middle \\ \lower >> 

\override StaffGrouper.staff-staff-spacing =
  #'((basic-distance . 2)
    (minimum-distance . 2)
    (padding . 1)
    (stretchability . 9))
  
   \override StaffGrouper.staffgroup-staff-spacing =
  #'((basic-distance . 15)
    (minimum-distance . 1)
    (padding . 1)
    (stretchability . 15))
}

% midiPart = \new Staff \with {
%   midiInstrument = "acoustic guitar (nylon)"
%   instrumentName = "Violão"
% } { \clef "treble" <<\middleMidi \\ \lowerMidi>> }
electronicPart = \new Staff = "electrostaff" \with {
  \RemoveEmptyStaves
  % \override StaffSymbol.color = #(x11-color 'grey30)
%   \override Clef.color = #(x11-color 'grey30)
%   \override TimeSignature.color = #(x11-color 'grey30)
%   \override Stem.color = #(x11-color 'grey30)
%   \override Beam.color = #(x11-color 'grey30)
%   \override NoteHead.color = #(x11-color 'grey20)
  % \override Hairpin.color = #(x11-color 'grey30)
%   \override Accidental.color = #(x11-color 'grey30)
  % \override Glissando.color = #(x11-color 'grey30)
 %  \override BarLine.color = #(x11-color 'grey70)
%   \override Tie.color = #(x11-color 'grey30)
 %  \override DynamicTextSpanner.color = #(x11-color 'grey30)
%     \override Rest.color = #(x11-color 'grey30)


  fontSize = #-2
  \magnifyStaff #3/4
  instrumentName = "Electronics"
  shortInstrumentName = #"E. "
  
} {\clef treble <<\electroII\\\electro\\\electroIII>>}
\score {
  <<
    
    \classicalGuitarPart
    %\midiPart
    \electronicPart
   
  >>
  
  \layout { }
  \midi {
    \tempo 4=56
  }
}
