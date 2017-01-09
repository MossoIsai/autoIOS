//
//  DetalleAuto2.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 06/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import UIKit
class DetalleAuto2: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        
        initViews()
    }
    
    
    func initViews(){
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaDetalleAuto =  tableView.dequeueReusableCell(withIdentifier: "fila") as! FilaDetalleAuto
        
        fila.imgEmpresa.image = UIImage(named: "bmw_log")!
        fila.labelNombreAgencia.text = "BWM Polanco, Ciudad de México"
        
        fila.btnMoreOption.tag = indexPath.row
        print("IDENTIDICADOR -->\(indexPath.row)")
        
        fila.btnMoreOption.addTarget(self, action: #selector(DetalleAuto2.messageTest), for: .touchUpOutside)
        
        //la fila no se puede seleccionar
        fila.selectionStyle = .none
        return fila
        
        
    }
    func messageTest(){
        
        let alerta:Alertas = Alertas()
        
        alerta.showAlert(controller: self, titulo: "Message of example", mensaje: "This message show for test")
    }
    
    
    
    
    
    
    
}
