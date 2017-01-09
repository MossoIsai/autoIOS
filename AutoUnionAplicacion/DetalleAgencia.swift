//
//  DetalleAgencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 05/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import Foundation
import UIKit


class DetalleAgencia: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgAgencia: UIImageView!
    @IBOutlet weak var gridView: UICollectionView!

    @IBOutlet weak var btnSeguir: UIButton!
    @IBAction func btnSeguir(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }
    
    
    func initView(){
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2400)
        
        btnSeguir.layer.cornerRadius = 5
        btnSeguir.layer.borderWidth = 1
        btnSeguir.layer.borderColor = UIColor.black.cgColor
        
        
        
        

        
        
        
    }
    
    
    
}
