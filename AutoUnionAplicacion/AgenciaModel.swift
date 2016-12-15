//
//  AgenciaModel.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 13/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation

class AgenciaModel: NSObject{
    
    
    private var agenciaId:String = ""
    private var agenciaNombre:String = ""
    private var agenciaDireccion:String = ""
    private var agenciaCorreo:String = ""
    private var agenciaPassword:String = ""
    private var agenciaTelefono:String = ""
    private var agenciaTelefono2:String = ""
    private var agenciaWhatsapp:String = ""

    init(agenciaId:String,agenciaNombre:String, agenciaDireccion:String, agenciaCorreo:String, agenciaPassword:String,agenciaTelefono:String,agenciaTelefono2:String,agenciaWhatsapp:String) {
        
        self.agenciaId = agenciaId
        self.agenciaNombre = agenciaNombre
        self.agenciaDireccion = agenciaDireccion
        self.agenciaCorreo = agenciaCorreo
        self.agenciaPassword = agenciaPassword
        self.agenciaTelefono = agenciaTelefono
        self.agenciaTelefono2 = agenciaTelefono2
        self.agenciaWhatsapp = agenciaWhatsapp
        
    }
    var agenciaIdGetYSet:String{
        get{
            return self.agenciaId
        }
        set(agenciaId){
            self.agenciaId = agenciaId
        }
    }
    var agenciaNombreGetYSet:String{
        get{
            return self.agenciaNombre
        }
        set(agenciaNombre){
            self.agenciaNombre = agenciaNombre
        }
    }
    var aagenciaDireccionGetYSet:String{
        get{
            return self.agenciaDireccion
        }
        set(agenciaDireccion){
            self.agenciaDireccion = agenciaDireccion
        }
    }
    var agenciaCorreoGetYSet:String{
        get{
            return self.agenciaCorreo
        }
        set(agenciaCorreo){
            self.agenciaCorreo = agenciaCorreo
        }
    }
    var agenciaPasswordGetYSet:String{
        get{
            return self.agenciaPassword
        }
        set(agenciaPassword){
            self.agenciaPassword = agenciaPassword
        }
    }
    var agenciaTelefonoGetYSet:String{
        get{
            return self.agenciaTelefono
        }
        set(agenciaTelefono){
            self.agenciaTelefono = agenciaTelefono
        }
    }
    var agenciaTelefono2GetYSet:String{
        get{
            return self.agenciaTelefono2
        }
        set(agenciaTelefono2){
            self.agenciaTelefono2 = agenciaTelefono2
        }
    }
    var agenciaWhatsappGetYSet:String{
        get{
            return self.agenciaWhatsapp
        }
        set(agenciaWhatsapp){
            self.agenciaWhatsapp = agenciaWhatsapp
        }
    }
   
}
