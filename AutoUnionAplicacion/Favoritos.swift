//
//  Favoritos.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 23/12/16.
//  Copyright © 2016 developerMosso. All rights reserved.
//

import Foundation
import UIKit

class Favoritos:UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scroll.contentSize =  CGSize(width: self.view.frame.width, height: 2400)
        
    }
    
    
}
