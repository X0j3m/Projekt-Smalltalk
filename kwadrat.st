Object subclass: #Wielokat
    instanceVariableNames: 'wierzcholki nazwa '
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!
initialize: liczbaWierzcholkow name: nowaNazwa
    "konstruktor obiektu - wielokata"
    
    nazwa := nowaNazwa.
    wierzcholki := Array new: liczbaWierzcholkow.
    wierzcholki at: 1 put: 0@0.
! !

!Wielokat methodsFor: 'accessing'!
nazwa
    "podaje nazwe wielokata"
    
    ^nazwa!

nazwa: nowa_nazwa
    "ustawia nowa nazwe wielokata"
    
    nazwa := nowa_nazwa.
! !

!Wielokat methodsFor: 'actions'!
wysrodkuj
    "Przenosi wielokat tak, ze jego srodek geometryczny znajdzie sie w punkcie (0, 0)"
    | sumaX sumaY srodekX srodekY przesuniecie |
    
    "Oblicz srodek geometryczny figury"
    sumaX := 0.
    sumaY := 0.
    
    wierzcholki do: [:punkt | 
        sumaX := sumaX + punkt x.
        sumaY := sumaY + punkt y.
    ].
    
    srodekX := sumaX / wierzcholki size.
    srodekY := sumaY / wierzcholki size.
    
    przesuniecie := srodekX @ srodekY negated.
    
    "Przesun kazdy wierzcholek"
    wierzcholki := wierzcholki collect: [:punkt | punkt + przesuniecie].
!

drukuj
    Transcript show: 'Wierzchołki: '; cr.
    wierzcholki do: [:punkt |
        Transcript show: punkt printString; cr.
    ].
    Transcript show: 'Pole: ', self pole printString; cr.
! !

Wielokat subclass: #Kwadrat
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Kwadrat methodsFor: 'arithmetic'!
+ figura
    "dodaj 2 figury w sensie pola"
    
    | p |
    
    p := self pole + figura pole.
    ^(Kwadrat new) initialize: p sqrt.
! !

!Kwadrat methodsFor: 'actions'!
pole
    "licz pole kwadratu"
    
    ^(wierzcholki at: 2) x squared.
! !

!Kwadrat methodsFor: 'initialize-release'!
initialize: bok
    "tworz kwadrat o podanym boku"
    
    super initialize: 4 name: 'Kwadrat'.
    wierzcholki at: 2 put: bok@0.
    wierzcholki at: 3 put: bok@bok.
    wierzcholki at: 4 put: 0@bok.
! !

Wielokat subclass: #TrojkatRownoboczny
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!TrojkatRownoboczny methodsFor: 'arithmetic'!
+ figura
    "dodaj 2 figury w sensie pola"
    
    | p |
    
    p := self pole + figura pole.
    ^(TrojkatRownoboczny new) initialize: ((p * 2) / (3 sqrt)).
! !

!TrojkatRownoboczny methodsFor: 'actions'!
pole
    | bok |
    bok := (wierzcholki at: 2) x.
    ^(bok squared * (3 sqrt)) / 4.
! !

!TrojkatRownoboczny methodsFor: 'initialize-release'!
initialize: bok
    "Tworzy trójkąt równoboczny o podanym boku"
    
    super initialize: 3 name: 'Trojkat Rownoboczny'.
    wierzcholki at: 2 put: ((bok / 2) * -1) @ (bok * (3 sqrt) / 2).
    wierzcholki at: 3 put: (bok / 2) @ (bok * (3 sqrt) / 2).
! !

Object subclass: #Okrag
    instanceVariableNames: 'promien srodek'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Okrag methodsFor: 'initialize-release'!
initialize: aPromien center: aCenter
    "Tworzy okrąg o podanym promieniu i środku"
    
    promien := aPromien.
    srodek := aCenter.
! !

!Okrag methodsFor: 'actions'!
drukuj
    "Wyświetla informacje o środku i promieniu okręgu"
    
    Transcript show: 'Okrąg:'; cr.
    Transcript show: 'Środek: ', srodek printString; cr.
    Transcript show: 'Promień: ', promien printString; cr.
! !

!Okrag methodsFor: 'actions'!
wysrodkuj
	srodek := 0@0
!
