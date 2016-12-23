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
    @IBOutlet weak var terminosCondiciones: UILabel!
    
    @IBOutlet weak var confirmarPassword: UITextField!
    
    @IBOutlet weak var labelSMS: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var btnSiguiente: UIButton!
    @IBAction func btnSiguiente(_ sender: Any) {
        let pass1 = password.text
        let pass2 = confirmarPassword.text
        let mensajeAlerta = Alertas()
        
        
        if sms.text == ""{
            mensajeAlerta.showAlert(controller: self, titulo: "Completar el campo nombre", mensaje: "Para poder seguir con el registro es necesario completar el campo nombre.")
        }else if pass1 == ""{
            mensajeAlerta.showAlert(controller: self, titulo: "Completar el campo contraseña", mensaje: "Para poder seguir con el registro es necesario completar el campo contraseña.")
            
        }else if pass2 == ""{
            mensajeAlerta.showAlert(controller: self, titulo: "Completar el campo  verificar contraseña", mensaje: "Para poder seguir con el registro es necesario completar el campo de verificar contraseña.")
        }else if pass1 != pass2 {
            mensajeAlerta.showAlert(controller: self, titulo: "Verificar contraseña", mensaje: "La contraseña de confirmación es diferente.")
        }
        else{
            
            mensajeAlerta.showAlert(controller: self, titulo: "Código de Activación", mensaje: "En breve recibiras un código de activación de 4 digitos por correo electrónico.")
        }
        
    }
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
        }else if((longitudCode?.count)! < 4){
            
            let alerta =  UIAlertController(title: "Código incorrecto", message: "El código de verificación es incorrecto", preferredStyle:.alert)
            
            let ok =  UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            alerta.addAction(ok)
            present(alerta, animated: true, completion: nil)
            
            
        }
        //Confuración de las vistas
        vistaDown.layer.backgroundColor = UIColor.white.cgColor
        vistaDown.layer.borderColor = UIColor.gray.cgColor
        vistaDown.layer.borderWidth = 0.4
        
        terminosCondiciones.text = "Al registrarte, aceptas nuestras Condiciones y la Politica de privacidad."
        
        /* btnSiguiente.layer.backgroundColor = UIColor.clear.cgColor
         btnSiguiente.layer.borderWidth = 1
         btnSiguiente.layer.borderColor = UIColor.black.cgColor
         btnSiguiente.layer.cornerRadius = 4*/
        btnSiguiente.backgroundColor =  UIColor(red: 255/255, green: 217/255, blue: 0/255, alpha: 1)
        btnSiguiente.layer.cornerRadius = 4
        btnSiguiente.layer.borderWidth = 1
        btnSiguiente.layer.borderColor = UIColor(red: 255/255, green: 217/255, blue: 0/255, alpha: 1).cgColor
        
        //label introduce cófigo de verificacion
        labelSMS.lineBreakMode = NSLineBreakMode.byCharWrapping
        labelSMS.numberOfLines = 2
        labelSMS.textAlignment = .left
        
        labelPassword.lineBreakMode = NSLineBreakMode.byCharWrapping
        labelPassword.numberOfLines = 2
        labelPassword.textAlignment = .left
        terminosCondiciones.lineBreakMode = NSLineBreakMode.byCharWrapping
        terminosCondiciones.numberOfLines = 2
        terminosCondiciones.textAlignment = .center
        confirmarPassword.textAlignment = .center
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
