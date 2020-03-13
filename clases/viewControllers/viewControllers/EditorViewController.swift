//
//  EditorViewController.swift
//  ViewControllers
//
//  Created by nathan on 3/4/20.
//  Copyright © 2020 nathan. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController, UITextFieldDelegate {
    var textoAEditar: String?

    @IBOutlet weak var botonListo: UIButton!
    @IBOutlet weak var campoDeTextoOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.campoDeTextoOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func listo() {
//        if (self.campoDeTextoOutlet.text?.isEmpty)! {
//            self.botonListo.isEnabled = false
//        }
//        else {
//
        (presentingViewController as! EmailViewController).labelDeEmailOutlet.text = self.campoDeTextoOutlet.text
        self.dismiss(animated: true, completion: nil)
//        }
    }
    
    @IBAction func ValidaModificacionesAlCampoDeTexto(_ sender: Any) {
        if (campoDeTextoOutlet.text?.isEmpty)! {
                    self.botonListo.isEnabled = false
                }
        else {
            self.botonListo.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.campoDeTextoOutlet.text = self.textoAEditar
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        if textField.text!.isEmpty {
//            self.botonListo.isEnabled = false
//            return false
//        }
//        self.botonListo.isEnabled = true
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
