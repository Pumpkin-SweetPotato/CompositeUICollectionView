//
//  MapContentView.swift
//  SwiftUIStudy
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

struct MapContentView: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
        }
        
    }
}

struct Content_Previewable: PreviewProvider {
    static var previews: some View {
        MapContentView(landmark: landmarkData[0])
    }
}
