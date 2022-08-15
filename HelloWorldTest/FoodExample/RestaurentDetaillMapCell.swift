//
//  RestaurentDetaillMapCell.swift
//  HelloWorldTest
//
//  Created by Ajin on 15/08/22.
//

import UIKit
import MapKit

class RestaurentDetaillMapCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!{
        didSet{
            mapView.layer.cornerRadius = 30
            mapView.clipsToBounds = true
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location:String){
        
        // to get location
        let geoCoder = CLGeocoder()
        
        print(location)
        
        geoCoder.geocodeAddressString(location) { placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    //zoom
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        }
    }

}
