//
//  Usuario.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 13/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation

class Usuario: NSObject {
    
    private var usuId:String = ""
    private var usuNombre:String  = ""
    private var usuEmail:String = ""
    private var usuCelular:String  =  ""
    private var usuCelularWhatsapp:String = ""
    private var usuPassword:String = ""
    private var usuTipo:String = ""
    private var usuValidado:Bool = true
    private var usuCodigoVerificacion:String = ""
    private var usuFechaNacimiento:String = ""
    private var ageId:String = ""
    
    init(usuId:String,usuNombre:String,usuEmail:String,usuCelular:String,usuCelularWhatsapp:String,usuPassword:String,usuTipo:String,usuValidado:Bool,usuCodigoVerificacion:String,usuFechaNacimiento:String,ageId:String) {
        
        self.usuId = usuId
        self.usuNombre = usuNombre
        self.usuEmail = usuEmail
        self.usuCelular = usuCelular
        self.usuCelularWhatsapp = usuCelularWhatsapp
        self.usuPassword = usuPassword
        self.usuTipo  = usuTipo
        self.usuValidado = usuValidado
        self.usuCodigoVerificacion = usuCodigoVerificacion
        self.usuFechaNacimiento = usuFechaNacimiento
        self.ageId = ageId
    }
    
    var usuIGetYSet:String{
        get{
            return self.usuId
        }
        set(usuId){
            self.usuId = usuId
        }
    }
    var usuNombreGetYSet:String{
        get{
            return self.usuNombre
        }
        set(usuNombre){
            self.usuNombre = usuNombre
        }
    }
    var usuEmailGetYSet:String{
        get{
            return self.usuEmail
        }
        set(usuEmail){
            self.usuEmail = usuEmail
        }
    }
    var usuCelularGetYSet:String{
        get{
            return self.usuCelular
        }
        set(usuCelular){
            self.usuCelular = usuCelular
        }
    }
    var usuCelularWhatsappGetYSet:String{
        get{
            return self.usuCelularWhatsapp
        }
        set(usuCelularWhatsapp){
            self.usuCelularWhatsapp = usuCelularWhatsapp
        }
    }
    var usuPasswordGetYSet:String{
        get{
            return self.usuPassword
        }
        set(usuPassword){
            self.usuPassword = usuPassword
        }
    }
    var usuTipoGetYSet:String{
        get{
            return self.usuTipo
        }
        set(usuTipo){
            self.usuTipo = usuTipo
        }
        
    }
    var usuValidadoGetYSet:Bool{
        get{
            return self.usuValidado
        }
        set(usuValidado){
            self.usuValidado = usuValidado
        }
        
    }
    var usuCodigoVerificacionGetYSet:String{
        get{
            return self.usuCodigoVerificacion
        }
        set(usuCodigoVerificacion){
            self.usuCodigoVerificacion = usuCodigoVerificacion
        }
        
    }
    var usuFechaNacimientoGetYSet:String{
        get{
            return self.usuFechaNacimiento
        }
        set(usuFechaNacimiento){
          self.usuFechaNacimiento = usuFechaNacimiento
        }
    }
    var ageIdGetYSet:String{
        get{
            return self.ageId
        }
        set(ageId){
            self.ageId = ageId
        }
    }
    
}
