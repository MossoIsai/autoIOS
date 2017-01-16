//
//  DetalleAgencia.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 05/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import Foundation
import UIKit

struct ImageToDisplay {
    
    var imageName: String
}

class DetalleAgencia: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
  
    @IBOutlet weak var imgAgencia: UIImageView!
    @IBOutlet weak var labelNombreAgencia: UILabel!
    @IBOutlet weak var labelDireccionAgencia: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    ///arreglo de imagenes
    var itemsToDisplay:[ImageToDisplay] = []
    /// Flow layout that displays cells with a Grid layout
    let gridFlowLayout = ProductsGridFlowLayout()
    ///Flow layout that displays cells with a List layout, like in a tableView
    let listFlowLayout = ProductsListFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        setupDatasource()
        setupInitialLayout()
    }
    
    func initViews(){
        self.title = "Audi Cuernavaca"
        imgAgencia.layer.cornerRadius = imgAgencia.frame.height/2
        imgAgencia.layer.cornerRadius = 15
       // imgAgencia.layer.borderWidth = 0.2
        //imgAgencia.layer.borderColor =  UIColor.black.cgColor
        imgAgencia.clipsToBounds = true
        imgAgencia.contentMode = .scaleAspectFit
        
    }
    // MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionCell
        
        let itemToDisplay = itemsToDisplay[indexPath.row]
        cell.imageView.image = UIImage(named: "\(itemToDisplay.imageName)"+".jpg")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }
    
    func setupDatasource() {
        //mercedes","mazda_car","jetta","honda_car","bwm_deportivo","a1","q5","q7","hummer","q3","r8"
        itemsToDisplay = [ImageToDisplay(imageName: "mercedes"), ImageToDisplay(imageName: "q5"), ImageToDisplay(imageName: "mazda_car"), ImageToDisplay(imageName: "r8"),
                          ImageToDisplay(imageName: "honda_car"), ImageToDisplay(imageName: "jetta"), ImageToDisplay(imageName: "bwm_deportivo"), ImageToDisplay(imageName: "a1"),
                          ImageToDisplay(imageName: "hummer"), ImageToDisplay(imageName: "q7")]
        
        collectionView.reloadData()
        
      //  detailLabel.text = "\(itemsToDisplay.count)" + " photos"
    }
    
    func setupInitialLayout() {
        //isGridFlowLayoutUsed = true
        collectionView.collectionViewLayout = gridFlowLayout
    }
    
    
    
    
}
