//
//  Landmark.swift
//  Landmarks
//
//  Created by Nelson on 4/8/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    
    private var coordinates: Coordinates
    var locationCoordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
