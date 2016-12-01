//
//  Agencias.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 01/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
class Agencias: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        //
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaAgencia = tableView.dequeueReusableCell(withIdentifier: "filaId") as! FilaAgencia
        
        fila.img_logo.image = UIImage(named: "")
        fila.Nombreagencia.text = "Audi Cuernavaca"
        
        
        return fila
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    
    
    
    
    

    
}
