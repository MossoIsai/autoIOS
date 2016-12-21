//
//  Login.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 15/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation


class Login: UIViewController {


@IBOutlet weak var correo: UITextField!
@IBOutlet weak var contrasena: UITextField!
@IBOutlet weak var terminos_condiciones: UILabel!

@IBOutlet weak var viewTop: UIView!
@IBOutlet weak var btnEnter: UIButton!
@IBOutlet weak var view_down: UIView!
//boton de entrar
@IBAction func btnEnter(_ sender: Any) {
    if(correo.text == "" || contrasena.text == ""){
       /* let alertaManager = UIAlertController(title: "Campos vacios", message: "Usuario y contraseña incorrecta", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Aceptar", style: .default, handler:nil)
        alertaManager.addAction(ok)
        self.present(alertaManager, animated: false, completion: nil)*/
        let managerAlert =  Alertas()
       managerAlert.showAlert(controller: self, titulo: "Campos vacios", mensaje: "Usuario y contraseña incorrecta")
        
        
    }
}
override func viewDidLoad() {
    super.viewDidLoad()
    cargarVistas()
    /**Reproducir video**/
    /*let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    let player = AVPlayer(url: videoURL! as URL)
    let playerLayer = AVPlayerLayer(player: player)
    //playerLayer.frame = self.view.bounds
    // playerLayer.frame = self.viewTop.frame.width
    // self.view.layer.addSublayer(playerLayer)
    self.viewTop.layer.addSublayer(playerLayer)
    player.play()*/
}
func cargarVistas() {
    self.correo.text = "ing.isaimosso@gmail.com"
    self.correo.textAlignment = .center
    self.contrasena.textAlignment = .center
    //Aquí ponemos la contraseña
    self.contrasena.isSecureTextEntry = true
   /* btnEnter.layer.borderColor = UIColor.black.cgColor
    btnEnter.layer.borderWidth = 1
    btnEnter.layer.backgroundColor = UIColor.clear.cgColor
    btnEnter.layer.cornerRadius = 4*/
    
    self.btnEnter.backgroundColor =  UIColor(red: 255/255, green: 217/255, blue: 0/255, alpha: 1)
    self.btnEnter.layer.cornerRadius = 4
    self.btnEnter.layer.borderWidth = 1
    self.btnEnter.layer.borderColor = UIColor(red: 255/255, green: 217/255, blue: 0/255, alpha: 1).cgColor
    
    
    self.terminos_condiciones.text = "Al registrarte, aceptas nuestras Condiciones y la Politica de privacidad."
    self.terminos_condiciones.textAlignment = .center
    
    view_down.layer.borderWidth = 0.4
    view_down.layer.backgroundColor = UIColor.clear.cgColor
    view_down.layer.borderColor = UIColor.gray.cgColor
    
    
    terminos_condiciones.lineBreakMode = NSLineBreakMode.byWordWrapping
    terminos_condiciones.numberOfLines = 2
    
}
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}

}
