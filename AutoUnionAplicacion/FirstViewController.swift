//
//  FirstViewController.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
import Social
import FBSDKShareKit
import Alamofire

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    private let linkAuto: String =  "http://192.168.69.36:8080/autoUnion/pruebaGSON.jsp"
    var automovil:Automovil  = Automovil()
  /**Pone en blanclo los componenres de arriba*/
    override var preferredStatusBarStyle: UIStatusBarStyle{
       return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent

        
        
        automovil.anioGetYSet = 20
        let anio:Int =  automovil.anioGetYSet
        
        /** ::::::::::: LECTURA Y PARSEO DEL JSON ::::::::**/
        let parameters: Parameters = ["foo": "bar"]
        //reauest("urlConecction",metodo(.post/.get),paramtetros,codificaciónJSON)
        Alamofire.request(linkAuto, method: .get, parameters: parameters, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in

                // El cierre de la evaluación personalizada ahora incluye datos (le permite analizar datos para extraer mensajes de error si es necesario)
                return .success
            }
            .responseJSON {
                response in
                debugPrint(response)
                if let result = response.result.value {
                    let JSON = result as! NSArray
                    var tamano =  JSON.count
                    print("Tamaño\( JSON.value(forKey: "locNombre"))")
                    
                }
                
        }
        //print(":::::::::: SEGUNDA PETICIÓN::::::")
        
        /**Alamofire.request(linkAuto).response{ response in
            debugPrint(response)
            print("Mensaje de la seguna petición")
        }**/
        
        
        /**:::::::::: FIN DE LA LECTURA Y PARSEO DEL JSON ::::::::*/
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
        
        let controladorAlerta =  UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //::::::::::::::::::: facebook ::::::::::::::::::::::::::::::
        let compartirFacebook =  UIAlertAction(title: "Compartir en Facebook", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let fbContent : FBSDKShareLinkContent = FBSDKShareLinkContent()
            
            fbContent.contentURL = NSURL(string: "http://www.autounion.com") as URL!
            fbContent.contentTitle =  "Estupido de conocimiento"
            fbContent.contentDescription = "Descripción del mensaje"
            //fbContent.hashtag = FBSDKHashtag(string: "Developer")
            //fbContent.contentDescription = "dedejdedediejidj idejdiejd"
            //fbContent.contentTitle = "Titulo del compartir"
            //fbContent.imageURL =  URL(string: "https://raw.github.com/fbsamples/ios-3.x-howtos/master/Images/iossdk_logo.png")!
            FBSDKShareDialog.show(from: self, with: fbContent, delegate: nil)
            
        })
        compartirFacebook.setValue(UIImage(named: "facebook"), forKey: "image")
        //:::::::::::::::::::::: Twitter ::::::::::::::::::::::::::
        let compartirTwitter  =  UIAlertAction(title: "Compartir en Twitter", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let twitterShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterShare.add(UIImage(named: "q1_2"))
            twitterShare.add(NSURL(string: "www.autounion.com") as! URL)
            twitterShare.setInitialText("Audi A3 1.4 S-TRONIC 2016, $1,300,000.00 M.N")
            self.present(twitterShare, animated: true, completion: nil)
            
        })
        compartirTwitter.setValue(UIImage(named: "twitter"), forKey: "image")
        
        let copiarURL = UIAlertAction(title: "Copiar URL", style: UIAlertActionStyle.default, handler: nil)
        copiarURL.setValue(UIImage(named: "link"), forKey: "image")
        
        let cancelar =  UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:nil)
        
        controladorAlerta.addAction(compartirFacebook)
        controladorAlerta.addAction(compartirTwitter)
        controladorAlerta.addAction(copiarURL)
        controladorAlerta.addAction(cancelar)
        controladorAlerta.view.tintColor = UIColor.black
        
        self.present(controladorAlerta, animated: true, completion: nil)
        
    }
    
}

