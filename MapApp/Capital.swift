//
//  Capital.swift
//  MapApp
//
//  Created by Mohammad Ashraful Islam Sadi on 12/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info:String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
