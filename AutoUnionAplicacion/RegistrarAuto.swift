//
//  RegistrarAuto.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 30/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit


class RegistrarAuto: UITableViewController,UITextFieldDelegate,UIPickerViewDelegate,
UIPickerViewDataSource{
    
    /**private automático*/
    private var transmisionArray:[String] = ["Automático","Estandar","Otro"]
    
    /**String campos auxiliares**/
    private var strMarca = ""
    private var strModelo = ""
    private var strVersion = ""
    private var strAnio = ""
    private var strTranmicion = ""
    private var strMotor = ""
    private var strCombustible = ""
    private var strColorInterior = ""
    private var strColorExteior = ""
    private var strPrecioventa = ""
    private var strPrecioCompra = ""
    
    /**PICKERMARCA*/
    
    var pickerMarca:UIPickerView!
    var pickerModelo:UIPickerView!
    var pickerVersion:UIPickerView!
    var pickerAnio:UIPickerView!
    var pickerTransmision:UIPickerView!
    
    /**Etiquetas del formulario*/
    @IBOutlet weak var labelMarca: UILabel!
    @IBOutlet weak var labelModelo: UILabel!
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelAnio: UILabel!
    @IBOutlet weak var labelChasis: UILabel!
    @IBOutlet weak var labelTransmicion: UILabel!
    @IBOutlet weak var labelMotor: UILabel!
    @IBOutlet weak var labelCombustible: UILabel!
    @IBOutlet weak var labelColorInterior: UILabel!
    @IBOutlet weak var labelColorExterior: UILabel!
    @IBOutlet weak var labelPrecioVenta: UILabel!
    @IBOutlet weak var labelPrecioCompra: UILabel!
    
    /**Campo de Texto*/
    @IBOutlet weak var campoMarca: UITextField!
    @IBOutlet weak var campoModelo: UITextField!
    @IBOutlet weak var campoVersion: UITextField!
    @IBOutlet weak var campoAnio: UITextField!
    @IBOutlet weak var campoChasis: UITextField!
    @IBOutlet weak var campoTransmicion: UITextField!
    @IBOutlet weak var campoMotor: UITextField!
    @IBOutlet weak var campoCombustible: UITextField!
    @IBOutlet weak var campoColorInterior: UITextField!
    @IBOutlet weak var campoColorExterior: UITextField!
    @IBOutlet weak var campoPrecioCompra: UITextField!
    @IBOutlet weak var campoPrecioVenta: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Cargando vistas
        cargarVistas()
        
        
    }
    
    
    func cargarVistas() {
        //Asiganado delegados ha cada campo de texto
        campoMarca.delegate = self
        campoModelo.delegate = self
        campoVersion.delegate = self
        campoAnio.delegate = self
        campoChasis.delegate = self
        campoTransmicion.delegate = self
        campoMotor.delegate = self
        campoCombustible.delegate = self
        campoColorInterior.delegate = self
        campoColorExterior.delegate = self
        campoPrecioCompra.delegate = self
        campoPrecioVenta.delegate = self
        
    }
    
    override func resignFirstResponder() -> Bool {
        return true
    }
    //Finalizar la edición de textos
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Cambios de la siguiente")
        
    }
    /**PICKERS VIEWS**/
    func pickersFunction(campoTexto:UITextField!,pickerx:UIPickerView!) {
        var picker:UIPickerView!
        picker = pickerx
        
        picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 216))
        
        picker.backgroundColor = UIColor.clear
        picker.dataSource = self
        picker.delegate = self
        campoTexto.inputView = picker
        
        let toolbarMolde = UIToolbar()
        toolbarMolde.backgroundColor = UIColor.white
        toolbarMolde.barStyle = .default
        
        toolbarMolde.tintColor = UIColor(red: 32/255, green: 112/255, blue: 243/255, alpha: 1.0)
        toolbarMolde.isTranslucent = true
        toolbarMolde.sizeToFit()
        
        let espacio = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        if campoTexto == campoMarca{
            
            let buttonOK = UIBarButtonItem(title: "OK", style:
                .done, target: nil, action: #selector(RegistrarAuto.buttonOKMarca))
            let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(RegistrarAuto.buttonCancelMarca))
            toolbarMolde.setItems([buttonCancel,espacio,buttonOK], animated: false)
            buttonCancel.tintColor = UIColor.red
        } else if campoTexto == campoModelo {
            
            let buttonOK = UIBarButtonItem(title: "OK", style:
                .done, target: nil, action: #selector(RegistrarAuto.buttonOkModelo))
            let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(RegistrarAuto.buttonCancelModelo))
            toolbarMolde.setItems([buttonCancel,espacio,buttonOK], animated: false)
            buttonCancel.tintColor = UIColor.red
            
        }else if  campoTexto == campoVersion{
            
            let buttonOK = UIBarButtonItem(title: "OK", style:
                .done, target: nil, action: #selector(RegistrarAuto.buttonOkVersion))
            let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(RegistrarAuto.buttonCancelVersion))
            toolbarMolde.setItems([buttonCancel,espacio,buttonOK], animated: false)
            buttonCancel.tintColor = UIColor.red
            
        }else if campoTexto == campoAnio {
            
            let buttonOK = UIBarButtonItem(title: "OK", style:
                .done, target: nil, action: #selector(RegistrarAuto.buttonOkAnio))
            let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(RegistrarAuto.buttonCancelAnio))
            toolbarMolde.setItems([buttonCancel,espacio,buttonOK], animated: false)
            buttonCancel.tintColor = UIColor.red
            
        } else if campoTexto == campoTransmicion {
            
            let buttonOK = UIBarButtonItem(title: "OK", style:
                .done, target: nil, action: #selector(RegistrarAuto.buttonOkTranmision))
            let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(RegistrarAuto.buttonCancelTransmision))
            toolbarMolde.setItems([buttonCancel,espacio,buttonOK], animated: false)
            buttonCancel.tintColor = UIColor.red
            
        }
        toolbarMolde.isUserInteractionEnabled = true
        campoTexto.inputAccessoryView  =  toolbarMolde
        
    }
    //metodo marca
    func buttonOKMarca(){
        campoMarca.text = strMarca
        campoMarca.resignFirstResponder()
    }
    func buttonCancelMarca(){
        campoMarca.resignFirstResponder()
        
    }
    //modelo
    func buttonOkModelo(){
        campoModelo.text = strModelo
        campoModelo.resignFirstResponder()
    }
    func buttonCancelModelo() {
        campoModelo.resignFirstResponder()
    }
    //version
    func buttonOkVersion(){
        campoVersion.text = strVersion
        campoVersion.resignFirstResponder()
    }
    func buttonCancelVersion() {
        campoVersion.resignFirstResponder()
    }
    //año
    func buttonOkAnio(){
        campoAnio.text = strAnio
        campoAnio.resignFirstResponder()
    }
    func buttonCancelAnio() {
        campoAnio.resignFirstResponder()
    }
    //Transmicion
    func buttonOkTranmision(){
        campoTransmicion.text = strTranmicion
        campoTransmicion.resignFirstResponder()
    }
    func buttonCancelTransmision() {
        campoTransmicion.resignFirstResponder()
    }
    //Cuando preionas dentro del input
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        pickersFunction(campoTexto: campoMarca, pickerx: pickerMarca)
        pickersFunction(campoTexto: campoModelo, pickerx: pickerModelo)
        pickersFunction(campoTexto: campoVersion, pickerx: pickerVersion)
        pickersFunction(campoTexto: campoAnio, pickerx: pickerAnio)
        pickersFunction(campoTexto: campoTransmicion, pickerx: pickerTransmision)
    }
    /** :::: METODOS NECESARIOS POR EL DELEGATE Y DATASOURCE ::::**/
    //::::::::::: METODOS DEL DELEGATE DE PICKER :::::::::::::::::::::::
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       /* if pickerView == pickerTransmision!{
            return transmisionArray[row]
        }*/
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    
    
    
}
