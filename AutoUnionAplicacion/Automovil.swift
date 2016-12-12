//
//  Automovil.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 12/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
class Automovil: NSObject  {
    
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
    
    var idAutoGetYSet:String {
        get{
          return idAuto
        }
        set(idAuto){
            self.idAuto = idAuto
        }
    }
    
init(idAuto:String,marca:String,modelo:String,version:String,chasis:String,colorInterior:String,colorExterior:String,precioVenta:String,precioCompra:String,precioAnterior:String,anio:Int,fechaLlegada:String,transmision:String,tipoMotor:String,combustible:String,descripcion:String) {
    
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
        
    }
    
    
    

    
}
