//
//  EntradaYSalida.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

class EntradaYSalida {
    
    let diccionarios = Diccionarios()
    
    // MARK: - Leer entrada del usuario
    func obtieneInput() -> String {
        let teclado = FileHandle.standardInput
        let datosTecleados = teclado.availableData
        let datosEnString = String(data: datosTecleados, encoding: .utf8)!
        
        return datosEnString.trimmingCharacters(in: .newlines)
    }
    
    func reemplazarElementosString (cadena: String, listaDePalabrasAReemplazar: [String], StringDeReemplazo: String) -> String {
        var resultado = cadena

        for palabraInconveniente in listaDePalabrasAReemplazar {
            // hay que iterar caracter por caracter para asegurar que elimina todas las palabras
            for letra in resultado {
                resultado = resultado.replacingOccurrences(of: palabraInconveniente, with: StringDeReemplazo)
            }
        }

        return resultado
    }
    
    func quitarStringsVacios (cadena: String) -> [String] {
        let cadenaEnArray = cadena.components(separatedBy: " ")
        
        let resultado = cadenaEnArray.filter {!($0 == "" || $0 == " ")}
        
        return resultado
    }
    
    func obtenFecha (año: Int, mes: Int, día: Int) -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        let dateComponents = DateComponents(calendar: calendar, year: año, month: mes, day: día)
        let fecha = calendar.date(from: dateComponents)
        
        formatter.dateFormat = "yyMMdd"
        formatter.timeZone = TimeZone.current
        let date = formatter.string(from: fecha!)
        
        return date
    }
    
    func isInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    func quitarAcentosClave (clave: String, diccionarioAcentos: [String: String]) -> String {
        var resultado = clave
        
        for (letraConAcento, sustituto) in diccionarioAcentos {
            resultado = resultado.replacingOccurrences(of:letraConAcento, with: sustituto)
        }
        
        return resultado
    }
    
    func preparaStringParaValidaciones (cadena: String) -> String {
        var resultado = " "
        resultado += cadena
        resultado += " "
        resultado = resultado.uppercased()
        
        return resultado
    }
    
    func obtenerClaveHomonimia (entrada: String, diccionarioTabla1: [String: String], diccionarioTabla2: [String: String]) -> String {
        var resultado = ""
        var cadenaDeNumeros = ""
        var arregloString : [String] = []
        var arregloHomonimia : [String] = []
        var par = 0
        var suma = 0
        
        for letra in entrada {
            arregloString.append(String(letra))
        }
        
        for (caracter, sustituto) in diccionarioTabla1 {
            for i in 0..<arregloString.count{
                if arregloString[i] == caracter {
                    arregloString[i] = sustituto
                }
            }
        }
        
        arregloString.insert("0", at: 0)
        
        for palabra in arregloString {
            cadenaDeNumeros += palabra
        }
        
        let digitosCadena = cadenaDeNumeros.compactMap{$0.wholeNumberValue}
        
        for i in 0..<digitosCadena.count-1 {
            par = (digitosCadena[i] * 10) + digitosCadena[i+1]
            suma += par * digitosCadena[i+1]
        }
        
        let tresUltimosDigitos = suma % 1000
        let cociente = tresUltimosDigitos / 34
        let residuo = tresUltimosDigitos % 34
        
        arregloHomonimia.append(String(cociente))
        arregloHomonimia.append(String(residuo))
        
        for (caracter, sustituto) in diccionarioTabla2 {
            for i in 0..<arregloHomonimia.count{
                if arregloHomonimia[i] == caracter {
                    arregloHomonimia[i] = sustituto
                }
            }
        }
        
        resultado = arregloHomonimia.joined(separator: "")
        
        return resultado
    }
    
    func obtenerDigitoVerificador (rfcConHomonimia: String, diccionario: [String : String]) -> String {
        var digitosCadena : [Int] = []
        var arregloString : [String] = []
        var D = 0
        var x = 0
        var d = ""

        for letra in rfcConHomonimia {
            arregloString.append(String(letra))
        }
        
        for (caracter, sustituto) in diccionario {
            for i in 0..<arregloString.count{
                if arregloString[i] == caracter {
                    arregloString[i] = sustituto
                }
            }
        }
        
        for i in 0..<arregloString.count {
            digitosCadena.append(Int(arregloString[i]) ?? 0 )
        }

        for n in 0..<digitosCadena.count {
            D += (digitosCadena[n]) * (14 - (n+1))
        }

        if ((D % 11) == 0){
            d = "0"
        }
        else {
            if ((D % 11) < 10) && ((D % 11) > 0) {
                x = 11 - (D % 11)
                d = String(x)                
            }
            else {
                if ((D % 11) == 10) {
                    d = "A"
                }
            }
        }
        
        return d
    }
}
