//
//  DetalleAuto2.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 06/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class DetalleAuto2: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,MKMapViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initViews()
    }
    func initViews(){
        self.title = "Detalle del Automóvil"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fila: FilaDetalleAuto =  tableView.dequeueReusableCell(withIdentifier: "fila") as! FilaDetalleAuto
        
        fila.imgEmpresa.image = UIImage(named: "audi_logo")!
        fila.labelNombreAgencia.text = "Audi Cuernavaca"
        /**ScrollView de viewpager(Lista de autos)*/
        fila.scrollView.showsHorizontalScrollIndicator = false
        fila.scrollView.frame = CGRect(x:0, y:50, width:self.view.frame.width, height:self.view.frame.height)

        let scrollViewWidth: CGFloat = fila.scrollView.frame.width
        let scrollViewHeight: CGFloat = 300
        //Definimos el tamaño de las imagenes y que imagenes tendra dentro
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "q1_1")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "q1_2")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth * 2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "q1_3")
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth * 3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "q1_4")
        let imgFive = UIImageView(frame: CGRect(x:scrollViewWidth * 4, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFive.image = UIImage(named: "q1_5")
        let imgSix = UIImageView(frame: CGRect(x:scrollViewWidth * 5, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgSix.image = UIImage(named: "q1_6")
        let imgSeven = UIImageView(frame: CGRect(x:scrollViewWidth * 6, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgSeven.image = UIImage(named: "q1_7")
        //Agregamos las imagenes como subvistas al scrolllView
        fila.scrollView.addSubview(imgOne)
        fila.scrollView.addSubview(imgTwo)
        fila.scrollView.addSubview(imgThree)
        fila.scrollView.addSubview(imgFour)
        fila.scrollView.addSubview(imgFive)
        fila.scrollView.addSubview(imgSix)
        fila.scrollView.addSubview(imgSeven)
        /*Definimos el ancho del scrollView dependiedo del número
         de fotografias del automovil en cuestion */
        fila.scrollView.contentSize = CGSize(width:fila.scrollView.frame.width * 7, height: 320 )
        fila.scrollView.delegate = self
        
        fila.pageView.currentPage = 0
        
        print("IDENTIDICADOR -->\(indexPath.row)")
        fila.btnMoreOption.addTarget(self, action: #selector(DetalleAuto2.compartiRedesSociales), for: .touchDown)
        fila.btnMoreOption.tag = indexPath.row
        //button de contactame
        fila.btnContactarme.addTarget(self, action: #selector(DetalleAuto2.btnActionContactar), for: .touchDown)
        fila.btnContactarme.tag =  indexPath.row
        //la fila no se puede seleccionar
        fila.selectionStyle = .none
        /***Mapas**/
        fila.mapa.delegate = self
        fila.mapa.addGestureRecognizer(gestoMapa)
        fila.mapa.isUserInteractionEnabled = true
    
        fila.btnContactarme.layer.cornerRadius = 5
        fila.descripcion.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmodtempor incididunt ut labore et dolore magnaaliqua.Utenim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.Duisaute irure dolor in reprehenderit in voluptate velitessecillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, sunt inculpa qui officia deserunt mollit anim idestlaborum."
        fila.descripcion.lineBreakMode = NSLineBreakMode.byWordWrapping
        fila.descripcion.numberOfLines = 20
        fila.imgEmpresa.clipsToBounds = true;
        fila.imgEmpresa.layer.cornerRadius = 18
        fila.imgEmpresa.layer.borderColor = UIColor.black.cgColor
        fila.imgEmpresa.layer.borderWidth = 0.3
        fila.imgEmpresa.layer.shadowOffset = CGSize.zero
        fila.imgEmpresa.contentMode = .scaleAspectFit

        
       marcarPunto(mapa: fila.mapa, titulo: "Audi Cuernavaca", subtitulo: "Av. Rio Mayo No.1334 Col Vista Hermosa", latitud: 18.9343080, longitud: -99.2070589)
        //Sin Separador
        tableView.separatorStyle = .none
        
        return fila
        
    }
    /**Contactar el cliente por teléfono y whatsapp etc UIAlertComtroller**/
    func btnActionContactar(){
       let alertManager = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionMarcar = UIAlertAction(title: "Llamada", style: .default, handler: {
            (alert:UIAlertAction)-> Void in
           /*** -------------------
                  LLamada
                ------------------**/
            let alerta =  Alertas()
            alerta.showAlert(controller: self, titulo: "Confirmación", mensaje: "En breve nos pondremos en contacto a traves de una llamada para atenderlo.")

            
        })
        actionMarcar.setValue(UIImage(named: "phone"), forKey: "image")
    
        let actionWhatsapp =  UIAlertAction(title: "Whatsapp", style: .default, handler: {
            (alet:UIAlertAction)-> Void in
            /*** -------------------
             Whatsapp
             ------------------**/
    
            let alerta =  Alertas()
            alerta.showAlert(controller: self, titulo: "Confirmación", mensaje: "En breve nos pondremos en contacto a traves de whatsapp para atenderlo.")
        })
        actionWhatsapp.setValue(UIImage(named: "whatsapp"), forKey: "image")
        
        let actionMail =  UIAlertAction(title: "Mail", style: .default, handler: {
            (alet:UIAlertAction)-> Void in
            /*** -------------------
                     Mail
                 ------------------**/
            
            let alerta =  Alertas()
            alerta.showAlert(controller: self, titulo: "Confirmación", mensaje: "En breve nos pondremos en contacto a traves de mail para atenderlo.")
        })
       actionMail.setValue(UIImage(named: "message"), forKey: "image")
        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertManager.addAction(actionMarcar)
        alertManager.addAction(actionWhatsapp)
        alertManager.addAction(actionMail)
        alertManager.addAction(actionCancel)
        //alertManager.view.layer.borderColor = UIColor.black.cgColor
        alertManager.view.tintColor =  UIColor.black
        self.present(alertManager, animated: true, completion: nil)
    }
    /**Compartir por las redesociales UIAlertController*/
    func compartiRedesSociales(){
        //print("Prueba del mensaje ------>")
        
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionFacebook = UIAlertAction(title: "Compartir en Facebook", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
            /*** -------------------
             Facebook
             ------------------**/
        })
        actionFacebook.setValue(UIImage(named: "facebook"), forKey: "image")
        let actionCancel =  UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        let actionTwitter =  UIAlertAction(title: "Compartir en Twitter", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
            /*** -------------------
             Twitter
             ------------------**/
        })
        actionTwitter.setValue(UIImage(named: "twitter"), forKey: "image")
        let actionURL =  UIAlertAction(title: "Copiar URL", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
            /*** -------------------
             Copiar URL
             ------------------**/
            
        })
        actionURL.setValue(UIImage(named: "link"), forKey: "image")
        alertSheet.addAction(actionFacebook)
        alertSheet.addAction(actionCancel)
        alertSheet.addAction(actionTwitter)
        alertSheet.addAction(actionURL)
        //Poner oscuro la letras del actionSheet
        alertSheet.view.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        self.present(alertSheet, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = scrollView.frame.width
        let currentPage: CGFloat =  floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1
        //self.pageControll.currentPage = Int(currentPage)
        
        if Int(currentPage) == 0{
            
        }
    }
    //MARK: UIScrollView Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        //self.pageControll.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
            //textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
            //textView.text = "I write mobile tutorials mainly targeting iOS"
        }else if Int(currentPage) == 2{
            //textView.text = "And sometimes I write games tutorials about Unity"
        }else{
            //textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                //  self.startButton.alpha = 1.0
            })
        }
    }
    /**Metodo que pinta el punto dentro del mapa */
    func marcarPunto(mapa:MKMapView,titulo:String,subtitulo:String,latitud:Double,longitud:Double) {
        
        let  gradosUbicacionLatitud:CLLocationDegrees = 0.030
        let  gradosUbicacionLongitud:CLLocationDegrees =  0.030
        // MKCoordinateSpan(Una estructura que define el área abarcada por una región del mapa.)
        let  regionMapa = MKCoordinateSpan(latitudeDelta: gradosUbicacionLatitud, longitudeDelta: gradosUbicacionLongitud)
    
        let coordenadas: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(latitud,longitud)
        // MKCoordinateRegion Una estructura que define qué parte del mapa que se vea.
        let regionMapaVisible = MKCoordinateRegion(center: coordenadas, span: regionMapa)
    
        let pointAnotattion = MKPointAnnotation()
        pointAnotattion.coordinate = coordenadas
        pointAnotattion.title = titulo
        pointAnotattion.subtitle = subtitulo
        mapa.addAnnotation(pointAnotattion)
        mapa.selectAnnotation(pointAnotattion, animated: true)
        mapa.setRegion(regionMapaVisible, animated: false)
    }
    /** ---------------------
     metodo para desaperecer la interfaz de correo despúes de
     cancelar la operación o enviar correo
     --------------------- **/
   /* func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }*/
    /***_______________________________
        *METODO PARA ENVIAR MESSAGES*
         ------------------------------*/
    /*func enviarMail()  {
        if MFMailComposeViewController.canSendMail() { //Comprueba si se peuden enviar mensajes
            
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["isaimoso@icloud.com"])
            mail.setBccRecipients(["isaimoso@icloud.com"])
            mail.setCcRecipients(["isaimoso@icloud.com"])
            mail.setSubject("Consulta App Auto Unión")
            
            mail.setMessageBody("Mensaje de prueba en html", isHTML: true)
            self.present(mail, animated: true, completion: nil)
            
        }else{
           print("No se peuden enviar mensajes")
            let mensajeAlerta  = Alertas()
            mensajeAlerta.showAlert(controller: self, titulo: "Inicia sesión", mensaje: "Debes de iniciar sesión en la aplicacion de Mail para comunicarte con las agencia")
        }
    }*/
    
    let gestoMapa = UILongPressGestureRecognizer(target: self, action: #selector(DetalleAuto2.enviarMapaCompleto(_sender:)))
    
    func enviarMapaCompleto(_sender: UITapGestureRecognizer){
        print("Enviando a mapa completo TEST")
    }
    


    
    
    
    
    
    
    
    
}
