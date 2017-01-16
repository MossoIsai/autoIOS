//
//  DetalleUsuario.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 15/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit

class DetalleUsuario: UITableViewController,UITextFieldDelegate{
    //PickerDate varible
    var datePicker: UIDatePicker!
    
    //Datos del formulario
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var whatsapp: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var fechaNacimiento: UITextField!
    @IBOutlet weak var btnGuardar: UIButton!
    
    //***************  METODO PRINCIPAL **************//
    override func viewDidLoad() {
        initViews()
    }
    
    // Evento de editar textField
    @IBAction func editarDatos(_ sender: Any) {
        editarDatosFormulario()
    }
    //Evento "intro"  del teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.correo.resignFirstResponder()
        self.nombre.resignFirstResponder()
        self.usuario.resignFirstResponder()
        self.contrasena.resignFirstResponder()
        return true
    }
    //funcion que se utiliza  cuando se termian de editar
    func doneButtonAction(){
        self.view.endEditing(true)
    }
    //cuando se preciona dentro del textField FechaNacimiento
    //MARK:- textFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.fechaNacimiento)
    }
    //MARK:- Function of datePicker
    func pickUpDate(_ textField : UITextField){
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.clear
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        print("Presionando")
        // ToolBar creada para el picker de fecha
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 32/255, green: 112/255, blue: 243/255, alpha: 1.0)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(DetalleUsuario.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(DetalleUsuario.cancelClick))
        cancelButton.tintColor =  UIColor.red
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    // MARK:- Button Done and Cancel
    func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        fechaNacimiento.text = dateFormatter1.string(from: datePicker.date)
        fechaNacimiento.resignFirstResponder()
    }
    func cancelClick() {
        fechaNacimiento.resignFirstResponder()
    }
    //evento Botón GUARDAR INFORMACION
    @IBAction func actionGuadar(_ sender: Any) {
        let telefonoCantidad = self.telefono.text?.characters.count
        let whatsappCantidad = self.whatsapp.text?.characters.count
        if telefonoCantidad! > 15 || whatsappCantidad! > 15 {
            
            alertarMensaje(mensaje: "Ha excedido el número de caracteres permitidos", titulo: "Alerta")
        }
    }
    //metodo para mostrar un mensaje de uiaLERTvIEW
    func alertarMensaje(mensaje:String, titulo:String) {
        let alerta =  UIAlertController(title: titulo, message:mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alerta, animated: true, completion: nil)
    }
    
    /** ::::::::::::::::.  FUNCIÓN PARA EDITAR FORMULARIO DEL USUARIOS ::::::::::::**/
    func editarDatosFormulario() {
        self.nombre.isEnabled = true
        self.correo.isEnabled = true
        self.telefono.isEnabled = true
        self.whatsapp.isEnabled = true
        self.fechaNacimiento.isEnabled = true
        self.usuario.isEnabled = true
        self.contrasena.isEnabled = true
        
        self.nombre.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        self.correo.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        self.telefono.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        self.whatsapp.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        self.usuario.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        self.fechaNacimiento.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255 , alpha: 1.0)
        
    }
    /** ::::::::::::::::. CONFIGURACIÓN DE USUARIOS ::::::::::::::::: **/
    
    func inicioFormulario(name:String, mail:String, phone:String, whats:String, user:String, fechaNac:String) {
        
        nombre.text = name
        correo.text = mail
        telefono.text = phone
        whatsapp.text =  whats
        usuario.text = user
        fechaNacimiento.text = fechaNac
        
        nombre.isEnabled = false
        correo.isEnabled = false
        telefono.isEnabled = false
        whatsapp.isEnabled = false
        usuario.isEnabled = false
        fechaNacimiento.isEnabled = false
        
        nombre.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
        correo.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
        telefono.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
        whatsapp.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
        usuario.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
        fechaNacimiento.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255 , alpha: 1.0)
    }
    
    /** :::::::::::::::: METODO QUE CARGA LAS VISTAS DE CONFIGURACION :::::::::::: **/
    
    func initViews(){
        //seteando valores de los campos
        inicioFormulario(name: "Andres Angulo", mail: "andresiño@audi.com", phone: "7771290456", whats: "7771290456", user: "andresiño", fechaNac: "18/Marzo/1985")
        
        //self.tableView.backgroundColor = UIColor.white
        //self.correo.keyboardType = UIKeyboardType.emailAddress
        //Metodo que carga al inicio
        btnGuardar.layer.cornerRadius = 5
        btnGuardar.layer.shadowRadius = 5
        btnGuardar.layer.borderColor = UIColor.black.cgColor
        btnGuardar.layer.borderWidth = 1
        btnGuardar.backgroundColor = .clear
        
        //relacionado los input cons su delegate
        correo.delegate = self
        nombre.delegate = self
        usuario.delegate = self
        contrasena.delegate = self
        
        //toolbar teclado
        let toolbar :UIToolbar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        // crea el espacio vacío del lado izquierdo para que el botón hecho esté en el lado derecho
        let espacioButonDone  =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //crea el boton de echo
        let doneBtn:UIBarButtonItem =  UIBarButtonItem(title: "Done", style:.done, target: self, action: #selector(DetalleUsuario.doneButtonAction))
        
        //array of BarButtonItems
        var array = [UIBarButtonItem]()
        array.append(espacioButonDone)
        array.append(doneBtn)
    
        //agregando el boton al toolbar
        toolbar.setItems(array, animated: true)
        toolbar.sizeToFit()
        
        //agregando el toolbar como un accesorio dentro de los campos numericos
        self.telefono.inputAccessoryView = toolbar
        self.whatsapp.inputAccessoryView = toolbar
        
        
    }
    
    
    
    
    
    
    
    
}
