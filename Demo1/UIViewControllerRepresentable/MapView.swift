//
//  MapView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MapViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MapView>) -> MapViewController {
        MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: UIViewControllerRepresentableContext<MapView>) {
        // Do nothing here
    }
}
