//
//  ContentView.swift
//  CompositeCollectionview
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        CompositeUICollectionViewWrapper(numberOfItemInSection: 10, numberOfSection: 1)
            .scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
