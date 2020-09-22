//
//  ContentView.swift
//  CompositeCollectionview
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

struct CompositeCollectionContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        CompositeUICollectionViewWrapper(items: ["he","llo","world"])
            .scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CompositeCollectionContentView()
    }
}
