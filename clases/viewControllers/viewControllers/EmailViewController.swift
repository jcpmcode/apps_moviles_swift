//
//  ViewController.swift
//  ViewControllers
//
//  Created by nathan on 3/4/20.
//  Copyright © 2020 nathan. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var labelDeEmailOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditaTexto" {
            if let destinoVC = segue.destination as? EditorViewController {
                destinoVC.textoAEditar = self.labelDeEmailOutlet.text
            }
        }
    }
    
//    @IBAction func realizaTransicion() {
//        let destinoViewController = EditorViewController()
//        destinoViewController.textoAEditar = labelDeEmailOutlet.text
//        //present(destinoViewController, animated: true, completion: nil)
//    }
    
}

