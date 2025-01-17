TestCase subclass: #CounterTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyCounter-Tests-Base'!

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 03:56'!
testStartingAtandIncrement
"teste com startingAt: e increment"
	self assert: ((Counter startingAt: 5) increment; count) equals: 6
	"o metodo de Counter forma um certo objeto ali, o todo dele tem que receber as mensagens que entende e o todo disso com assert: e equals: é entendido pelo self"! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 04:22'!
testPrinting
"teste  printOn:"
	Counter startingAt: 14 printString! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 04:27'!
testDecrementPrintingVerify

	"teste  printOn: com decremento e verificacao"

	| c |
	c := (Counter startingAt: 14)
		     decrement;
		     printString. "coloca a frase na variavel local"
	self assert: c equals: 'a Counter de valor: 13'! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 03:51'!
testCounterStartingAt5
"teste do metodo da classe startingAt:"
	self assert: (Counter startingAt:5) count equals: 5 "seta e verifica"! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 03:16'!
testCountIsSetAndVerify
"precisa estar em uma classe de teste"
	| c |
	"definiçao do setter, um metodo com variavel local c^"
	c := Counter new. "coloca c como objeto counter"
	c count: 7. "seta c como 7 pelo parametro count"
	self assert: c count equals: 7 "verifica se c é igual a 7"! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 03:37'!
testCountIsSetAndRead
"precisa estar em uma classe de teste e começar com o nome test"
	| c |
	"definiçao do setter, um metodo com variavel local c"
	c := Counter new count: 7. "coloca c como 7"
	c count "apresenta o valor, nao precisa de ponto final na ultima instruçao"! !

!CounterTest methodsFor: 'tests' stamp: 'LorenaFerreira 9/27/2024 03:41'!
testInitialize
"teste de inicializacao de count, verifica se é 0, se foi setado pelo metodo initialize"
	self assert: Counter new count equals: 0! !
PackageManifest subclass: #ManifestMyCounterTests
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyCounter-Tests-Manifest'!
!ManifestMyCounterTests commentStamp: 'LorenaFerreira 9/27/2024 02:42' prior: 0!
Pacote de um contador simples!
