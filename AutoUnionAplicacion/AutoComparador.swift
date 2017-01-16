//
//  AutoComparador.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 12/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import Foundation
import UIKit
class AutoComparador: UIViewController{
    
    @IBOutlet weak var colllectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    func initViews() {
        
        self.title  = "Comparador"
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3.2, height: 100)
    }
    
    
    
    
    
}
