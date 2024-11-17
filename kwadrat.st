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
	wpisanyOkrag := nil.
! !

!Wielokat methodsFor: 'accessing'!
nazwa
    "podaje nazwe wielokata"
    
    ^nazwa!

nazwa: nowa_nazwa
    "ustawia nowa nazwe wielokata"
    
    nazwa := nowa_nazwa.!

wpisanyOkrag
	^wpisanyOkrag.
! !

!Wielokat methodsFor: 'actions'!
wpiszOkrag
	^nil
!

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
    
    przesuniecie := srodekX negated @ srodekY negated.
    
    "Przesun kazdy wierzcholek"
    wierzcholki := wierzcholki collect: [:punkt | punkt + przesuniecie].
	wpisanyOkrag := self wpiszOkrag.
!

drukuj
    Transcript show: 'Wierzchołki: '; cr.
    wierzcholki do: [:punkt |
        Transcript show: punkt printString; cr.
    ].
    Transcript show: 'Pole: ', self pole printString; cr.
	Transcript show: 'Wpisany okrag: '.
	wpisanyOkrag drukuj.
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
wpiszOkrag
    | bok srodek promien |
    bok := (wierzcholki at: 2) x - (wierzcholki at: 1) x.
    srodek := ((wierzcholki at: 1) x + (bok / 2)) @ ((wierzcholki at: 1) y + (bok / 2)). "Srodek geometryczny kwadratu"
    promien := bok / 2. "Polowa boku to promien okregu wpisanego"
    ^(Okrag new) initialize: promien center: srodek.
!
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
	wpisanyOkrag := self wpiszOkrag.
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
wpiszOkrag
    | bok srodek promien |
    bok := (wierzcholki at: 3) x - (wierzcholki at: 2) x.
    srodek := ((wierzcholki at: 2) x + (bok/2)) @ ((wierzcholki at: 1) y - (bok * (3 sqrt) / 3)) . "Środek od podstawy"
    promien := bok * (3 sqrt) / 6. "Promień okręgu wpisanego"
    ^(Okrag new) initialize: promien center: srodek.
!

pole
    | x1 x2 |
	x1 := (wierzcholki at: 3) x.
	x2 := (wierzcholki at: 2) x.
    ^((x1-x2) squared * (3 sqrt)) / 4.
! !

!TrojkatRownoboczny methodsFor: 'initialize-release'!
initialize: bok
    "Tworzy trójkąt równoboczny o podanym boku"
    
    super initialize: 3 name: 'Trojkat Rownoboczny'.
    wierzcholki at: 2 put: ((bok / 2) * -1) @ (bok * (3 sqrt) / (-2)).
    wierzcholki at: 3 put: (bok / 2) @ (bok * (3 sqrt) / (-2)).
	wpisanyOkrag := self wpiszOkrag.
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
