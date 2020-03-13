//
//  PersonasMorales.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let entradaysalida = EntradaYSalida()
let diccionarios = Diccionarios()

// MARK: - Personas morales
// 1 espacio, 3 letras y 6 digitos 3 digitos adicionales para la homoclave (2 letras y 1 numero)
class PersonaMoral {
    
    // Esta función permite leer los datos de la persona moral
    func leerDatosPersonaMoral() -> (String, Int, Int, Int){
        var razonSocial = ""
        var str = ""
        var año = 0
        var mes = 0
        var día = 0
        
        print("Ingresa los datos de la persona moral a registrar:")
        repeat {    
            print("\tIngresa la razon social de la empresa: ")
            razonSocial = entradaysalida.obtieneInput()
        } while razonSocial.isEmpty
        print("Ingresa la fecha de creacion de la empresa:")
        repeat {
            repeat {    
                print("\tAño [AAAA]: ")
                str = entradaysalida.obtieneInput()
            } while (!(entradaysalida.isInt(string: str)))
            año = Int(str)!
            repeat {    
                print("\tMes [MM]: ")
                str = entradaysalida.obtieneInput()
            } while (!(entradaysalida.isInt(string: str)))
            mes = Int(str)!
            repeat {    
                print("\tDía [DD]: ")
                str = entradaysalida.obtieneInput()
            } while (!(entradaysalida.isInt(string: str)))
            día = Int(str)!
        } while (!(validaFechaPersonaMoral (año: año, mes: mes, día: día)))
        
        return (razonSocial, año, mes, día)
    }
    
    // Esta función obtiene la clave de la persona moral dependiendo de los datos ingresados
    func obtenClavePersonaMoral (razonSocial: [String]) -> String{
        var iniciales = " "
        
        if (razonSocial.count > 0) {
            if (razonSocial.count >= 3) {
                // Regla 1
                iniciales = inicialesTresPalabras(cadenaEnArray: razonSocial)
            }
            else {
                if (razonSocial.count == 2) {
                    // Regla 6
                    iniciales = inicialesDosPalabras(cadenaEnArray: razonSocial)
                    
                }
                else {
                    // Regla 7
                    if (razonSocial[0].count < 3){
                        // Regla 8
                        iniciales = inicialesUnaPalabraConMenosDeTresLetras(cadenaEnArray: razonSocial, numeroDeLetras: razonSocial[0].count)
                    }
                    else {
                        // Regla 7
                        iniciales = inicialesUnaPalabra(cadenaEnArray: razonSocial)
                    }
                }
            }
        }
        else {
            print("Tienes que ingresar al menos una palabra valida")
        }
        
        return iniciales
    }
    
    func inicialesTresPalabras (cadenaEnArray: [String]) -> String {
        var resultado = ""
        var contador = 0
        
        for palabra in cadenaEnArray {
            if contador < 3 {
                if let letra = palabra.first {
                    resultado.append(String(letra))
                    contador += 1
                }
            }
        }
        
        return resultado
    }
    
    func inicialesDosPalabras (cadenaEnArray: [String]) -> String {
        var resultado = ""        
        
        resultado += cadenaEnArray[0].prefix(1)
        resultado += cadenaEnArray[1].prefix(2)
        
        return resultado
    }
    
    func inicialesUnaPalabra (cadenaEnArray: [String]) -> String {
        var resultado = ""
        
        resultado += cadenaEnArray[0].prefix(3)
        
        return resultado
    }
    
    // 
    func inicialesUnaPalabraConMenosDeTresLetras (cadenaEnArray: [String], numeroDeLetras: Int) -> String {
        var resultado = ""
        var letrasRestantes = ""
        
        resultado += cadenaEnArray[0].prefix(3)
        if (numeroDeLetras == 1) {
            letrasRestantes = "XX"
        }
        else {
            letrasRestantes = "X"
        }
        resultado += letrasRestantes
        
        return resultado
    }
    
    // Esta función permite convertir los numeros romanos de una cadena en numeros arábigos
    func convertirNumerosRomanosArabigos (cadenaEnArray: [String], diccionarioNumerosRomanos: [String: Int]) -> [String] {
        var resultado = cadenaEnArray
        var primeraLetra = ""
        var contadorDePalabras = 0
        var flag = 0
        var acumulador = 0
        var contadorLetras = 0
        
        for palabra in cadenaEnArray {    
            if (palabra.count == 1) {
                primeraLetra = String(Array(palabra)[0])
                for (numero, sustituto) in diccionarioNumerosRomanos{
                    if primeraLetra == numero {            
                        resultado[contadorDePalabras] = String(sustituto)
                    }
                }
            }
            else {
                contadorLetras = 0
                for (numero, _) in diccionarioNumerosRomanos {
                    for letra in palabra {
                        if String(letra) == numero {                            
                            contadorLetras += 1
                        }
                    }
                }
                
                if contadorLetras == palabra.count {
                    flag = 1
                }
                
                acumulador = 0

                if (flag == 1) {
                    for (numero, sustituto) in diccionarioNumerosRomanos {
                        for indicePalabra in 0..<palabra.count {
                            if String(Array(palabra)[indicePalabra]) == numero {
                                acumulador += Int(sustituto)
                            }                    
                        }
                        resultado[contadorDePalabras] = String(acumulador)
                    }
                }
            }
            contadorDePalabras += 1
        }
        return resultado
    }
    
    // Esta función  para convertir números arábigos en palabras
    func convertirNumerosAPalabras (cadenaEnArray: [String]) -> String {
        var numeroEnLetras = ""
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: "es_MX")
        
