//
//  PersonasFisicas.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let entradaYSalida = EntradaYSalida()
let dicc = Diccionarios()

// MARK: - Personas fisicas
//  3 letras, 1 espacio y 6 digitos. 3 digitos adicionales para la homoclave (2 letras y 1 numero)
class PersonaFisica {
    
    func leerDatosPersonaFisica() -> (String, String, String, Int, Int, Int) {
        var apellidoPaterno = ""
        var apellidoMaterno = ""
        var nombres = ""
        var str = ""
        var año = 0
        var mes = 0
        var día = 0
        
        // Validar el nombre no contengan numeros

        print("Ingresa los datos de la persona fisica a registrar: ")
        repeat {            
            print("\tApellido paterno: ")
            apellidoPaterno = entradaYSalida.obtieneInput()
            print("\tApellido Materno: ")
            apellidoMaterno = entradaYSalida.obtieneInput()
            if (apellidoMaterno.isEmpty && apellidoPaterno.isEmpty) {
                print("Debes tener al menos un apellido para registrate")
            }
        } while (apellidoMaterno.isEmpty && apellidoPaterno.isEmpty)
        repeat {
            print("\tNombre(s): ")
            nombres = entradaYSalida.obtieneInput()
        } while nombres.isEmpty 
        
        // Validar que la fecha de nacimiento cumpla con el requisito de que la persona tenga los 18 años cumplidos
        print("Ingresa la fecha de nacimiento:")
        repeat {
            repeat {    
                print("\tAño [AAAA]: ")
                str = entradaYSalida.obtieneInput()
            } while (!(entradaYSalida.isInt(string: str)))
            año = Int(str)!
            repeat {    
                print("\tMes [MM]: ")
                str = entradaYSalida.obtieneInput()
            } while (!(entradaYSalida.isInt(string: str)))
            mes = Int(str)!
            repeat {    
                print("\tDía [DD]: ")
                str = entradaYSalida.obtieneInput()
            } while (!(entradaYSalida.isInt(string: str)))
            día = Int(str)!
        } while (!(validaFechaNacimientoPersonaFisica (año: año, mes: mes, día: día)))
        
        return (apellidoPaterno, apellidoMaterno, nombres, año, mes, día)
    }
    
    func obtenClavePersonaFisica (apellidoPaterno: [String], apellidoMaterno: [String], nombres: [String]) -> String{
        var iniciales = ""
        
        // siempre tomo la primera palabra
        if (nombres.count > 0){
            if ((apellidoPaterno.count > 0) && (apellidoMaterno.count > 0)) {
                // Regla 1
                if (apellidoPaterno[0].count > 2) {
                    iniciales = inicialesConNombreCompleto(apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, nombres: nombres)
                }
                else {
                    // Regla 4
                    iniciales = inicialesConApellidoPaternoPequeño(apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, nombres: nombres)
                }
            }
            else {
                // Regla 7
                if ((apellidoPaterno.count > 0) && (apellidoMaterno.count == 0)) {
                    iniciales = inicialesSinApellidoMaterno (apellidoPaterno: apellidoPaterno, nombres: nombres)
                }
                else {
                    if ((apellidoPaterno.count == 0) && (apellidoMaterno.count > 0)) {                
                        iniciales = inicialesSinApellidoPaterno (apellidoMaterno: apellidoPaterno, nombres: apellidoMaterno)
                    }
                }
            }
        }
        else {
            print("Tienes que ingresar al menos un nombre")
        }
        
        return iniciales
    }
    
    func validaFechaNacimientoPersonaFisica (año: Int, mes: Int, día: Int) -> Bool {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        let dateComponents = DateComponents(calendar: calendar, year: año, month: mes, day: día)
        let fecha = calendar.date(from: dateComponents)
        var fechaEnString = ""
        let hoy = Date()
        let date1 = calendar.startOfDay(for: fecha!)
        let date2 = calendar.startOfDay(for: hoy)
        let components = calendar.dateComponents([.year], from: date1, to: date2)
        
        fechaEnString = "\(año)" + "-" + "\(mes)" + "-" + "\(día)"        
        
        formatter.dateFormat = "yyyy-MM-dd"
        //if let date = formatter.date(from: fechaEnString) {
        if formatter.date(from: fechaEnString) != nil {
            if fecha! > hoy {    
                print ("La fecha ingresada no puede ser mayor a la actual. Por favor ingresa una fecha valida.")
                return false
            }
            else{
                if components.year! < 18 {
                    print ("Necesitas tener cumplidos los 18 años. Por favor ingresa una fecha valida.")
                    return false
                }
            }             
        }
        else {
            print ("Algun dato de la fecha está mal. Revisa el formato requerido e ingresa una fecha valida.")
            return false
        }        
        return true
    }
    
