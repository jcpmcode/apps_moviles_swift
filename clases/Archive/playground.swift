import UIKit

var str = "Hello, playground"
var stringExplicito : String = "Este es un string explícito"
var stringImplicito = "Este es un string implícito"

print ("Este fue mi primer string: \(stringExplicito)")

var edad : Int
edad = 0
print("Tengo \(edad) años")
edad = 28
print ("... y ahora tengo \(edad)")

// edad = 4.5

let saludo : String
saludo = "Hola mundo"

// saludo = "Adios mundo"
// Inferencia de saludo

var wave = saludo
let enSwiftNosGustanLosNombresDeVariablesQueSeanDescriptivos : String
enSwiftNosGustanLosNombresDeVariablesQueSeanDescriptivos = "Hay autocompletado"

var pi = M_PI // Deprecated
pi = Double.pi
print (pi)

var miDoble = 5.0
miDoble.addingProduct(2.0, 3.0)
miDoble.squareRoot()

extension Double {
    func saluda() {
        print ("Hola soy el double \(self)")
    }
}

miDoble.saluda()
7.5.saluda()

// MARK: - Colecciones: Array, Dictionary, Set

// Array<T>

var arregloExplicito : Array<String> = ["Cosme Fulanito", saludo]
var arregloSemiExplicito : [String] = ["Moe", "Marge", "Bart"]
var arregloImplicito = ["Lisa", "Maggie", "Ayudante de Santa"]
var arregloVacio = [String]()
arregloImplicito[2]
arregloImplicito.count
arregloVacio.isEmpty
arregloExplicito.isEmpty
arregloSemiExplicito.description
miDoble.description

var changuitos = [String](repeating: "🙈", count:  100)
var monitos = changuitos
print ("Changuitos tiene \(changuitos)")
print ("Monitos tiene \(monitos)")
changuitos[3] = "🐒"
print ("Changuitos tiene \(changuitos)")
print ("Monitos tiene \(monitos)")

// MARK: - Estructuras de iteración

for i in 0..<10{
    print (i)
}



for i in 0...10{
    print (i)
}



let 🐣 = "Chicken"
let 🐔 = "Hen"
let 📝 = "Pencil"
let 🖋 = "Pen"

var diccionario = [🐣, 🐔, 📝, 🖋]

for i in 0..<diccionario.count {
    print ("Este es el elemento \(i): \(diccionario[i])")
}

for palabra in diccionario {
    print("Este es el elemento: \(palabra)")
}

for (lugar, palabra) in diccionario.enumerated() {
    print ("La posición \(lugar) es de \(palabra)")
}



let multiplicando = 12
let multiplicador = 5
var resultado = 0

for _ in 1...multiplicador{
    resultado += multiplicando
}

print ("\(multiplicando)x\(multiplicador)=\(resultado)")

var i = 0

while i < diccionario.count{
    print ("\(diccionario[i])")
    i+=1
}

i = 0

repeat {
    print ("\(diccionario[i])")
    i+=1
} while i<diccionario.count

// MARK: - Diccionarios

let diccionarioES_DE: Dictionary<String,String> = ["Perro": "Hund", "Casa": "Haus", "Ceja": "Augenbraue", "1": "Eins"]
var diccionarioES_DE_numeros = [1:"Eins", 2:"Zwei", 3:"Drei",4:"Vier"]

print(diccionarioES_DE["Perro"]!)

let llaves = diccionarioES_DE.keys
let valores = diccionarioES_DE.values

diccionarioES_DE_numeros.removeValue(forKey: 2)
diccionarioES_DE_numeros.description

let casaEnAleman = diccionarioES_DE["Casa"]
let tiempoEnAleman = diccionarioES_DE["Tiempo"]
let cienEnAleman = diccionarioES_DE_numeros[100]

print (diccionarioES_DE["Ceja"]!)

if let palabraTraducida = diccionarioES_DE["Oreja"]{
    print(palabraTraducida)
} else {
    print("La palabra no está en el diccionario")
}

var numeroTraducido = diccionarioES_DE_numeros[2] ?? "No existe en el diccionario"

print(diccionarioES_DE["Lampara"])

// MARK: - Funciones

func saluda(){
    print("Hallo Welt")
}

saluda()

func cuentaVotos(votosEmitidos: [String], sentidoDeVotoAContar: String) -> Int {
    var cuenta = 0
    for voto in votosEmitidos {
        if voto == sentidoDeVotoAContar {
            cuenta += 1
        }
    }

    return cuenta
}



let pregunta = "¿Te gustan los Simpson?"
let urna = ["si", "si", "no", "no se", "no", "si", "si", "si", "si"]

let votosSi = cuentaVotos(votosEmitidos: urna, sentidoDeVotoAContar: "si")
let votosNo = cuentaVotos(votosEmitidos: urna, sentidoDeVotoAContar: "no")
let votosNulos = cuentaVotos(votosEmitidos: urna, sentidoDeVotoAContar: "no se")

print("A \(votosSi) personas le gustan Los Simpson, a \(votosNo) no le gustan y \(votosNulos) no saben")

func cuentaTodosLosVotos (votosAContar: [String]) -> (votosSi: Int, votosNo: Int, votosNulos: Int){
    let votosSi = cuentaVotos (votosEmitidos: votosAContar, sentidoDeVotoAContar: "si")
    let votosNo = cuentaVotos (votosEmitidos: votosAContar, sentidoDeVotoAContar: "no")
    let votosNulos = votosAContar.count - votosSi - votosNo

    return (votosSi, votosNo, votosNulos)

}

