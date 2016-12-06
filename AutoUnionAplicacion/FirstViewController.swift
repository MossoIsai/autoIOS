//
//  FirstViewController.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
import Social


class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaModelo = tableView.dequeueReusableCell(withIdentifier: "fila") as! FilaModelo
        
        fila.nombreAgencia.text = "Audi Cuernavaca"
        fila.precio.text = "$ 1, 000, 000 M.N"
        fila.datosAuto.text = "Audi R8 Multitronic 2016"
        
        let automovil: UIImage =  UIImage(named: "q1_2")!
        let corazon: UIImage =   UIImage(named: "corazon")!
        let empresa: UIImage =  UIImage(named: "audi_logo")!
        //let mas: UIImage =  UIImage(named: "")!
        fila.imgAuto.image = automovil
        fila.logoEmpresa.image =  empresa
        fila.imgCorazon.image = corazon
        // Iconos redondeado de la empresa
        fila.logoEmpresa.clipsToBounds = true;
        fila.logoEmpresa.layer.cornerRadius = 15
        fila.logoEmpresa.layer.borderColor = UIColor.black.cgColor
        fila.logoEmpresa.layer.borderWidth = 0.3
        fila.logoEmpresa.layer.shadowOffset = CGSize.zero
        //desactivar el select de uitableView
        fila.selectionStyle = UITableViewCellSelectionStyle.none
        //Estilo boton
        fila.btnSeguir.layer.cornerRadius = 4
        return fila;
    }
 // ::::::::::::::: Controlador de alerta ::::::::::::::::
    @IBAction func btnOpciones(_ sender: Any){
        /* Permite hacer cambios a este boton de diseño
         (sender as! UIButton).backgroundColor =  UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)*/
        
        
       /* var url: String =  "http:www.google.com"
        var request = URLRequest(url: url)
        let task = URLSession.shared().dataTask(with: request as URLRequest) {}
        task.resume()*/
        
       let controladorAlerta =  UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        //:::::: facebook ::::::::::::::::
        let compartirFacebook =  UIAlertAction(title: "Compartir en Facebook", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            // SLComposeViewController....se presenta una visión al usuario a componer un mensaje para los servicios de redes sociales compatibles
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                
                  let fbShare: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                  fbShare.add(UIImage(named: "img3"))
                  fbShare.setInitialText("Ejemplo de publiación desde la app")
                    
                  self.present(fbShare, animated: true, completion: nil)

            }else{
                let managerControlador = UIAlertController(title: "Cuenta", message: "Inicia sesión en una cuenta de Facebook para compartir", preferredStyle: UIAlertControllerStyle.alert)
                let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            
                managerControlador.addAction(actionOK)
                self.present(managerControlador, animated: true, completion: nil)
                
            }
        })
        compartirFacebook.setValue(UIImage(named: "facebook"), forKey: "image")

        //:::::::::::: Twitter ::::::::::::::::
        let compartirTwitter  =  UIAlertAction(title: "Compartir en Twitter", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
                
                let twiShare: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                self.present(twiShare, animated: true, completion: nil)
            }else{
    
                let managerControlador = UIAlertController(title: "Cuenta", message: "Inicia sesión en una cuenta de Facebook para compartir", preferredStyle: UIAlertControllerStyle.alert)
                let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                managerControlador.addAction(actionOK)
                self.present(managerControlador, animated: true, completion: nil)
             
            }
            
        })
        compartirTwitter.setValue(UIImage(named: "twitter"), forKey: "image")

        
        let copiarURL = UIAlertAction(title: "Copiar URL", style: UIAlertActionStyle.default, handler: nil)
        copiarURL.setValue(UIImage(named: "link"), forKey: "image")

        
        
        let cancelar =  UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:nil)
    
        controladorAlerta.addAction(compartirFacebook)
        controladorAlerta.addAction(compartirTwitter)
        controladorAlerta.addAction(copiarURL)
        controladorAlerta.addAction(cancelar)
        controladorAlerta.view.tintColor = UIColor.black
        
        self.present(controladorAlerta, animated: true, completion: nil)

    }
}

