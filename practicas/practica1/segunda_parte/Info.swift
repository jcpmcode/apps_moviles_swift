//
//  Info.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

class Info {
    
    // MARK: - Uso del programa
    func imprimeUso() {
        let ejecutable = (CommandLine.arguments[0] as NSString).lastPathComponent
        print("Uso del programa:")
        print("\tEl programa no admite argumentos. El modo de ejecución normal es ./\(ejecutable)")
    }
    
    // MARK: - Descripción
    func imprimeDescripcion() {
        print("Descripción:")
        print("\tHola, este es un programa que genera el RFC tanto para personas fisicas como para personas morales.")
    }

}