        for palabra in cadenaEnArray {
            // Si el string contiene solo numeros, entonces los convierte a palabras y concatena
            if (CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: palabra))) {
                numeroEnLetras += formatter.string(from: NSNumber(value: Int(palabra)!))!
                numeroEnLetras += " "
            }
                // De lo contrario solo concatena la palabra
            else {
                numeroEnLetras += palabra
                numeroEnLetras += " "
            }
        }
        
        return numeroEnLetras.uppercased()
    }
    
    // Esta función sirve para validar que la fecha sea menor o igual a la fecha actual
    func validaFechaPersonaMoral (año: Int, mes: Int, día: Int) -> Bool {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        let dateComponents = DateComponents(calendar: calendar, year: año, month: mes, day: día)
        let fecha = calendar.date(from: dateComponents)
        var fechaEnString = ""
        let hoy = Date()
        
        fechaEnString = "\(año)" + "-" + "\(mes)" + "-" + "\(día)"        
        
        formatter.dateFormat = "yyyy-MM-dd"
        if formatter.date(from: fechaEnString) != nil {
            if fecha! > hoy {
                print ("La fecha ingresada no puede ser mayor a la actual. Por favor ingresa una fecha valida.")
                return false
            }             
        }
        else {
            print ("Algun dato de la fecha está mal. Revisa el formato requerido e ingresa una fecha valida.")
            return false
        }        
        return true
    }
    
    // Esta función permite obtener la razon social completa de la persona moral para poder ser utilizado en el calculo de la clave diferenciadora
    func filtraRazonSocial(entrada: String) -> String {
        var resultado = ""
        
        let razonSocialSinAcentos = entradaysalida.quitarAcentos (cadena: entrada, diccionarioAcentos: d.equivalenciasAcentos)
        let entradaLimpia = entradaysalida.quitarStringsVacios(cadena: razonSocialSinAcentos)
        let numerosRomanosAArabigos = personaMoral.convertirNumerosRomanosArabigos(cadenaEnArray: entradaLimpia, diccionarioNumerosRomanos: d.numerosRomanos)
        let numerosAPalabras = convertirNumerosAPalabras(cadenaEnArray: numerosRomanosAArabigos)
        let cadenaPreparada = entradaysalida.preparaStringParaValidaciones(cadena: numerosAPalabras)
        let cadenaSinCaracteresNoPermitidos = entradaysalida.reemplazarElementosString(cadena: cadenaPreparada, listaDePalabrasAReemplazar: d.caracteresNoPermitidos, StringDeReemplazo: "")
        let cadenaSinPuntosYComas = entradaysalida.reemplazarElementosString(cadena: cadenaSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: d.puntosYComas, StringDeReemplazo: " ")
        let cadenaFiltrada = entradaysalida.quitarStringsVacios(cadena: cadenaSinPuntosYComas)
        
        for palabra in cadenaFiltrada {
            resultado += palabra
            resultado += " "
        }
        return resultado
    }
    
    // Esta función utiliza varias de las funciones previamente definidas para poder calcular el RFC completo de la persona moral
    func generaRFCPersonaMoral(razonSocial: String, año: Int, mes: Int, día: Int) -> (String, String, String, String) {
        
        let razonSocialSinAcentos = entradaysalida.quitarAcentos (cadena: razonSocial, diccionarioAcentos: d.equivalenciasAcentos)
        let entradaLimpia = entradaysalida.quitarStringsVacios(cadena: razonSocialSinAcentos)
        let numerosRomanosAArabigos = personaMoral.convertirNumerosRomanosArabigos(cadenaEnArray: entradaLimpia, diccionarioNumerosRomanos: d.numerosRomanos)
        let numerosAPalabras = convertirNumerosAPalabras(cadenaEnArray: numerosRomanosAArabigos)
        let cadenaPreparada = entradaysalida.preparaStringParaValidaciones(cadena: numerosAPalabras)
        let cadenaSinCaracteresNoPermitidos = entradaysalida.reemplazarElementosString(cadena: cadenaPreparada, listaDePalabrasAReemplazar: d.caracteresNoPermitidos, StringDeReemplazo: "")
        let cadenaSinPalabrasNoPermitidas = entradaysalida.reemplazarElementosString(cadena: cadenaSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: d.tablaPalabrasNoUtilizadasRFCMorales, StringDeReemplazo: " ")        
        let cadenaSinPuntosYComas = entradaysalida.reemplazarElementosString(cadena: cadenaSinPalabrasNoPermitidas, listaDePalabrasAReemplazar: d.puntosYComas, StringDeReemplazo: " ")
        let cadenaFiltrada = entradaysalida.quitarStringsVacios(cadena: cadenaSinPuntosYComas)
        let clave = obtenClavePersonaMoral(razonSocial: cadenaFiltrada)
        let fechaFormateada = entradaysalida.obtenFecha (año: año, mes: mes, día: día)
        let razonSocialCompleta = filtraRazonSocial(entrada: razonSocial)
        let claveHomonimia = entradaysalida.obtenerClaveHomonimia(entrada: razonSocialCompleta, diccionarioTabla1: d.tablaValoresCaracteresNombre, diccionarioTabla2: d.tablaValoresCocienteYResiduo)
        let rfcConHomonimia = clave + fechaFormateada + claveHomonimia
        let digitoVerificador = entradaysalida.obtenerDigitoVerificador (rfcConHomonimia: rfcConHomonimia, diccionario: d.tablaValoresGeneracionDigitoVerificador)
        
        return (clave, fechaFormateada, claveHomonimia, digitoVerificador)
    }
    
}
