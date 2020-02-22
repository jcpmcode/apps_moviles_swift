//
//  HipnosisView.swift
//  Hipnosis
//
//  Created by jpaniagua on 2/20/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import UIKit

class HipnosisView: UIView {

    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
 */
    override func draw(_ rect: CGRect) {
        // Drawing code
        let tamañoDeLaVista = self.bounds
        let path = UIBezierPath()
//        path.move(to: tamañoDeLaVista.origin)
//        path.addLine(to: CGPoint(x: tamañoDeLaVista.maxX, y: tamañoDeLaVista.maxY))
//        path.move(to: CGPoint(x: tamañoDeLaVista.maxX, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: tamañoDeLaVista.maxY))
        
        let centro = CGPoint(x: tamañoDeLaVista.midX, y: tamañoDeLaVista.midY)
        let radio = min(tamañoDeLaVista.width, tamañoDeLaVista.height) / 2.0
        path.addArc(withCenter: centro, radius: radio, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        
        path.stroke()
    }
    

}
