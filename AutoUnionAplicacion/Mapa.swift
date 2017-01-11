//
//  Mapa.swift
//  AutoUnionAplicacion
//
//  Created by Isai Garcia Moso on 09/01/17.
//  Copyright © 2017 developerMosso. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Mapa: UIViewController,MKMapViewDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var mapaView: MKMapView!
    @IBAction func cambiarMapa(_ sender: UISegmentedControl) {
        
        switch  sender.selectedSegmentIndex {
        case 0:
         mapaView.mapType =  .standard
            break
        case 1:
            mapaView.mapType = . hybridFlyover
            break
        default:
            mapaView.mapType  = .standard
            break
        }
        
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         initViews()
        
    }

    func initViews(){
        mapaView.delegate = self
        self.title = "Ubicación"
        /** cuando tocas el mapa aparece o desaperece**/
        self.navigationController?.hidesBarsOnTap = true
        //Configuración del mapa
        let longitud = -99.2070589
        let latitud = 18.9343080
        
        let latiDelta: CLLocationDegrees = 0.020
        let longDelta:CLLocationDegrees = 0.020
        
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latiDelta, longDelta)
        let location:  CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitud,longitud)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        let pinPoint = MKPointAnnotation()
        pinPoint.coordinate = location
        pinPoint.title = "Audi Cuernava"
        pinPoint.subtitle = "Av Rio Mayo Cuernavaca"
        pinPoint.accessibilityElementsHidden = false
        mapaView.addAnnotation(pinPoint)
        mapaView.tintColor  = UIColor.black
        mapaView.mapType = .standard
       // mapaView.userLocation =  true
        mapaView.setRegion(region, animated: true)
        
    }

    
}
