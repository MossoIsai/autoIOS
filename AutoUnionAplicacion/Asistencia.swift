//
//  Asistencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 05/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
import Social
import MessageUI


class Asistencia: UIViewController,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate {
    
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
            (alert: UIAlertAction!) -> Void in
            /** :::::::::::: COMPARTIR EN FACEBOOK :::::::::::::. **/
            self.callNumber(phoneNumber: "5574260143")
        
        })
        action1.setValue(UIImage(named: "phone"), forKey: "image")
        
        let action2 = UIAlertAction(title: "Enviar Correo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.enviaMail()
        
        })
        action2.setValue(UIImage(named: "message"), forKey: "image")
        
        let action3 = UIAlertAction(title: "Contactar por Whatsapp", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            var url  = NSURL(string: "whatsapp://send?text=Hello%20Friends%2C%20Sharing%20some%20data%20here...%20!")
            
            //Text which will be shared on WhatsApp is: "Hello Friends, Sharing some data here... !"
        
            if UIApplication.shared.canOpenURL(url! as URL) {
                UIApplication.shared.openURL(url! as URL)
            }

        
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
    /** ------------------------------
     Metodo de llamada
     ------------------------------ **/
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.openURL(phoneCallURL as URL);
            }
        }
    }
    /**
     ---------------------------------------
     Enviar mensaje por correo electronico
     Metodo para el envio de mensajes
     ------------------------------  */
    func enviaMail(){
        if MFMailComposeViewController.canSendMail() { //comprobación de la interfaz del mensaje
            
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["isaimoso@icloud.com"])
            mail.setBccRecipients(["isaimoso@icloud.com"])
            mail.setCcRecipients(["isaimoso@icloud.com"])
            mail.setSubject("Consulta App Auto Unión")
            
            mail.setMessageBody("<table style='font-family: Montserrat, Arial, Helvetica, sans-serif;' border='0' width='562' cellspacing='0' cellpadding='0'><tbody><tr><td width='125'><img src='https://s32.postimg.org/cn2t04zol/pic.png' width='125' height='125' /></td><td style='padding-left: 20px;' width='320'><table border='0' width='100%' cellspacing='0' cellpadding='0'><tbody><tr><td style='font-size: 16px; color: #474747; font-family: Verdana, Geneva, sans-serif;'>ANDRES ANGULO <span style='font-size: 14px; color:#a9202e;'>Webmaster</span></td></tr><tr><td style='font-size: 11px; color: #474747; padding-top: 6px; line-height: 18px; font-family: Verdana, Geneva, sans-serif;'>Av. R&iacute;o Mayo #1334, Col. Vista Hermosa,Cuernavaca Morelos, C.P. 62290</td></tr><tr><td style='font-size: 11px; color: #999999; line-height: 20px;' valign='bottom'><table style='font-size: 11px; color: #474747; line-height: 20px; padding-top: 5px; font-family: Verdana, Geneva, sans-serif;' border='0' width='100%' cellspacing='0' cellpadding='0'><tbody><tr><td width='6%'><img src='https://s32.postimg.org/6g6zn2bvp/icon_phone.png' alt=''width='12' height='12' /></td><td width='72%'>+52 (777) 3168874</td><td width='22%'></td><td width='0%'></td></tr></tbody></table></td></tr><tr><td><table style='font-size: 11px; color: #999999; line-height: 20px; padding-top: 0px;' border='0' width='100%' cellspacing='0' cellpadding='0'><tbody><tr><td width='5%'><a style='color: #999; text-decoration: none;' href='#'><img style='vertical-align: central;' src='https://s31.postimg.org/n2u0oun7v/icon_email.png' alt='' width='12' height='12' /></a></td><td width='75%'><a style='color: #474747; text-decoration: none; font-family: Verdana, Geneva, sans-serif;'href='mailto:Andres.angulo@audicuernavaca.com'>Andres.angulo@audicuernavaca.com</a></td><td width='0%'></td><td width='20%'></td></tr><tr><td><span style='font-size: 11px; color: #999999; line-height: 18px;'><img style='vertical-align: central;' src='https://s31.postimg.org/3ore74k6z/icon_website.png' alt='' width='12' height='12' /></span></td><td><a style='color: #474747; text-decoration: none; font-family: Verdana, Geneva, sans-serif;' href='http://audicuernavaca.com'>www.audicuernavaca.com</a></td><td></td><td></td></tr></tbody></table></td></tr></tbody></table></td><td width='117' style='border-left:solid 1px #999999; padding-left:15px;'><span style='padding-top:12px;'><a href='https://www.facebook.com/audicentercuernavaca'><img style='padding-right:5px;' src='https://s31.postimg.org/7mydefie3/icon_fb.png' width='15' height='15' alt='' /></a> <br /> <a href='https://twitter.com/AudideMexico'><img style='padding-top:5px;' src='https://s32.postimg.org/50eb6xjc5/icon_tw.png' width='15' height='15' alt='' /></a> <br /><a href='https://www.youtube.com/user/AudideMexico'><img style='padding-top:5px;' src='https://s32.postimg.org/lhchvra91/icon_gl.png' width='15' height='15' alt='' /></a></span></td></tr></tbody></table><img class='alignnone size-full wp-image-298' src='https://s32.postimg.org/yn8mqbj5h/Audi.png' alt='Audi' width='562' height='147' /><div align='left'><a href='http://www.audicentercuernavaca.com.mx/AC_Aviso.asp?idC=1650&amp;idS=21'><img src='https://s32.postimg.org/xe5ld6nmd/promos1.png' width='410' height='20' /></a><a href='https://www.facebook.com/audicentercuernavaca/'><img src='https://s32.postimg.org/i4z1bbpb9/promos2.png' width='152' height='20' /></a></div><div align='left'><img src='https://s32.postimg.org/c3fephi51/firma_medi_ambiente.png' width='562' height='40' /></div><div align='left'><img src='https://s31.postimg.org/kxqv8xl17/Aviso_de_privacidad1.png' width='562' height='60' /></div>", isHTML: true)
            
            self.present(mail, animated: true, completion: nil)
        
        } else{
            
            let mensaje = UIAlertController(title: "Inicia sesión", message:
                "Debes de iniciar sesión en la aplicacion de Mail para comunicarte con las agencias", preferredStyle: .alert)
            let optionOK =  UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            mensaje.addAction(optionOK)
            self.present(mensaje, animated: true, completion: nil)
        
        }
    }
    /** ---------------------
        metodo para desaperecer la interfaz de correo despúes de
        cancelar la operación o enviar correo
        --------------------- **/
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }
    /** -------------------------------------
        Método para cargas las vista de la interfaz de usuario
        -------------------------------------  **/
    func initViews() {
        
    }
}
