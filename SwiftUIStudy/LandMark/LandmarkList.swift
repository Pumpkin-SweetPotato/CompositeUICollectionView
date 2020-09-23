//
//  LandmarkList.swift
//  SwiftUIStudy
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

struct LandmarkList: View {
//    @State var showFavoritesOnly = true
    @EnvironmentObject var userData: UserData
    
//    var landmarkList: [Landmark]
    
    var body: some View {
//        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination:
                                        LandmarkDetail(landmark: landmark)
                                        .environmentObject(userData)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
//        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE"], id: \.self) { deviceName in
            NavigationView {
                LandmarkList()
                    .environmentObject(UserData())
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
            }
        }
        
//    }
}
