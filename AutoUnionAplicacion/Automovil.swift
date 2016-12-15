//
//  Automovil.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 12/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation

class Automovil {
    
    private var idAuto:String = ""
    private var marca:String =  ""
    private var modelo:String =  ""
    private var version:String =  ""
    private var chasis:String = ""
    private var colorInterior:String = ""
    private var colorExterior:String  = ""
    private var precioVenta:String =  ""
    private var precioCompra:String = ""
    private var precioAnterior:String = ""
    private var anio:Int = 0
    private var fechaLlegada:String = ""
    private var transmision:String = ""
    private var tipoMotor:String = ""
    private var combustible:String = ""
    private var descripcion:String = ""
    private var fotografiasArray:[String] = []
    
    init(idAuto:String,marca:String,modelo:String,version:String,chasis:String,colorInterior:String,colorExterior:String,precioVenta:String,precioCompra:String,precioAnterior:String,anio:Int,fechaLlegada:String,transmision:String,tipoMotor:String,combustible:String,descripcion:String,fotografiasArray:[String]) {
        
        self.idAuto =  idAuto
        self.marca =  marca
        self.modelo =  modelo
        self.version =  version
        self.chasis =  chasis
        self.colorInterior =  colorInterior
        self.colorExterior =  colorExterior
        self.precioVenta = precioVenta
        self.precioCompra = precioCompra
        self.precioAnterior = precioAnterior
        self.anio = anio
        self.fechaLlegada =  fechaLlegada
        self.transmision =  transmision
        self.tipoMotor = tipoMotor
        self.combustible = combustible
        self.descripcion =  descripcion
        self.fotografiasArray = fotografiasArray
        
    }
    init(){
        
    }
    
    var idAutoGetYSet:String {
        get{
          return idAuto
        }
        set(idAuto){
            self.idAuto = idAuto
        }
    }
    var marcaGetYSet:String{
        get{
            return self.marca
        }
        set(marca){
            self.marca = marca
        }
    }
    var modeloGetYSet:String{
        get{
            return self.modelo
        }
        set(modelo){
            self.modelo = modelo
        }
    }
    var versionGetYSet:String{
        get{
            return self.version
        }
        set(version){
            self.version = version
        }
    }
    var chasisGetYSet:String{
        get{
            return self.chasis
        }
        set(chasis){
            self.chasis = chasis
        }
    }
    var  colorInteriorGetYSet:String{
        get{
            return self.colorInterior
        }
        set(colorInterior){
            self.colorInterior = colorInterior
        }
    }
    var colorExteriorGetYSet:String{
        get{
            return self.colorExterior
        }
        set(colorExterior){
            self.colorExterior = colorExterior
        }
    }
    var precioVentaGetYSet:String{
        get{
            return self.precioVenta
        }
        set(precioVenta){
            self.precioVenta = precioVenta
        }
    }
    var precioCompraGetYSet:String{
        get{
            return self.precioCompra
        }
        set(precioCompra){
            self.precioCompra = precioCompra
        }
    }
    var precioAnteriorGetYSet:String{
        get{
            return self.precioAnterior
        }
        set(precioAnterior){
            self.precioAnterior = precioAnterior
        }
    }
    var anioGetYSet:Int{
        get{
            return self.anio
        }
        set(anio){
            self.anio = anio
        }
    }
    var fechaLlegadaGetYSet:String{
        get{
            return self.fechaLlegada
        }
        set(fechaLlegada){
            self.fechaLlegada = fechaLlegada
        }
    }
    var transmisionGetYSet:String{
        get{
            return self.transmision
        }
        set(transmision){
            self.transmision = transmision
        }
    }
    var tipoMotorGetYSet:String{
        get{
            return self.tipoMotor
        }
        set(tipoMotor){
            self.tipoMotor = tipoMotor
        }
    }
    var combustibleGetYSet:String{
        get{
            return self.combustible
        }
        set(combustible){
            self.combustible = combustible
        }
    }
    var descripcionGetYSet:String{
        get{
            return self.descripcion
        }
        set(descripcion){
            self.descripcion = descripcion
        }
    }
    var fotografiasArrayoGetYSet:[String]{
        get{
            return self.fotografiasArray
        }
        set(fotografiasArray){
           self.fotografiasArray = fotografiasArray
        }
    }
    
}
