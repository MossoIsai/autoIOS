//
//  SMS.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 15/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit

class SMS: UIViewController{
    
    @IBOutlet weak var sms: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var vistaDown: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargarVista()
        
    }
    func cargarVista() {
        self.sms.textAlignment = .center
        self.password.textAlignment = .center
        let longitudCode = self.password.text?.characters
        
        if((longitudCode?.count)! > 4){
            let alerta =  UIAlertController(title: "Código incorrecto", message: "El código de verificación es incorrecto", preferredStyle:.alert)
            
            let ok =  UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            alerta.addAction(ok)
            present(alerta, animated: true, completion: nil)
        }
        
        vistaDown.layer.backgroundColor = UIColor.white.cgColor
        vistaDown.layer.borderColor = UIColor.gray.cgColor
        vistaDown.layer.borderWidth = 0.4

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
}
