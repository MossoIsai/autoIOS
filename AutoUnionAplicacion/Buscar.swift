    //
    //  SecondViewController.swift
    //  AutoUnionAplicacion
    //
    //  Created by Isai Garcia Moso on 14/11/16.
    //  Copyright © 2016 developerMosso. All rights reserved.
    //
    
    import UIKit
    
    class Buscar: UITableViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate{
        
        var pickerMark: UIPickerView!
        var pickerModel: UIPickerView!
        var pickerVersion: UIPickerView!
        var marcaAuto:String = ""
        var modeloAuto:String = ""
        var versioAuto:String =  ""
        
        let marcasArray:[String] = ["Acura", "Alfa Romeo", "Aston Martin", "Audi", "Bentley", "BMW", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge", "FAW", "Ferrari", "Fiat", "Ford", "GMC", "Honda", "Hummer", "Hyundai", "Infiniti", "Isuzu", "Jaguar", "Jeep", "Kia", "Lamborghini", "Land Rover", "Lexus", "Lincoln", "Lotus", "Maserati", "Mastretta", "Maybach", "Mazda", "McLaren", "Mercedes Benz", "Mercury", "MG", "Mini", "Mitsubishi", "Nissan", "Opel", "Peugeot", "Pontiac", "Porsche", "Renault", "Rolls Royce", "Rover", "Saab", "Saturn", "Smart", "Ssangyong", "Subaru", "Suzuki", "Toyota", "Volkswagen", "Volvo", "Otras Marcas"]
        
        
        let modelosArray:[String] =  ["1500", "3500", "454", "Aerostar", "Apache", "Astra", "Astro Safari", "Astro Van", "Avalanche", "Aveo", "Beretta", "Blazer", "Buick", "C-15", "C-20", "Camaro", "Camaro Hot Wheels", "Camaro ZLI", "Capriche", "Captiva", "Cavallier", "Cavallier Z24", "Celebrity", "Century", "Chevelle", "Chevette", "Chevy", "Chevy Nova", "Chevy Pick Up", "Chevy Van", "Cheyenne", "Colorado", "Corsa", "Corvette", "Cruze", "Cutlass", "Epica", "Equinox", "Express Van", "Geo", "HHR", "Hi-Top", "Impala", "Kodiak", "Lumina", "LUV", "Malibú", "Matiz2", "Meriva", "Monte Carlo", "Monza", "Oldsmobile", "Optra", "Orlando", "Pick-Up", "Routan", "S10", "Saturn", "Savana", "Sierra", "Silhouette", "Silverado", "Sonic", "Sonora", "Spark", "Suburban", "Tahoe", "Tigra", "Tornado", "Tracker", "TrailBlazer", "Transport", "Traverse", "Trax", "Uplander", "Vanette", "Vectra", "Venture", "Volt", "Zafira", "Otros Modelos"]
        
        @IBOutlet weak var marca: UITextField!
        @IBOutlet weak var modelo: UITextField!
        @IBOutlet weak var version: UITextField!
        @IBOutlet weak var btnBuscar: UIButton!
        
        @IBAction func btnBuscar(_ sender: Any) {
            let btnSearch: UIButton =  (sender as!UIButton)
            btnSearch.backgroundColor =  UIColor(red: 50/255, green: 240/255, blue: 125/255, alpha: 1.0)
            btnSearch.layer.cornerRadius = 5
            btnSearch.layer.borderColor = UIColor.clear.cgColor
            btnSearch.setTitleColor(UIColor.white, for: .normal)
            
            
            if self.marca.text == "" {
                showAlerta(titulo: "Llena el campo vacio", mensaje: "Por favor llena el campo marca")
                
            }else if self.modelo.text == "" {
                showAlerta(titulo: "Llena el campo vacio", mensaje: "Por favor llena el campo modelo")
                
            }else if self.version.text == "" {
                showAlerta(titulo: "Llena el campo vacio", mensaje: "Por favor llena el campo versión")
            }
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            //Asigno el delegado a los textField
            self.marca.delegate = self
            self.modelo.delegate = self
            self.version.delegate = self
            //picker marca
            // self.pickerMark.dataSource = self
            //self.pickerMark.delegate = self
            btnBuscar.backgroundColor = .clear
            btnBuscar.layer.cornerRadius = 5
            btnBuscar.layer.borderWidth = 1
            btnBuscar.layer.borderColor = UIColor.black.cgColor
            btnBuscar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        /** ::::::::::::::: PICKER MARCA::::::::::::::::::: **/
        func pickerMarca(textFieldMarca : UITextField){
            
            self.pickerMark =  UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 216))
            
            self.pickerMark.backgroundColor =  UIColor.clear
            self.pickerMark.dataSource = self
            self.pickerMark.delegate = self
            textFieldMarca.inputView = self.pickerMark
            
            //Crear Toolbar para el pickerView
            let toolbarMarca = UIToolbar()
            toolbarMarca.barStyle = .default
            //Color de la barra blanco
            /*toolbarMarca.backgroundColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)*/
            toolbarMarca.backgroundColor = UIColor.clear
            toolbarMarca.isTranslucent = true
            toolbarMarca.tintColor = UIColor(red: 32/255, green: 112/255, blue: 243/255, alpha: 1.0)
            toolbarMarca.sizeToFit()
            
            // Adding Button ToolBar
            let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(Buscar.doneButtonMarca))
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(Buscar.cancelarMarca))
            cancelButton.tintColor =  UIColor.red
            
            toolbarMarca.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolbarMarca.isUserInteractionEnabled = true
            textFieldMarca.inputAccessoryView = toolbarMarca
            
        }
        //función del boton Done
        func doneButtonMarca(){
            //var valor = valor
            self.marca.text = marcaAuto
            self.modelo.text = "Todos los modelos"
            self.version.text = "Todas las versiones"
            self.marca.resignFirstResponder()
        }
        //cancelar Marca
        func cancelarMarca(){
            self.marca.resignFirstResponder()
        }
        
        
        //::::::::: CUANDO PRESIONAS DENTRO DEL TEXTFIELD::::::::::::::::
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.pickerMarca(textFieldMarca: self.marca)
            self.pickerModelo(textFieldModelo: self.modelo)
            
        }
        
        //::::::::::: METODOS DEL DELEGATE DE PICKER :::::::::::::::::::::::
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == pickerMark{
                return marcasArray.count

            }else if pickerView == pickerModel{
                return modelosArray.count
            }
            return 0
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == pickerMark{
                 return marcasArray[row]
            }else if pickerView == pickerModel{
                return modelosArray[row]
            }
            return ""
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //doneButtonMarca(marcasArray[row])
            if pickerView == pickerMark {
                self.marcaAuto =  marcasArray[row]
            }else if pickerView == pickerModel {
                self.modeloAuto = modelosArray[row]
            }
        }
        
        
        /*func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
         
         let  attributecolor : NSAttributedString!
         attributecolor =  NSAttributedString(string: marcasArray[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
         
         return attributecolor
         
         }*/
        
        //:::::::::::::::::::::::::::. PICKER MODELO ::::::::::::::::::::::::::
        func pickerModelo(textFieldModelo: UITextField) {
            // metodo para crear la interfaz del spiner del Modelo
            self.pickerModel = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 216))
            
            self.pickerModel.delegate = self
            self.pickerModel.dataSource = self
            self.pickerModel.backgroundColor = UIColor.clear
            
            let toolbarModelo =  UIToolbar()
            toolbarModelo.backgroundColor =  UIColor.white
            toolbarModelo.barStyle = .default
            toolbarModelo.tintColor = UIColor(red: 32/255, green: 112/255, blue: 243/255, alpha: 1.0)
            toolbarModelo.isTranslucent = true
            toolbarModelo.sizeToFit()
            textFieldModelo.inputView = pickerModel
            
            let buttonOK = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.done, target: nil, action: #selector(Buscar.buttonOKModel))
            
            
            let buttonCancelModelo  =  UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: nil, action: #selector(Buscar.buttonCancelModelo))
            
            let espacio =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            buttonCancelModelo.tintColor =  UIColor.red
            toolbarModelo.setItems([buttonCancelModelo,espacio,buttonOK], animated: true)
            toolbarModelo.isUserInteractionEnabled = true
            textFieldModelo.inputAccessoryView = toolbarModelo
            
        }
        //metodo buttonModelOK
        func buttonOKModel(){
            self.modelo.text = modeloAuto
            self.modelo.resignFirstResponder()
        }
        func buttonCancelModelo(){
            self.modelo.resignFirstResponder()
            
        }
        /**::::::::::::::::::::: METODOS::::::::::::::*/
        
        func showAlerta(titulo:String, mensaje:String){
            
            let alerta =  UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
            
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alerta.addAction(ok)
            
            self.present(alerta, animated: true, completion: nil)
            
            
        }
    }
    