let resultados = cuentaTodosLosVotos(votosAContar: urna)

print ("Le gustan Los Simpson a \(resultados.votosSi) personas")
print ("No le gustan Los Simpson a \(resultados.1) personas")

let (si, no, _) = cuentaTodosLosVotos(votosAContar: urna)

print("Le gustan a \(si)")
print ("No le gustan a \(no)")

// MARK: - Nombres internos y externos de argumentos

func repiteLaFrase (frase: String, cuantasVeces: Int) -> String{
    var resultado = ""

    for _ in 0 ..< cuantasVeces {
        resultado += frase
    }

    return resultado
}

repiteLaFrase(frase: "Hallo Welt", cuantasVeces: 4)

func repiteLaFrase2 (quieroRepetir frase: String, cuantasVeces n: Int) -> String {
    var resultado = ""
    for _ in 0 ..< n {
        resultado += frase
    }

    return resultado
}

repiteLaFrase2(quieroRepetir: "D'oh", cuantasVeces: 3)

func repiteLaFrase3 (_ frase: String, _ n: Int) -> String{
    var resultado = ""
    for _ in 0 ..< n {
        resultado += frase
    }

    return resultado
}

repiteLaFrase3("Ay Caramba", 10)

func encuentraPares(arregloDeEnteros: [Int]) -> Array<Int>? {
    if arregloDeEnteros.isEmpty {
        return nil
    }

    var numerosEncontrados = [Int]()

    for numero in arregloDeEnteros {
        if numero % 2 == 0 {
            numerosEncontrados.append(numero)
        }
    }

    return numerosEncontrados
}

if let hayPares = encuentraPares(arregloDeEnteros: [1,2,3,4,5,7,9]) {
    if hayPares.isEmpty {
        print ("No hubo pares")
    }
    else {
        print (hayPares[0])
    }
} else {
    print ("Se recibió nil")
}

// MARK: - Closures

func despidete(){
    print("Auf Wiedersehen")
}

despidete()

let chao = despidete

func funcionQueRecibeUnaFuncion(argumento: () -> ()){
    for i in 1...3 {
        print(i)
        argumento()
    }
}

// MARK: - Closure es una función que recibe una funcion como argumento

funcionQueRecibeUnaFuncion(argumento: chao)

funcionQueRecibeUnaFuncion {
    print ("Ya no soy Auf Wiedersehen")
}

let funcionQueImprimeLaFecha = {
    let fecha = Date()
    print(fecha)
}

funcionQueRecibeUnaFuncion(argumento: funcionQueImprimeLaFecha)

func convierteEnteroAFlotante(enteroAConvertir: Int) -> Float {
    return (Float(enteroAConvertir))
}

// funcionQueRecibeUnaFuncion (argumento: convierteEnteroAFlotante(enteroAConvertir: 42))

func elevaAlCuadrado(numero: Int, funcion: (Int) -> Float) -> Float {
    let resultado = powf(funcion(numero), 2.0)
    return resultado
}

func factorial(de: Int) -> Float {
    var resultado = 1
    for i in 2...de {
        resultado *= i
    }

    return (Float(resultado))
}

factorial(de: 10)
elevaAlCuadrado(numero: 10, funcion: factorial(de:))

let divideEnteroAFlotante = {
    (entero: Int) -> Float in
    return (Float(entero/2))
}

elevaAlCuadrado(numero: 7, funcion: divideEnteroAFlotante)

// Completar lo que falta con el codigo de alguien mas

func enterosQueCumplenUnaCondicion(enterosAProbar: [Int], condicion: (Int) -> Bool) -> [Int]? {
    if enterosAProbar.isEmpty{return nil}

    var arregloARegresar = [Int] ()

    for numero in enterosAProbar {
        if condicion(numero){
            arregloARegresar.append(numero)
        }
    }

    return arregloARegresar
}

let misEnteros = [-2,4,9,-12,8,0,19]
func mayorATres(numero:Int) -> Bool{
    return numero > 3
}

enterosQueCumplenUnaCondicion(enterosAProbar: misEnteros, condicion: mayorATres(numero:))

let multiplosDeDos = { //Condicion
    (entero: Int) -> Bool in

    return entero%2 == 0
}

enterosQueCumplenUnaCondicion(enterosAProbar: misEnteros, condicion: multiplosDeDos)
enterosQueCumplenUnaCondicion(enterosAProbar: misEnteros) {(numero) -> Bool in

return numero < 0
}

var familiaSimpson = ["Marge", "Bart", "Lisa", "Abraham", "Ayudante de Santa", "Bola de Nieve", "Patty", "Homero", "Selma", "Bola de Nieve 2", "Herbert"]
familiaSimpson.sorted()
familiaSimpson.description

func ordenDescendiente (string1: String, string2: String) -> Bool{
    return string1 > string2
}

familiaSimpson.sorted(by: ordenDescendiente(string1:string2:))
ordenDescendiente(string1: "Zumbes", string2: "Zumbe")

let ordenDescendienteInLine = {
    (string1: String, string2: String) -> Bool in

    return string1 > string2
}

familiaSimpson.sorted(by: ordenDescendienteInLine)
familiaSimpson.sorted(by: {
    (string1: String, string2: String) -> Bool in

    return string1 > string2
})

familiaSimpson.sorted(by: {
    string1, string2 in return string1 > string2
})

familiaSimpson.sorted(by: {
    string1, string2 in  string1 > string2
})

print (familiaSimpson.sorted(by:{$0 > $1}))
print (familiaSimpson.sorted(by: > ))