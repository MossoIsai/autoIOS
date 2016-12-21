//
//  Agencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 02/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
class Agencia:  UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        //
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaAgencia =  tableView.dequeueReusableCell(withIdentifier: "filaAgencia") as! FilaAgencia
        
        
        fila.img_logo.image = UIImage(named: "audi_logo")
        fila.agencia.text = "Audi Cuernavaca"
        
        fila.img_logo.clipsToBounds = true;
        fila.img_logo.layer.cornerRadius = 20
        fila.img_logo.layer.borderColor = UIColor.black.cgColor
        fila.img_logo.layer.borderWidth = 0.5
        
        fila.btnSeguir.layer.cornerRadius =  5
        fila.btnSeguir.layer.borderColor =  UIColor.black.cgColor
        fila.btnSeguir.layer.borderWidth =  1
        
        return fila;
    }
    
    
}
