//
//  FirstViewController.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let irADetalle:String =  "verDetalle"
    

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

        
       let controladorAlerta =  UIAlertController(title: "", message: "Puede compartir la publicación a traves de las redes sociales de la siguiente lista", preferredStyle: .actionSheet)
        
       let compartirFacebook =  UIAlertAction(title: "Compartir en Facebook", style: UIAlertActionStyle.default, handler: nil)
        
        let compartirTwitter  =  UIAlertAction(title: "Compartir en Twitter", style: UIAlertActionStyle.default, handler: nil)
        
        let copiarURL = UIAlertAction(title: "Copiar URL", style: UIAlertActionStyle.default, handler: nil)
        
        
        let cancelar =  UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:nil)
    
        controladorAlerta.addAction(compartirFacebook)
        controladorAlerta.addAction(compartirTwitter)
        controladorAlerta.addAction(copiarURL)
        controladorAlerta.addAction(cancelar)
        
        self.present(controladorAlerta, animated: true, completion: nil)

    }
}

