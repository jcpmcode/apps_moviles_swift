import Foundation

class EntradaYSalida {
    func imprimeAConsola (_ mensaje: String) {
        print (mensaje)
    }

    func imprimeUso() {
        let ejecutable = (CommandLine.arguments[0] as NSString).lastPathComponent

        imprimeAConsola("Descripción: ")
        imprimeAConsola("\t\(ejecutable) saluda al usuario preguntándole su nombre e imprimiendo la hora del saludo")
        imprimeAConsola("Opciones")
        imprimeAConsola("\t-h imprime esta ayuda")
    }

    func obtieneInput() -> String {
        let teclado = FileHandle.standardInput
        let datosTecleados = teclado.availableData
        let datosEnString = String(data: datosTecleados, encoding: .utf8)!

        return datosEnString.trimmingCharacters(in: .newlines)
    }
}