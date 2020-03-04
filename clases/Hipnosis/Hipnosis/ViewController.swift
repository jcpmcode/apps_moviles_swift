//
//  ViewController.swift
//  Hipnosis
//
//  Created by jpaniagua on 2/20/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var campoDeTexto: UITextField!
    var animador : UIDynamicAnimator!
    var gravedad : UIGravityBehavior!
    var colision: UICollisionBehavior!
    var propiedadesDeAnimacion : UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let anchoDelCampoDeTexto = self.view.bounds.width * 0.75
        let origenDelCampoDeTextoX = (self.view.bounds.width - anchoDelCampoDeTexto) / 2
        let rectCampoDeTexto = CGRect(x: origenDelCampoDeTextoX, y: -30, width: anchoDelCampoDeTexto, height: 30)
        self.campoDeTexto = UITextField(frame: rectCampoDeTexto)
        
        self.campoDeTexto.backgroundColor = .white
        self.campoDeTexto.borderStyle = .roundedRect
        self.campoDeTexto.placeholder = "Hipnotizate"
        self.campoDeTexto.returnKeyType = .done
        self.campoDeTexto.delegate = self
        self.view.addSubview(campoDeTexto)
        //Animaciones dinámicas
        self.animador = UIDynamicAnimator(referenceView: self.view)
        self.gravedad = UIGravityBehavior()
        self.gravedad.magnitude = 0.5
        self.animador.addBehavior(gravedad)
        self.colision = UICollisionBehavior()
        self.colision.translatesReferenceBoundsIntoBoundary = true
        self.colision.addBoundary(withIdentifier: "resbaladilla1" as NSString, from: CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.maxY), to: CGPoint(x: self.view.bounds.maxX * 3 / 4, y: self.view.bounds.maxY * 3 / 8))
        self.colision.addBoundary(withIdentifier: "resbaladilla2" as NSString, from: CGPoint(x: 0, y: self.view.bounds.maxY / 2), to: CGPoint(x: self.view.bounds.maxX / 2, y: self.view.bounds.maxY * 3 / 4))
        self.animador.addBehavior(colision)
        
    }
    
    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(
            withDuration: 2.0,
            delay: 0.5,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 1,
            options: .layoutSubviews,
            animations: {
                self.campoDeTexto.frame.origin.y = 30
                
        },
            completion: nil)
    }
    
    //
    func textFieldShouldReturn(_ textfield: UITextField)-> Bool{
        print("Presionaron Return")
        print("Teclearon el texto \(textfield.text!)")
        self.ponMensajes(mensaje: textfield.text!)
        textfield.text = ""
        textfield.placeholder = "Hipnotizateee"
        textfield.resignFirstResponder()
        
        return true
    }
    
    func ponMensajes(mensaje: String) {
        for _ in 0..<20 {
            let label = UILabel()
            label.backgroundColor = .clear
            label.textColor = .black
            label.text = mensaje
            label.sizeToFit()
            let anchoDisponible = self.view.bounds.maxX - label.bounds.size.width
            let coordenadaX = CGFloat.random(in: 0..<anchoDisponible)
            let finDeCampoDeTextoVertical = self.campoDeTexto.frame.origin.y + self.campoDeTexto.bounds.size.height
            let alturaDisponible = self.view.bounds.maxY - label.bounds.size.height
            let coordenadaY = CGFloat.random(in: finDeCampoDeTextoVertical..<alturaDisponible)
            
            label.frame.origin = CGPoint(x: coordenadaX, y: coordenadaY)
            self.view.addSubview(label)
            //animar
            
            label.alpha = 0
            
            
            UIView.animate(withDuration: 3.0, animations: {
                label.alpha  = 1
            })
            
            UIView.animateKeyframes(withDuration: 1.0, delay: 3.0, options: .layoutSubviews, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                    label.center = self.view.center
                    
                })
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                    label.frame.origin = CGPoint(x: CGFloat.random(in: 0..<anchoDisponible), y: CGFloat.random(in: finDeCampoDeTextoVertical..<alturaDisponible))
                })
            }, completion:{
                (finalizoLaAnimacionAnterior: Bool) in
                if finalizoLaAnimacionAnterior{
                    self.gravedad.addItem(label)
                    self.colision.addItem(label)
                    self.propiedadesDeAnimacion.addItem(label)
                }
            } )
            
        }
    }
    
    
}
