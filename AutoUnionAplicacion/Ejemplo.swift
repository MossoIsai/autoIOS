//
//  Ejemplo.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 25/11/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import UIKit
class Ejemplo: UIViewController{
    
    @IBOutlet weak var scroll: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.contentSize.height = 1700
    }
}
