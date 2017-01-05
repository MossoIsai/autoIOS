//
//  Favoritos.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 23/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit

class Favoritos:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //@IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       // scroll.contentSize =  CGSize(width: self.view.frame.width, height: 2400)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaModelo  =  tableView.dequeueReusableCell(withIdentifier: "fila") as! FilaModelo
        fila.nombreAgencia.text = "Volkswagen Cuernavaca"
        fila.datosAuto.text =  "Volkswaguen Tiguan 2016"
        fila.precio.text =  "$ 200, 000"
        fila.selectionStyle = UITableViewCellSelectionStyle.none
        fila.imgAuto.clipsToBounds = true
        fila.imgAuto.contentMode = .scaleAspectFit
        
        return fila
        
    }
    
    
}
