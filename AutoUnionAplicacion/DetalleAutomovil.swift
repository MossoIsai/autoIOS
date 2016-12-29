//
//  DetalleAutomovil.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 14/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
import FBSDKShareKit
import Social

class DetalleAutomovil: UIViewController,UIScrollViewDelegate{
    @IBOutlet weak var scroll: UIScrollView!
    //vinculación de los elementos de storyBoard y el codigo
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var labAgencia: UILabel!
    @IBOutlet weak var labEspecificacion: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var btnSeguir: UIButton!
    //Boton Seguir
    @IBAction func btnSeguir(_ sender: Any) {
        
        let buttonSeguir:UIButton = (sender as! UIButton);
        buttonSeguir.backgroundColor = UIColor(red: 50/255, green: 240/255, blue: 125/255, alpha: 1.0)
        
        buttonSeguir.setTitle("SIGUIENDO", for: .normal)
        buttonSeguir.setTitleColor(UIColor.white, for: .normal)
        buttonSeguir.layer.cornerRadius = 4
        buttonSeguir.layer.shadowRadius = 4
        buttonSeguir.layer.borderColor = UIColor.clear.cgColor
    }
    /** -----------------------------
         button contactame
        --------------------------------  **/
    @IBAction func btnContactame(_ sender: Any) {
        
        let alertManager  = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        /**
         --------------------------
         opción llamada
         --------------------------
         **/
        let actionLlamame =  UIAlertAction(title: "Contactarme por llamada", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        actionLlamame.setValue(  UIImage(named: "phone") , forKey: "image")
        /**
         --------------------------
         opción enviarme mensaje
         -------------------------- **/
        let actionEnviameMail = UIAlertAction(title: "Contactarme por Correo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
        })
        actionEnviameMail.setValue(UIImage(named: "message"), forKey: "image")
        
        /**
         --------------------------
         opción enviarme whatsapp
         --------------------------
         **/
        let actionWhatsapp =  UIAlertAction(title: "Contactarme por Whatsapp", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
        })
        actionWhatsapp.setValue(UIImage(named: "whatsapp"), forKey: "image")
        
        let actionCancelar =  UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertManager.addAction(actionLlamame)
        alertManager.addAction(actionEnviameMail)
        alertManager.addAction(actionWhatsapp)
        alertManager.addAction(actionCancelar)
        alertManager.view.tintColor =  UIColor.black

        self.present(alertManager, animated: true, completion: nil)
        
    }
    //Boton Compartir
    @IBAction func btnCompartir(_ sender: Any) {
        
        let controladorAlerta =  UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        let compartirFacebook =  UIAlertAction(title: "Compartir en Facebook", style: UIAlertActionStyle.default, handler: {
            (alert:UIAlertAction!)-> Void in
            /*** ::::::::::::::: FACEBOOK :::::::::::::::::.***/
            let fbContent : FBSDKShareLinkContent = FBSDKShareLinkContent()
            fbContent.contentURL = NSURL(string: "http://www.autounion.com") as URL!
            fbContent.contentTitle =  "Estupido de conocimiento"
            fbContent.contentDescription = "Descripción del mensaje"
            FBSDKShareDialog.show(from: self, with: fbContent, delegate: nil)

        })
        compartirFacebook.setValue(UIImage(named: "facebook"), forKey: "image")
        /**:::::::::::::: TWIITER::::::::::::::::*/
        let compartirTwitter  =  UIAlertAction(title: "Compartir en Twitter", style: UIAlertActionStyle.default, handler: {
            (alert:UIAlertAction!) -> Void in
            let compartirTwitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            compartirTwitter.add(UIImage(named:"q1_2"))
            compartirTwitter.add(NSURL(string: "www.autounion.com") as! URL)
            compartirTwitter.setInitialText("Audi A3 1.4 S-TRONIC 2016, $1,300,000.00 M.N")
            self.present(compartirTwitter, animated: true, completion: nil)
            
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
    override func viewDidLoad() {
        
        cargarVistas()
        
        self.btnSeguir.layer.cornerRadius = 5
        self.btnSeguir.layer.borderColor = UIColor.black.cgColor
        self.btnSeguir.layer.borderWidth = 1
        self.btnSeguir.backgroundColor = .clear
        
        self.imgLogo.layer.cornerRadius = 15
        self.imgLogo.layer.borderWidth = 0.2
        self.imgLogo.layer.borderColor =  UIColor.black.cgColor
        self.imgLogo.clipsToBounds = true
        self.imgLogo.contentMode = .scaleAspectFit
        
        /*describe la ubicación y el tamaño de la vista en el
         sistema de coordenadas de su superview.*/
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        /*El tipo básico para valores
         /escalares de punto flotante en Core Graphics */
        let scrollViewWidth: CGFloat = self.scrollView.frame.width
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
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        self.scrollView.addSubview(imgFive)
        self.scrollView.addSubview(imgSix)
        self.scrollView.addSubview(imgSeven)
        /*Definimos el ancho del scrollView dependiedo del número
         de fotografias del automovil en cuestion */
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 7, height: 320 )
        self.scrollView.delegate = self
        self.pageControll.currentPage = 0
        //View elevation
        
        /*self.scrollView.layer.shadowColor = UIColor.black.cgColor
         self.scrollView.layer.shadowOpacity =  0.5
         self.scrollView.layer.shadowOffset =  CGSize.zero
         vistaInfo.layer.shadowColor = UIColor.black.cgColor
         vistaInfo.layer.shadowOpacity =  0.6
         vistaInfo.layer.shadowOffset =  CGSize.zero
         vistaInfo.layer.shouldRasterize = true*/
        
    } //fin del ViewDidLoad
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = scrollView.frame.width
        let currentPage: CGFloat =  floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1
        self.pageControll.currentPage = Int(currentPage)
        
        if Int(currentPage) == 0{
        
        }
    }
    //MARK: UIScrollView Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControll.currentPage = Int(currentPage);
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
    /** 
      ------------------------
      cargar vistas de Inicio
      ------------------------ */
    func cargarVistas(){
        
        scroll.contentSize = CGSize(width: 200, height: 2300)
        
    }
}
