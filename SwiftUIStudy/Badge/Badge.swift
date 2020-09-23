//
//  Badge.swift
//  SwiftUIStudy
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8
       
   var badgeSymbols: some View {
       ForEach(0..<Badge.rotationCount) { i in
           RotatedBadgeSymbol(
               angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
           )
       }
       .opacity(0.5)
   }
    
    var body: some View {
        ZStack {
            BadgeBackground()
                .scaleEffect(1, anchor: .top)
            
            GeometryReader { geomtry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geomtry.size.width / 2.0, y: (3.0 / 4.0) * geomtry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
