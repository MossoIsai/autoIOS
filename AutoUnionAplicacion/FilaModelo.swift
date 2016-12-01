//
//  FilaModelo.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//
import UIKit
class FilaModelo: UITableViewCell{
    
    @IBOutlet weak var logoEmpresa: UIImageView!
    @IBOutlet weak var nombreAgencia: UILabel!
    @IBOutlet weak var btnSeguir: UIButton!
    @IBOutlet weak var imgMas: UIImageView!
    @IBOutlet weak var imgAuto: UIImageView!
    @IBOutlet weak var imgCorazon: UIImageView!
    @IBOutlet weak var datosAuto: UILabel!
    @IBOutlet weak var precio: UILabel!
    
    @IBAction func btnSegue(_ sender: Any) {
        print("siguiente modelo")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let miVistaDos = storyBoard.instantiateViewController(withIdentifier: "DetalleAutomovilID") as! DetalleAutomovil
        // self.presentViewController(miVistaDos, animated:true, completion:nil)
    }
    @IBOutlet weak var btnOpciones: UIButton!
    
    
    
}
