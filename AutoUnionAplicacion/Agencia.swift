//
//  Agencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 02/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
class Agencia:  UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating{
    private var arrayAgenciasName:[String] = ["Audi Cuernavaca","Nissan Puebla","Mitsubishi Queretaro","Ford Mazatlan","Honda Nuevo Leon","Mazda Cuernavaca","Ram Culiacan","Toyota Tamaulipas","Volkswagen Hidalgo","Chevrolet Puente de Ixtla","Chrysler Cuernavaca"]
    
    
      private var arrayAgenciasAddress:[String] = ["Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290","Av. Rio Mayo 1334, Col. Vista Hermosa Cuernavaca, Morelos, C.P. 62290"]
    
    
    private var arrayNamesImages:[String] = ["audi_logo","nissan","mitsubishi","ford","honda","mazda","ram","toyota","volkswagen","chevrolet","chrysler"]
    
    private var searchController = UISearchController()
    
    @IBOutlet weak var tabla: UITableView!
    

    override func viewDidLoad() {
        //ccargando Vistas
        cargarVistas()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 11
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaAgencia =  tableView.dequeueReusableCell(withIdentifier: "filaAgencia") as! FilaAgencia
        
        fila.img_logo.image = UIImage(named: arrayNamesImages[indexPath.row])
        fila.img_logo.contentMode = .scaleAspectFit
        fila.agencia.text = arrayAgenciasName[indexPath.row]
        
        fila.img_logo.clipsToBounds = true;
        fila.img_logo.layer.cornerRadius = 20
        fila.img_logo.layer.borderColor = UIColor.black.cgColor
        fila.img_logo.layer.borderWidth = 0.5
        
        fila.btnSeguir.layer.cornerRadius =  5
        fila.btnSeguir.layer.borderColor =  UIColor.black.cgColor
        fila.btnSeguir.layer.borderWidth =  1
        fila.direccion.text = arrayAgenciasAddress[indexPath.row]
        
        fila.direccion.lineBreakMode = NSLineBreakMode.byWordWrapping
        fila.direccion.numberOfLines = 2
        
        return fila;
    }
    
    func cargarVistas() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        //searchController.searchBar.backgroundColor = UIColor.clear
        searchController.searchBar.barTintColor =  UIColor.clear
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.placeholder = "Buscar"
        //searchController.searchBar.searchBarStyle = .default
        //searchController.searchBar.tintColor = UIColor.orange
        searchController.searchBar.searchBarStyle = .minimal
        tabla.tableHeaderView = searchController.searchBar
        
    }
    func updateSearchResults(for searchController: UISearchController) {
    }
    
}