    func inicialesSinApellidoMaterno (apellidoPaterno: [String], nombres: [String]) -> String{
        var resultado = ""
        
        resultado += apellidoPaterno[0].prefix(2)
        resultado += nombres[0].prefix(2)
        
        return resultado
    }
    
    func inicialesSinApellidoPaterno (apellidoMaterno: [String], nombres: [String]) -> String{
        var resultado = ""
        
        resultado += apellidoMaterno[0].prefix(2)
        resultado += nombres[0].prefix(2)
        
        return resultado
    }
    
    func inicialesConApellidoPaternoPequeño(apellidoPaterno: [String], apellidoMaterno: [String], nombres: [String]) -> String {
        var resultado = ""
        
        resultado += apellidoPaterno[0].prefix(1)
        resultado += apellidoMaterno[0].prefix(1)
        resultado += nombres[0].prefix(2)
        
        return resultado
    }
    
    func inicialesConNombreCompleto(apellidoPaterno: [String], apellidoMaterno: [String], nombres: [String]) -> String {
        var resultado = ""
        
        resultado += apellidoPaterno[0].prefix(1)
        resultado += primeraVocal(apellidoPaterno: apellidoPaterno)
        resultado += apellidoMaterno[0].prefix(1)
        // Regla 6
        if (nombres[0] == "JOSÉ" || nombres[0] == "MARÍA" || nombres[0] == "JOSE" || nombres[0] == "MARIA") {
            resultado += nombres[1].prefix(1)
        }
        else {            
            resultado += nombres[0].prefix(1)
        }
        
        return resultado
    }
    
    func primeraVocal (apellidoPaterno: [String]) -> String {
        var resultado = ""
        var i = 0
        
        for letra in apellidoPaterno[0] {
            if i > 0 {
                if (letra == "A" || letra == "E" || letra == "I" || letra == "O" || letra == "U") {
                    resultado = String(letra)
                    return resultado
                }
            }
            i += 1
        }
        
        return resultado
    }
    
    func sustituirPalabraInconvenienteClave (clave: String, listaDePalabrasInconvenientes: [String: String]) -> String {
        var resultado = clave
        
        for (palabraInconveniente, sustituto) in listaDePalabrasInconvenientes {
            if clave == palabraInconveniente {
                resultado = sustituto
                return resultado
            }
        }
        
        return resultado
    }
    
    func filtraNombreCompleto (apellidoPaterno: String, apellidoMaterno: String, nombres: String, año: Int, mes: Int, día: Int) -> String {
        var resultado = ""
        let apellidoPaternoPreparado = entradaysalida.preparaStringParaValidaciones(cadena: apellidoPaterno)
        let apellidoPaternoSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: apellidoPaternoPreparado, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let apellidoPaternoSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: apellidoPaternoSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let apellidoPaternoFiltrado = entradaYSalida.quitarStringsVacios(cadena: apellidoPaternoSinPuntosYComas)
        
        let apellidoMaternoPreparado = entradaysalida.preparaStringParaValidaciones(cadena: apellidoPaterno)
        let apellidoMaternoSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: apellidoMaternoPreparado, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let apellidoMaternoSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: apellidoMaternoSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let apellidoMaternoFiltrado = entradaYSalida.quitarStringsVacios(cadena: apellidoMaternoSinPuntosYComas)
        
        let nombresPreparada = entradaysalida.preparaStringParaValidaciones(cadena: nombres)
        let nombresSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: nombresPreparada, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let nombresSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: nombresSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let nombresFiltrados = entradaYSalida.quitarStringsVacios(cadena: nombresSinPuntosYComas)
        
        for palabra in apellidoPaternoFiltrado {
            resultado += palabra
        }
        for palabra in apellidoMaternoFiltrado {
            resultado += palabra
        }
        for palabra in nombresFiltrados {
            resultado += palabra
        }
        
        return resultado
    }
    
