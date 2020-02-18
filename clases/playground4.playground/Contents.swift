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
    
    static let todasLasAerolineas = [AM, LH, Y4, MX]
    
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

var miLineaAerea = Aerolineas.LH
miLineaAerea.describete()
miLineaAerea.puntual()
miLineaAerea = .MX
miLineaAerea.describete()

Aerolineas.todasLasAerolineas[3].puntual()

// Associated value enum
enum Transportes {
    case metro (Int)
    case coche (Int, String)
    case avion(Aerolineas, Int)
}

var miViaje = Transportes.avion(.AM, 123)
miViaje = .coche(999, "ZZZ")

func comodo(medioDeTransporte: Transportes) -> (Bool, String) {
    switch medioDeTransporte {
    case .avion(let compañia, _):
        if compañia == .LH {
            return(true, "Tiene gran espacio entre asientos")
        }
        else if compañia == .AM{
            return (true, "Los aviones están limpiod")
        }
        else {
            return (false, "La compañia \(compañia) da muy mal servicio")
        }
    case .coche(_, _):
        return (true, "Si es que manejas bien")
    default:
        return (false, "No sirve para distancias grandes")
    }
}

comodo(medioDeTransporte: miViaje)
miViaje = .metro(12)
comodo(medioDeTransporte: miViaje)
comodo (medioDeTransporte: .avion(.Y4, 777))
comodo(medioDeTransporte: .avion(.LH, 007))
