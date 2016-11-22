//
//  DetalleUsuario.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 15/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit

class DetalleUsuario: UITableViewController,UITextFieldDelegate {
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
        //self.correo.keyboardType = UIKeyboardType.emailAddress
        //Metodo que carga al inicio
        btnGuardar.layer.cornerRadius = 4
        btnGuardar.layer.shadowRadius = 4
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
        // ToolBar
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
    
    
}
