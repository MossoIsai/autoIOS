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
    //@IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var telefono: UITextField!
   // var moviePlayer: MPMoviePlayerController?
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var etiquetaWhatsapp: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

            cargarVistas()
    }
    
  
    
    @IBAction func btnSiguiente(_ sender: Any) {
         self.validarTelefono(textTelefono: telefono)
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
        
        //Button siguiente
        self.btnNextStyle.layer.backgroundColor =  UIColor.orange.cgColor
        self.btnNextStyle.layer.cornerRadius = 4
        self.btnNextStyle.layer.borderColor = UIColor.orange.cgColor
        self.btnNextStyle.layer.borderWidth = 1
        
       // self.imagenFondo.image = UIImage(named: "car2")
        
       // self.view.addSubview(segmentRegistro)
        self.view.addSubview(btnNextStyle)
        self.view.addSubview(telefono)
        
        //lyendda de whatsapp
        
        self.etiquetaWhatsapp.text = "Utilizar este número telefonico para la comunicación via whatsapp."
        
        self.telefono.textAlignment = .center
        self.email.textAlignment = .center
        
        let buttonConfirmar = UIButton(type: .custom)
        buttonConfirmar.isSelected = true
        buttonConfirmar.setImage(UIImage(named:"check_on"), for: .selected)
        buttonConfirmar.setImage(UIImage(named:"check_off"), for: .normal)
        
        
    }
    //Validar textoField Telefono
    func validarTelefono(textTelefono:UITextField!){
        let celular = textTelefono.text
        
        if(celular == ""){
            let managerAlerta =  UIAlertController(title:"Agregar un teléfono", message: "Para poder seguir con el registro es necesario proporcinar un número telefonico", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            managerAlerta.addAction(ok)
            self.present(managerAlerta, animated: true, completion: nil)
            
        }else if((celular?.characters.count)! > 10){
            
            let managerAlerta =  UIAlertController(title:"Teléfono no valido", message: "El número de telefonico no es valido", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            managerAlerta.addAction(ok)
            self.present(managerAlerta, animated: true, completion: nil)
            
        }else if((celular?.characters.count)! < 10){
            
            let managerAlerta =  UIAlertController(title:"Teléfono no valido", message: "El número de telefonico no es valido", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            managerAlerta.addAction(ok)
            self.present(managerAlerta, animated: true, completion: nil)
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
