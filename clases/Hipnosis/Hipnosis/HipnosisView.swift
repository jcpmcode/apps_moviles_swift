    //
//  HipnosisView.swift
//  Hipnosis
//
//  Created by molascoaga on 2/20/20.
//  Copyright © 2020 molascoaga. All rights reserved.
//

import UIKit

class HipnosisView: UIView {

    private var colorDelCirculo: UIColor = .black{
        didSet{
            setNeedsDisplay()
        }
    }
    
    func inicializaVista(){
        self.backgroundColor = .clear
    }
    //Este inicializador de llama cuando se instancia la vista desde codigo
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        inicializaVista()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        inicializaVista()
    }
    
    override func draw(_ rect: CGRect) {
        let tamañoDeLaVista = self.bounds
        let path = UIBezierPath()
//        path.move(to: tamañoDeLaVista.origin)
//        path.addLine(to: CGPoint(x: tamañoDeLaVista.maxX, y: tamañoDeLaVista.maxY))
//        path.move(to: CGPoint(x: tamañoDeLaVista.maxX, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: tamañoDeLaVista.maxY))
//
//        path.move(to: CGPoint(x: tamañoDeLaVista.maxX, y: tamañoDeLaVista.midY))
//        let centro = CGPoint(x: tamañoDeLaVista.midX, y: tamañoDeLaVista.midY)
//        let radio = min(tamañoDeLaVista.width, tamañoDeLaVista.height)/2
//        path.addArc(withCenter: centro, radius: radio, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        let centro = CGPoint(x: tamañoDeLaVista.midX, y: tamañoDeLaVista.midY)
        let radioMaximo = hypot(tamañoDeLaVista.width / 2 , tamañoDeLaVista.height / 2)
        for radio in stride(from: radioMaximo, to: 0, by: -10){
            path.move(to: CGPoint(x: centro.x + radio, y: centro.y))
            path.addArc(withCenter: centro, radius: radio, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
            
        }
        
        path.lineWidth = 3
        //UIColor.red.setStroke()
        self.colorDelCirculo.setStroke()
        path.stroke()
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Me tocaron")
        let rojo = CGFloat.random(in: 0...1)
        let verde = CGFloat.random(in: 0...1)
        let azul = CGFloat.random(in: 0...1)
        let colorRandom = UIColor(red: rojo, green: verde, blue: azul, alpha: 1)
        self.colorDelCirculo = colorRandom
        
    }

}