    func generaRFCPersonaFisica(apellidoPaterno: String, apellidoMaterno: String, nombres: String, año: Int, mes: Int, día: Int) -> (String, String, String, String) {
        let apellidoPaternoPreparado = entradaysalida.preparaStringParaValidaciones(cadena: apellidoPaterno)
        let apellidoPaternoSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: apellidoPaternoPreparado, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let apellidoPaternoSinPalabrasNoPermitidas = entradaYSalida.reemplazarElementosString(cadena: apellidoPaternoSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.tablaPalabrasNoUtilizadasRFCFisicas, StringDeReemplazo: " ")
        let apellidoPaternoSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: apellidoPaternoSinPalabrasNoPermitidas, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let apellidoPaternoFiltrado = entradaYSalida.quitarStringsVacios(cadena: apellidoPaternoSinPuntosYComas)
        
        let apellidoMaternoPreparado = entradaysalida.preparaStringParaValidaciones(cadena: apellidoPaterno)
        let apellidoMaternoSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: apellidoMaternoPreparado, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let apellidoMaternoSinPalabrasNoPermitidas = entradaYSalida.reemplazarElementosString(cadena: apellidoMaternoSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.tablaPalabrasNoUtilizadasRFCFisicas, StringDeReemplazo: " ")
        let apellidoMaternoSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: apellidoMaternoSinPalabrasNoPermitidas, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let apellidoMaternoFiltrado = entradaYSalida.quitarStringsVacios(cadena: apellidoMaternoSinPuntosYComas)
        
        let nombresPreparada = entradaysalida.preparaStringParaValidaciones(cadena: nombres)
        let nombresSinCaracteresNoPermitidos = entradaYSalida.reemplazarElementosString(cadena: nombresPreparada, listaDePalabrasAReemplazar: dicc.caracteresNoPermitidos, StringDeReemplazo: "")
        let nombresSinPalabrasNoPermitidas = entradaYSalida.reemplazarElementosString(cadena: nombresSinCaracteresNoPermitidos, listaDePalabrasAReemplazar: dicc.tablaPalabrasNoUtilizadasRFCFisicas, StringDeReemplazo: " ")
        let nombresSinPuntosYComas = entradaYSalida.reemplazarElementosString(cadena: nombresSinPalabrasNoPermitidas, listaDePalabrasAReemplazar: dicc.puntosYComas, StringDeReemplazo: "")
        let nombresFiltrados = entradaYSalida.quitarStringsVacios(cadena: nombresSinPuntosYComas)
        
        let clave = obtenClavePersonaFisica (apellidoPaterno: apellidoPaternoFiltrado, apellidoMaterno: apellidoMaternoFiltrado, nombres: nombresFiltrados)
        let claveValidada = sustituirPalabraInconvenienteClave (clave: clave, listaDePalabrasInconvenientes: dicc.tablaPalabrasInconvenientes)
        let claveSinAcentos = entradaYSalida.quitarAcentosClave (clave: claveValidada, diccionarioAcentos: dicc.equivalenciasAcentos)
        let fechaFormateada = entradaYSalida.obtenFecha (año: año, mes: mes, día: día)
        let nombreCompletoFiltrado = filtraNombreCompleto (apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, nombres: nombres, año: año, mes: mes, día: día)
        let claveHomonimia = entradaYSalida.obtenerClaveHomonimia(entrada: nombreCompletoFiltrado, diccionarioTabla1: dicc.tablaValoresCaracteresNombre, diccionarioTabla2: dicc.tablaValoresCocienteYResiduo)
        let digitoVerificador = entradaYSalida.obtenerDigitoVerificador (rfcConHomonimia: rfcConHomonimia, diccionario: dicc.tablaValoresGeneracionDigitoVerificador)
        
        return (claveSinAcentos, fechaFormateada, claveHomonimia, digitoVerificador)
    }
    
}
