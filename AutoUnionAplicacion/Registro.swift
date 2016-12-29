//
//  Registro.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer


class Registro: UIViewController {
    
    @IBOutlet weak var seccionIniciaSesion: UIView!
    //@IBOutlet weak var segmentRegistro: UISegmentedControl!
    @IBOutlet weak var btnNextStyle: UIButton!
    
    @IBOutlet weak var terminos_condiciones: UILabel!
    //@IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var telefono: UITextField!
   // var moviePlayer: MPMoviePlayerController?
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var etiquetaWhatsapp: UILabel!
    @IBOutlet weak var btnSwitch: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

            cargarVistas()
    }
    @IBAction func btnSiguiente(_ sender: Any) {
        let correo = self.email.text
         self.validarTelefono(textTelefono: telefono)
        if self.validateEmail(texto: correo!) {
            
        }else{
            
            let mensajeAlerta = Alertas()
            mensajeAlerta.showAlert(controller: self, titulo: "Correo invalido", mensaje: "Por favor, verifica tu correo electrónico")
        }
    }
    @IBAction func btnCheck(_ sender: Any) {
        
        if(telefono.text == ""){
            
            let mensajeAlerta = Alertas()
            mensajeAlerta.showAlert(controller: self, titulo: "Ingresa tu número telefónico", mensaje: "El número de telefónico no es valido")
            
        }else{
            
            let btn = (sender) as? UIButton;
            let imagen = UIImage(named: "check_on")
            btn?.setImage(imagen, for: .normal)
        }
        
        
    }
    func cargarVistas(){
        //vista borrosa
        
        /*if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.view.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            
            /**Si tiene más UIViews, use una API
             insertSubview para colocarla donde sea necesario*/
            //Vista de abajo
            self.seccionIniciaSesion.layer.borderWidth = 0.4
            self.seccionIniciaSesion.layer.borderColor = UIColor.gray.cgColor
            self.seccionIniciaSesion.layer.backgroundColor =  UIColor.clear.cgColor
            self.view.addSubview(seccionIniciaSesion)
            
            
            self.segmentRegistro.tintColor = UIColor.black
            
            //Button siguiente
            self.btnNextStyle.layer.backgroundColor =  UIColor.clear.cgColor
            self.btnNextStyle.layer.cornerRadius = 4
            self.btnNextStyle.layer.borderColor = UIColor.black.cgColor
            self.btnNextStyle.layer.borderWidth = 1
            
            self.imagenFondo.image = UIImage(named: "car2")
            
            self.view.addSubview(segmentRegistro)
            self.view.addSubview(btnNextStyle)
            self.view.addSubview(telefono)
            //playVideo()
            
            
        } else {
            self.view.backgroundColor = UIColor.black
        }*/
        
        self.seccionIniciaSesion.layer.borderWidth = 0.4
        self.seccionIniciaSesion.layer.borderColor = UIColor.gray.cgColor
        self.seccionIniciaSesion.layer.backgroundColor =  UIColor.clear.cgColor
        self.view.addSubview(seccionIniciaSesion)
       // self.segmentRegistro.tintColor = UIColor.black
        
        //Button siguiente simple negro
        /**self.btnNextStyle.layer.backgroundColor =  UIColor.clear.cgColor
        self.btnNextStyle.layer.cornerRadius = 4
        self.btnNextStyle.layer.borderColor = UIColor.black.cgColor
        self.btnNextStyle.layer.borderWidth = 1**/
        self.btnNextStyle.backgroundColor =  UIColor(red: 6/255, green: 52/255, blue:112/255, alpha: 1)
        self.btnNextStyle.layer.cornerRadius = 4
        self.btnNextStyle.layer.borderWidth = 1
        self.btnNextStyle.layer.borderColor = UIColor(red: 6/255, green: 52/255, blue:112/255, alpha: 1).cgColor
        
       // self.imagenFondo.image = UIImage(named: "car2")
        
       // self.view.addSubview(segmentRegistro)
        //self.view.addSubview(btnNextStyle)
       // self.view.addSubview(telefono)
        
        //lyendda de whatsapp
        
        self.etiquetaWhatsapp.text = "Utilizar este número telefónico para la comunicación via whatsapp."
        
        self.etiquetaWhatsapp.lineBreakMode = NSLineBreakMode.byWordWrapping
        etiquetaWhatsapp.numberOfLines = 2
        //etiquetaWhatsapp.textAlignment = .center
        self.telefono.textAlignment = .center
        /*telefono.attributedText = NSAttributedString(string: "Teléfono",
                                                     attributes: [NSForegroundColorAttributeName: UIColor.yellow])*/
        self.email.textAlignment = .center
        /*email.attributedText = NSAttributedString(string: "Correo",
                                                     attributes: [NSForegroundColorAttributeName: UIColor.yellow])*/
        
        let buttonConfirmar = UIButton(type: .custom)
        buttonConfirmar.isSelected = true
        buttonConfirmar.setImage(UIImage(named:"check_on"), for: .selected)
        buttonConfirmar.setImage(UIImage(named:"check_off"), for: .normal)
        
        self.terminos_condiciones.text = "Al registrarte, aceptas nuestras Condiciones y la Politica de privacidad."
        
        
        self.terminos_condiciones.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.terminos_condiciones.numberOfLines = 2
        
        self.terminos_condiciones.textAlignment = .center
        
    
    }
    //Validar textoField Telefono
    func validarTelefono(textTelefono:UITextField!){
        let celular = textTelefono.text
        let mensajeAlerta  = Alertas() //variable  de alerta aceptar
        
        if(celular == ""){
           
            mensajeAlerta.showAlert(controller: self, titulo: "Agregar un teléfono", mensaje: "Para poder seguir con el registro es necesario proporcinar un número telefónico")
            
        }else if((celular?.characters.count)! > 10){
            
            mensajeAlerta.showAlert(controller: self, titulo: "Teléfono no valido", mensaje: "El número de telefónico no es valido")
            
        }else if((celular?.characters.count)! < 10){
            
            mensajeAlerta.showAlert(controller: self, titulo: "Teléfono no valido", mensaje: "El número de telefónico no es valido")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func validateEmail(texto:String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: texto)
        
    }
    /*func playVideo() {
        
       /* let videoView = UIView(frame: CGRect(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.frame.width, self.view.frame.height))*/
        
        
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height));
        
        let   pathToEx1 = Bundle.main.path(forResource: "video_auto", ofType: "mp4")
        
        let pathURL = NSURL.fileURL(withPath: pathToEx1!)
        
        moviePlayer = MPMoviePlayerController(contentURL: pathURL)
        if let player = moviePlayer {
            player.view.frame = videoView.bounds
            player.prepareToPlay()
            player.scalingMode = .aspectFill
            videoView.addSubview(player.view)
        }
        
        self.view.addSubview(videoView)
    }*/
}
