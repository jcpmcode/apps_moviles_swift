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
    print("Estas viendo otra caricatura")
}

var personajeDeLosSimpson {
    case .Homero:
    print("mmm... Cerveeeza ")
    case .Marge:
    print("grgrgrgrgr")
}
