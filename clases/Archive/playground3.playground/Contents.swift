import UIKit

protocol Descriptible {
    func describete() -> String
}

let hoy = Date()

class Persona: Descriptible {
    
    func describete() -> String {
        return "Hola, me llamo \(self.nombre) \(self.apellido), mi nacionalidad es \(self.nacionalidad). Nací en \(self.añoDeNacimiento) y tengo \(self.edad) años aproximadamente"
    }
    var nombre: String
    var apellido: String
    var nacionalidad = "Mexicana"
    let añoDeNacimiento: Int
    var edad: Int {
        get {
            return Calendar (identifier: .gregorian).dateComponents([.year], from: hoy).year! - self.añoDeNacimiento
        }
    }
    
    // Inicializador designado
    init(nombre: String, apellido: String, añoDeNacimiento: Int) {
        self.nombre = nombre
        self.apellido = apellido
        self.añoDeNacimiento = añoDeNacimiento
    }
    
    // Inicializador de conveniencia
    convenience init (nombre: String, apellido: String, añoDeNacimiento: Int, nacionalidad: String) {
        self.init (nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento)
        self.nacionalidad = nacionalidad
    }
}

var alumno1 = Persona(nombre: "Juan", apellido: "Topo", añoDeNacimiento: 1980)
alumno1.nombre
alumno1.edad
alumno1.describete()

alumno1.apellido = "Topete"
alumno1.describete()
// alumno1.añoDeNacimiento = 1990
// alumno1.edad = 20
alumno1.nacionalidad = "Alemana"

// ya utilizando el inicializador de conveniencia
var alumno2 = Persona(nombre: "Bart", apellido: "Simpson", añoDeNacimiento: 1990, nacionalidad: "Springfiliana")
alumno2.describete()

// Herencia
class Alumno: Persona {
    var carrera: String
    var semestre = 1
    var promedio = 0.0
    
    init (nombre: String, apellido: String, añoDeNacimiento: Int, carrera: String) {
        self.carrera = carrera
        super.init(nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento)
    }
    
    convenience init (nombre: String, apellido: String, añoDeNacimiento: Int, carrera: String, semestre: Int, promedio: Double, nacionalidad: String) {
        self.init(nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento, carrera: carrera)
        self.semestre = semestre
        self.promedio = promedio
        self.nacionalidad = nacionalidad
    }
    
    override func describete() -> String {
        let descripcionDeLaClaseMadre = super.describete()
        let descripcionDeLaClaseHija = ". Estudio \(self.carrera), voy en \(self.semestre) semestre, con promedio de \(self.promedio)"
        
        // return "El estudiante se llama \(self.nombre) \(self.apellido), tiene \(self.edad). Estudia \(self.carrera), va en \(self.semestre) con promedio de \(self.promedio)"
        return descripcionDeLaClaseMadre + descripcionDeLaClaseHija
    }
}

let estudiante1 = Alumno(nombre: "Moe", apellido: "Sislak", añoDeNacimiento: 1932, carrera: "Actuaria")
estudiante1.describete()
let estudianteDeIntercambio = Alumno(nombre: "Uter", apellido: "Zorker", añoDeNacimiento: 2000, carrera: "Merca", semestre: 15, promedio: 5.9, nacionalidad: "Alemana")
