//
//  SwiftUIStudyApp.swift
//  SwiftUIStudyView
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

@main
struct SwiftUIStudyApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("SwiftUITest")
                NavigationLink(destination: CompositeCollectionContentView()) {
                    Text("CompositeCollectionContentView")
                }
//                .navigationBarTitle("CompositeCollectionContentView")
                NavigationLink(
                    destination: LandmarkList()
                        .environmentObject(UserData())
                ) {
                    Text("LandmarkList")
                }
//                .navigationBarTitle("Swift UI Study")
            }
        }
    }
}

struct SwiftUIStudyApp_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
