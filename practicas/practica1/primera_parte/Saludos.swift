import Foundation

class Saludos {
    let entradaYSalida = EntradaYSalida()
    var formatoFecha: DateFormatter = {
        let formato = DateFormatter()
        formato.DateStyle = .long

        return formato
    } ()

    func saluda () {
        if CommandLine.argc > 1 {
            entradaYSalida.imprimeUso()
        } else {
            entradaYSalida.imprimeAConsola("Este programa te preguntará tu nombre y apellido y te saludará dejándote saber la fecha del saludo")
            entradaYSalida.imprimeAConsola("¿Cuál es tu nombre?")
            let nombre = entradaYSalida.obtieneInput()
            entradaYSalida.imprimeAConsola("¿Cuál es tu apellido?")
            let apellido = entradaYSalida.obtieneInput()
            let fecha = Date()
            entradaYSalida.imprimeAConsola("Hola \(nombre) \(apellido), hoy es \(formatoFecha.string(from: fecha))")
        }
    }
}