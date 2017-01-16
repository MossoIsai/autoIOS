//
//  RecuperarPassword.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 27/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit
private var alerta = Alertas()

class RecuperarPassword: UIViewController {
    
    
    
    @IBOutlet weak var imagenSeguridad: UIImageView!
    @IBOutlet weak var labelEncabezado: UILabel!
    @IBOutlet weak var labelCorreo: UILabel!
    @IBOutlet weak var fondoBajo: UIView!
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBAction func btnEnviar(_ sender: Any) {
        
        let correo = emailText.text
        
        if emailText.text == "" {
            alerta.showAlert(controller: self, titulo: "Llena el campo faltante", mensaje: "Ingresa un correo electrónico")
        }else{
            if self.validateEmail(texto: correo!){
                
                let alertaManager = UIAlertController(title: "Confirmación", message: "En breve recibirás un correo para recuperar tu contraseña", preferredStyle: .alert)
                let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (alert:UIAlertAction!)-> Void in
                     self.performSegue(withIdentifier: "returnLogin", sender: self)
                })
                alertaManager.addAction(aceptarAction)
                self.present(alertaManager, animated: true, completion: nil)
                
            }else{
                alerta.showAlert(controller: self, titulo: "Correo inválido", mensaje: "Por favor, verifica tu correo.")
            }
        }
        
    }
    
    @IBOutlet weak var btnEnviar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargarPantalla()
        
        
    }
    
    func cargarPantalla(){
        labelCorreo.text = "Ingresa tu correo electrónico ó número teléfonico para poder recuperar el acceso a tu cuenta."
        labelCorreo.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelCorreo.numberOfLines = 2
        
        btnEnviar.layer.cornerRadius = 5
        btnEnviar.layer.borderColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).cgColor
        
        btnEnviar.layer.borderWidth = 1.2
        
        //parte baja de la aplicación
        fondoBajo.layer.borderWidth =  1
        fondoBajo.layer.borderColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2).cgColor
        
        fondoBajo.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.15)
        
        emailText.placeholder = "Correo electrónico"
        emailText.textAlignment = .center
        emailText.tintColor = UIColor.white
        emailText.becomeFirstResponder()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func validateEmail(texto:String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: texto)
        
    }
    
}

