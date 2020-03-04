import UIKit

// Enumeracion Básica
enum Simpson {
    case Homero
    case Marge
    case Bart
    case Lisa
    case Maggie
}

var papaSimpson = Simpson.Homero
if papaSimpson == .Homero {
    print ("Papa Simpson es Homero")
} else {
    print("Estas viendo otro programa")
}

papaSimpson = .Bart

if papaSimpson == .Homero {
    print("Papa Simpson es Homer")
} else {
    print("Estas viendo otra caricatura")
}

var personajeDeLosSimpson = Simpson.Maggie

switch personajeDeLosSimpson {
    case .Homero:
    print("mmm... Cerveeeza ")
    case .Marge:
    print("grgrgrgrgr")
    case .Bart:
    print("Ay Caramba")
    case .Lisa:
    print("No como carne")
    case .Maggie:
    print("Oich Oich")
}

// Raw value enum

enum DiasDeLaSemana : Int {
    case Lunes = 1
    case Martes, Miercoles, Jueves, Viernes
    case Sabado = 100
    case Domingo = 200
}

var miDiaFavorito = DiasDeLaSemana.Miercoles
print(miDiaFavorito)
print(miDiaFavorito.rawValue)
let diaDeDescanso = DiasDeLaSemana(rawValue: 100)
let diaImaginario = DiasDeLaSemana(rawValue: 333)

// Pueden tener funciones y conformarse a protocolos

protocol Descriptible {
    func describete() -> String
}

enum Aerolineas: String, Descriptible {
    case AM = "Aeromexico"
    case LH = "Lufthansa"
    case Y4 = "Volaris"
    case MX = "Mexicana"
    
    func describete() -> String {
        if self == .MX {
            return "QEPD"
        }
        return self.rawValue
    }
    
    func puntual() -> Bool {
        if self == .LH || self == .Y4 {
            return true
        }
        return false
    }
}
