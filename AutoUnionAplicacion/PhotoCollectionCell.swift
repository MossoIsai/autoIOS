//
//  PhotoCollectionCell.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 13/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image  =  nil
    }
    
    
}
