SimpleSwitchMorph subclass: #LOCell
	instanceVariableNames: 'mouseAction'
	classVariableNames: ''
	package: 'PBE-LightsOut-Base'!
!LOCell commentStamp: 'LorenaFerreira 9/28/2024 03:35' prior: 0!
classe da célula do jogo
API:
- `mouseAction`!


!LOCell methodsFor: 'event handling' stamp: 'LorenaFerreira 9/28/2024 01:09'!
mouseUp: anEvent

	"evento de mouse herdado do super, protocolo event handling, mas aqui fará outra coisa. polimorfismo"

	self toggleState. "muda o estado da celula que clicar"
	mouseAction value "valor do evento"! !


!LOCell methodsFor: 'accessing' stamp: 'LorenaFerreira 9/28/2024 02:40'!
mouseAction: aBlock
"seta a acao do mouse para recebe a posicao do bloco"
	mouseAction := aBlock! !

!LOCell methodsFor: 'accessing' stamp: 'LorenaFerreira 9/28/2024 03:29'!
mouseAction
"metodo getter do evento"
	^ mouseAction ! !


!LOCell methodsFor: 'initialization' stamp: 'LorenaFerreira 9/28/2024 01:58'!
initialize
"metodo inicializador da celula, override"
	super initialize. "chama o inicializador do super"
	self label: ''. "seta o como vazio a  label da celula. nao tera nada escrito"
	self borderWidth: 2. "tamanho da largura da borda da celula, parte sombreada, em pixel"
	bounds := 0@0 corner: 16@16. "cria a celula com limite de 16 por 16 pixels"
	offColor := Color palePeach. "cor da celula quando nao selecionada"
	onColor := Color paleBlue darker. "cor da celula quando selecionada"
	self useSquareCorners. "deixa os cantos quadrados"
	self turnOff. "a celula inicia desligada, estara na cor palePeach"
	
	! !


BorderedMorph subclass: #LOGame
	instanceVariableNames: 'cells'
	classVariableNames: ''
	package: 'PBE-LightsOut-Base'!
!LOGame commentStamp: 'LorenaFerreira 9/28/2024 03:00' prior: 0!
Classe que determina a logica do jogo lights out
API
- `cells`!


!LOGame methodsFor: 'accessing' stamp: 'LorenaFerreira 9/28/2024 02:59'!
cells: aSymbol
"metodo setter de cells"
	cells := aSymbol ! !

!LOGame methodsFor: 'accessing' stamp: 'LorenaFerreira 9/28/2024 02:57'!
cells
"metodo getter de cells"
	^ self! !

!LOGame methodsFor: 'accessing' stamp: 'LorenaFerreira 9/28/2024 00:58'!
cellsPerSide
"metodo com a quantidade de celulas por lado"
	^ 10! !


!LOGame methodsFor: 'initialization' stamp: 'LorenaFerreira 9/28/2024 03:25'!
initialize

	"metodo inicializador do jogo em si."

	| sampleCell width height n matrix | "variaveis locais"
	super initialize.
	n := self cellsPerSide. "coloca n como o valor retornado pelo metodo CellsPerSide. quantidade de celula por lado"
	sampleCell := LOCell new. "amostra de celula como um objeto da classe LOCell"
	width := sampleCell width. "coloca a largura base do jogo como a largura de uma celula, 16"
	height := sampleCell height. "mesma logica de cima, mas para largura, 16"
	self bounds: (50@50 extent: (width * n) @ (height * n) + (2 * self borderWidth)). "cria o jogo em si seguindo a largura e altura da quantidade de celulas por lado e acresecenta a quantidade de borda, 2"
	matrix := Array2D rows: n columns: n.
	cells:= matrix indicesCollect: [ :i :j | self newCellAt: i at: j ] "cria um array de 10 por 10"! !

!LOGame methodsFor: 'initialization' stamp: 'LorenaFerreira 9/28/2024 01:19'!
toggleNeighbourOfCellAt: i at: j

	"metodo para mudar as celulas vizinhas da celula clicada"
	"essa logica resolve as mudancas da celulas clicadas no canto"

	i > 1 ifTrue: [ (cells at: i - 1 at: j) toggleState ].
	i < self cellsPerSide ifTrue: [ (cells at: i + 1 at: j) toggleState].
	j > 1 ifTrue: [ (cells at: i at: j - 1) toggleState ].
	j < self cellsPerSide ifTrue: [ (cells at: i at: j + 1) toggleState].! !

!LOGame methodsFor: 'initialization' stamp: 'LorenaFerreira 9/28/2024 01:35'!
newCellAt: i at: j

	"metodo para criar a celula numa posicao i,j na tela. Responde ao new cell"
	|c origin| "celula e origem para indicar a posicao na tela"
	c := LOCell new.
	origin := self innerBounds origin. "a origem e a mesma do super"
	self addMorph: c. "coloca a celula no morph"
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin. "indica a posicao"
	c mouseAction: [ self toggleNeighbourOfCellAt: i at: j ]. "posicao do block a ser mudado"
	^ c "retorna c para o inicializador"! !
PackageManifest subclass: #ManifestPBELightsOut
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'PBE-LightsOut-Manifest'!
!ManifestPBELightsOut commentStamp: 'LorenaFerreira 9/28/2024 00:29' prior: 0!
Pacote do jogo Lights Out!
