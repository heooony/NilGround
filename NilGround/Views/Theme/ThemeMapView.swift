//
//  ThemeMapView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/08.
//

import SwiftUI
import MapKit

struct ThemeMapView: View {
    @StateObject private var mapVM = MapViewModel()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.420047, longitude: 127.126465), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State var showingSheet = false
    
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear {
                    mapVM.checkIfLocationServicesIsEnabled()
                }

            
        }
        .sheet(isPresented: $showingSheet) {
            Text("asd")
        }
    }
}

struct ThemeMapView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeMapView()
    }
}
