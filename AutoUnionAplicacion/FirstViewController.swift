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
    /**::::::::::::: PRUEBA DE DICCIONARIO  :::::::::::::::*/
    var diccionario = [String : String]()
    var arreglo = [Int]()
    
    @IBOutlet weak var contenidoVistas: UIView!
    
    

    /**Simulación*/
    private var imagenesArray:[String] = ["mercedes","mazda_car","jetta","honda_car","bwm_deportivo","a1","q5","q7","hummer","q3","r8"]
    
    private var imagenesEmpresa:[String] = ["audi_logo","audi_logo","audi_logo","audi_logo","toyota","audi_logo","audi_logo",
                                            "audi_logo","log_bmw","audi_logo","audi_logo"]
    
    
    
    private var nombreAuto = ["Mercedes C200 2017","Mazda CE 2016","Volkswagen Jetta 2017","Honda Civic 2017","BMW Premier One 2017","Audi A1 Stronic 2015","Audi Q7 Multitronic 2017","Audi Q5 Multitronic 2015","Hummer H2 2010","Audi Q3 Stronic 2016","Audi R8 Multitronic 2017"]
    
    private let linkAuto: String =  "http://192.168.69.36:8080/autoUnion/pruebaGSON.jsp"
    var automovil:Automovil  = Automovil()
  /**Pone en blanclo los componenres de arriba*/
    override var preferredStatusBarStyle: UIStatusBarStyle{
       return .lightContent
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        diccionario = ["IGM":"ISA GARCIA MOSO","AGM":"ALEJANDRO GARCIA MOSO","RGM":"RAUL GARCIA MOSO"]
        print(diccionario["IGM"]!)
        cargarVistas()
        
        self.tabBarController?.tabBar.barTintColor =  UIColor.white



    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaModelo = tableView.dequeueReusableCell(withIdentifier: "fila") as! FilaModelo
        
        fila.nombreAgencia.text = "Audi Cuernavaca"
        fila.precio.text = "$ 1, 000, 000 M.N."
        fila.datosAuto.text = nombreAuto[indexPath.row]
        
        let automovil: UIImage =  UIImage(named: imagenesArray[indexPath.row])!
        
        let corazon: UIImage =   UIImage(named: "corazonItem2")!
        let empresa: UIImage =  UIImage(named: "audi_logo")!
        fila.imgAuto.image = automovil
        fila.imgAuto.clipsToBounds = true
        fila.imgAuto.contentMode = .scaleAspectFit
        
        fila.logoEmpresa.image =  empresa
        fila.logoEmpresa.contentMode = .scaleAspectFit
        
        fila.imgCorazon.image = corazon
        // Iconos redondeado de la empresa
        fila.logoEmpresa.clipsToBounds = true;
        fila.logoEmpresa.layer.cornerRadius = 18
        fila.logoEmpresa.layer.borderColor = UIColor.black.cgColor
        fila.logoEmpresa.layer.borderWidth = 0.3
        fila.logoEmpresa.layer.shadowOffset = CGSize.zero
        //desactivar el select de uitableView
        fila.selectionStyle = UITableViewCellSelectionStyle.none
        //Estilo boton
        //estilo cardView
        //fila.cardView.backgroundColor =  UIColor.white
        print("IDENTIDICADOR -->\(indexPath.row)")
        
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
            
            
            fbContent.contentURL = NSURL(string: "http://www.audiusedcarcenter.com") as URL!
            fbContent.contentTitle =  "Publicacion desde el iphone de pruebas"
            fbContent.contentDescription = "Descripción del mensaje"
            fbContent.quote = "Audi R8 Multitronic 2017"
            //fbContent.imageURL =  URL(string: "https://raw.github.com/fbsamples/ios-3.x-howtos/master/Images/iossdk_logo.png")!
            let dialog = FBSDKShareDialog()
            dialog.fromViewController = self
            dialog.shareContent = fbContent
            dialog.mode = .shareSheet
            dialog.show()
            
            //FBSDKShareDialog.show(from: self, with: fbContent, delegate: nil)
            
        })
        /**Agregando imagen al AlertView*/
        compartirFacebook.setValue(UIImage(named: "facebook"), forKey: "image")
        //compartirFacebook.setValue(UIColor.green, forKey: "titleTextColor")
        
        //:::::::::::::::::::::: Facebook Message ::::::::::::::::::::::::::
        let compartirFaceMessage = UIAlertAction(title: "Messenger", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            
           let messageFaceMessage = FBSDKMessageDialog()
            let fbContent : FBSDKShareLinkContent = FBSDKShareLinkContent()
            fbContent.contentURL = NSURL(string: "http://www.audiusedcarcenter.com") as URL!
            fbContent.contentTitle =  "Publicacion desde el iphone de pruebas"
            fbContent.contentDescription = "Descripción del mensaje"
            fbContent.quote = "Audi R8 Multitronic 2017"
            messageFaceMessage.shareContent = fbContent
            messageFaceMessage.show()
    
        })
        //:::::::::::::::::::::: Twitter ::::::::::::::::::::::::::
        let compartirTwitter  =  UIAlertAction(title: "Compartir en Twitter", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let twitterShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
           // twitterShare.add(UIImage(named: "r8"))
           // twitterShare.add(NSURL(string: "www.autounion.com") as! URL)
            twitterShare.setInitialText("#Gracias2016 por los momentos y quiero los boletos @juanenla99 ...\(self.randomNumber())")
            self.present(twitterShare, animated: true, completion: nil)
            
        })
        
        compartirTwitter.setValue(UIImage(named: "twitter"), forKey: "image")
        
        let copiarURL = UIAlertAction(title: "Copiar URL", style: UIAlertActionStyle.default, handler: nil)
        copiarURL.setValue(UIImage(named: "link"), forKey: "image")
        
        let cancelar =  UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:nil)
        
        controladorAlerta.addAction(compartirFacebook)
        //controladorAlerta.addAction(compartirFaceMessage)
        controladorAlerta.addAction(compartirTwitter)
        controladorAlerta.addAction(copiarURL)
        controladorAlerta.addAction(cancelar)
        controladorAlerta.view.tintColor = UIColor(red: 40/255, green: 43/255, blue: 50/255, alpha: 1)

        
        self.present(controladorAlerta, animated: true, completion: nil)
        
    }
    /**Ocultar la barra de estado del viewController*/
    /*override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }*/
   /**Fin*/
    
    /** Numero random
     
     let randomNum:UInt32 = arc4random_uniform(100) // range is 0 to 99
     
     // convert the UInt32 to some other  types
     
     let randomTime:TimeInterval = TimeInterval(randomNum)
     
     let someInt:Int = Int(randomNum)
     
     let someString:String = String(randomNum) //string works too
     */
    func randomNumber()-> String {
        let randomNum:UInt32 = arc4random_uniform(1000) // range is 0 to 99
        let randomTime:TimeInterval = TimeInterval(randomNum)
        let someInt:Int = Int(randomNum)
        let someString:String = String(randomNum) //string works too
         return someString
    
    }
    func cargarVistas(){
        //cambiando de color la barra de estado
        //UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarStyle = .default
        /** ::::::::::: LECTURA Y PARSEO DEL JSON ::::::::**/
        let parameters: Parameters = ["foo": "bar"]
        //reauest("urlConecction",metodo(.post/.get),paramtetros,codificaciónJSON)
        Alamofire.request(linkAuto, method: .get, parameters: parameters, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //   print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                
                // El cierre de la evaluación personalizada ahora incluye datos (le permite analizar datos para extraer mensajes de error si es necesario)
                return .success
            }
            .responseJSON {
                response in
                //debugPrint(response)
                if let result = response.result.value {
                    let JSON = result as! NSArray
                    //let JSON2 = result as! NSDictionary
                    var tamano =  JSON.count
                    //print(JSON2)
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
   
    
    
    
    
    
    
   
}

