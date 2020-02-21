//
//  ViewController.swift
//  demoVista
//
//  Created by jpaniagua on 2/20/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let frameVistaSuperior = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height / 3))
        let vistaSuperior = UIView(frame: frameVistaSuperior)
        
        let frameVistaMedia = CGRect(origin: CGPoint(x: 0, y: self.view.bounds.size.height / 3), size: vistaSuperior.bounds.size)
        let vistaMedia = UIView(frame: frameVistaMedia)
        
        let vistaBaja = UIView(frame: CGRect(origin: CGPoint(x: 0, y: vistaMedia.frame.origin.y * 2), size: vistaSuperior.bounds.size))
        vistaSuperior.backgroundColor = .red
        vistaMedia.backgroundColor = .cyan
        vistaBaja.backgroundColor = .magenta
        
        // Desplegar las vistas que creamos previamente
        self.view.addSubview(vistaSuperior)
        self.view.addSubview(vistaMedia)
        self.view.addSubview(vistaBaja)
        self.view.bringSubviewToFront(self.view.subviews[0])
    }
    
    @IBAction func cambiaColor(_ sender: UIButton) {
        print(self.view.subviews)
        for i in 0..<self.view.subviews.count - 1{
            self.view.subviews[i].backgroundColor = UIColor (red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        }
    }
}
