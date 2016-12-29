//
//  Alertas.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 19/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit
class Alertas{
    
    func showAlert(controller: UIViewController,titulo:String,mensaje:String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let opcionAceptar = UIAlertAction(title: "Aceptar", style: .default, handler:nil)
        alert.addAction(opcionAceptar)
        controller.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
