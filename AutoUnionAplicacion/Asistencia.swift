//
//  Asistencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 05/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
import Social



class Asistencia: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /** :::::::::::::: CARGANDO VISTA :::::::::::::: **/
        initViews()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "celda")
        cell.textLabel?.text = "Audi Cuernavaca"
        cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        cell.detailTextLabel?.text = "5574260143"
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemSeleccionado(indice: indexPath.row)
        
    }
    
    func itemSeleccionado(indice: Int) {
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "LLamar", style: .default, handler: {
            [unowned self] (alert: UIAlertAction!) -> Void in
            /** :::::::::::: COMPARTIR EN FACEBOOK :::::::::::::. **/
            
            //if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
                var fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
                self.present(fbShare, animated: true, completion: nil)
                
            /*} else {
                var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }*/
            
            
            print("Action 1")
        })
        action1.setValue(UIImage(named: "phone"), forKey: "image")
        
        let action2 = UIAlertAction(title: "Enviar Correo", style: .default, handler: {
            [unowned self] (alert: UIAlertAction!) -> Void in
            
            print("Action 2")
        })
        action2.setValue(UIImage(named: "message"), forKey: "image")
        
        let action3 = UIAlertAction(title: "Contactar por Whatsapp", style: .default, handler: {
            [unowned self] (alert: UIAlertAction!) -> Void in
            print("Action 3")
        })
        action3.setValue(UIImage(named: "whatsapp"), forKey: "image")
        
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        optionMenu.addAction(action1)
        optionMenu.addAction(action2)
        optionMenu.addAction(action3)
        optionMenu.addAction(cancelAction)
        
        present(optionMenu, animated: true, completion: nil)
        optionMenu.view.tintColor = UIColor.black
        
    }
    
    
    func initViews() {
    }
    
}
