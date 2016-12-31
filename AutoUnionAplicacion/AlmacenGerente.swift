//
//  AlmancenGerente.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 29/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit

class AlmacenGerente: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    private var titulo:[String] = ["Audi R8 Multitronic 2017","Hummer  H2 2010","Honda XL20 2016","Audi R8 Stronic 2010","VolksWagen Jetta 2016","Mazda XC 207","Mercedes Benz C200 2017","Audi A3 Multitronic 2016","Audi Q3 Quattro 2015","Audi Q5  Stronic 2017","Audi Q7 Quattro 2017"]
    private var chasises:[String] = ["","","","","","","","","","","",""]
    private var imagenes:[String] = ["r8","hummer","honda_car","img3","jetta","mazda_car","mercedes","q1_1","q3","q7","q5","ram_car"]
    private var visitas:[String] = ["","","","","","","","","","","",""]
    private var diasSemaforo:[Int] = [23,90,120,138,4,1,46,83,10,365,72]
    private var vendidoStatus:[Int] =  [0,0,1,1,0,0,1,0,1,1,0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargarVistas()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaGerenteAutos =  tableView.dequeueReusableCell(withIdentifier: "fila") as!
        FilaGerenteAutos
        
        fila.tituloAuto.text = titulo[indexPath.row]
        fila.chasisAuto.text = "WTKDGTH73GAKF026S"
        fila.precioAuto.text = "C: $ 190,945 | V: $ 200,000"
        fila.visitas.text = String(diasSemaforo[indexPath.row])
        fila.imageCar.image =  UIImage(named: imagenes[indexPath.row])
        fila.imageCar.clipsToBounds = true
        fila.imageCar.contentMode = .scaleAspectFit
        fila.imageCar.layer.cornerRadius = 10
        fila.imageDownPrice.image =  UIImage(named: "down_price")
        fila.labelDias.text =  String(diasSemaforo[indexPath.row])
        
        if vendidoStatus[indexPath.row] == 0{
            fila.labelVendido.isHidden = true
        }
        
        
        if diasSemaforo[indexPath.row] <= 44 {
            fila.semaforoDias.image = UIImage(named: "circle_green")
        }else if diasSemaforo[indexPath.row] >= 45 && diasSemaforo[indexPath.row] <= 90 {
            fila.semaforoDias.image = UIImage(named: "circle_yellow")
        }else{
            fila.semaforoDias.image = UIImage(named: "circle_red")
        }
        fila.imageDownPrice.isHidden = true
        print(vendidoStatus[indexPath.row])

       
        
        return fila
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
    }
    /**Metodo que carga la vista**/
    func cargarVistas() {
        let tabArray = self.tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray?.object(at: 0) as! UITabBarItem
        tabItem.badgeValue = "\(titulo.count)"
        /*if #available(iOS 10.0, *) {
            tabItem.badgeColor = UIColor(red: 0/255, green: 194/255, blue: 59/255, alpha: 1)
        } else {
            // Fallback on earlier versions
        }*/
    }
    
}
