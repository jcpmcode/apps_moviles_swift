import UIKit

protocol Descriptible {
    func describete() -> String
}

struct  puntoEnElMapa: Descriptible, Equatable{
    var longitud: Double
    var latitud: Double
    
    func distanciaEntrePuntos(coordenada punto: puntoEnElMapa) -> Double {
        let distanciaLatitud = self.latitud - punto.latitud
        let distanciaLongitud = self.longitud - punto.longitud
        return sqrt (distanciaLatitud * distanciaLatitud + pow(distanciaLongitud, 2))
        
    }
    
    func describete() -> String {
        return "Soy un punto en el mapa con coodernadas (\(self.longitud), \(self.latitud))"
    }
}

var punto1 = puntoEnElMapa(longitud: 10, latitud: 5)
var punto2 = puntoEnElMapa(longitud: 20, latitud: 10)
punto1.distanciaEntrePuntos(coordenada: punto2)
punto2.distanciaEntrePuntos(coordenada: puntoEnElMapa(longitud: 40, latitud: 10))
punto1.describete()
punto2.describete()

if punto1 == punto2 {
    print("No te has movido")
} else {
    print ("Estás en otro lado")
}

struct Punto: Descriptible {
    func describete() -> String {
        return "(\(x), \(y))"
    }
    
    var x: Double
    var y: Double
}

struct Tamaño: Descriptible {
    var ancho: Double
    var alto: Double
    func describete() -> String {
        return "(\(ancho), \(alto))"
    }
}

struct Rectángulo: Descriptible {
    var origen: Punto {
        willSet (nuevoPunto) {
            if (nuevoPunto.x < 0 || nuevoPunto.y < 0) {
                print("No se puede mover el rectangulo porque se sale de la pantalla")
                
            } else {
                print ("El origen del rectangulo se va a mover a \(nuevoPunto)")
            }
        }
        didSet {
            if (self.origen.x < 0 || self.origen.y < 0){
                origen.x = oldValue.x
                origen.y = oldValue.y
            }
            print("El origen del rectangulo ya se movió de \(oldValue) a \(self.origen.describete())")
        }
    }
    var tamaño: Tamaño
    
    // Aquí con las llaves estamos indicando que esta serà una propiedad computada
    var centro: Punto {
        get {
            let centroX = origen.x + (tamaño.ancho / 2)
            let centroY = origen.y + (tamaño.alto / 2)
            return Punto(x: centroX, y: centroY)
        }
        
        set {
            origen.x = newValue.x - (tamaño.ancho / 2)
            origen.y = newValue.y - (tamaño.alto / 2)
        }
    }
    func describete() -> String {
        return "Rectángulo con origen en \(self.origen) y \(self.tamaño)"
    }
}s

var miRectángulo = Rectángulo(origen: Punto(x: 20, y: 10), tamaño: Tamaño(ancho: 50, alto: 15))
miRectángulo.describete()
miRectángulo.centro.describete()
miRectángulo.origen = Punto(x: 30, y: 40)
miRectángulo.describete()

// Si no tenemos un setter en la estructura de Rectángulo, intentamos setear la propiedad de centro de la estructura Rectángulo no nos va a dejar
// miRectángulo.centro = Punto(20, 30)

miRectángulo.centro = Punto (x: 100, y: 80)
miRectángulo.describete()
miRectángulo.origen = Punto (x: -10, y: 50)
miRectángulo.describete()
