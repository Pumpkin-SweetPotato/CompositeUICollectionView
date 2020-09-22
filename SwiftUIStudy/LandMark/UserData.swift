//
//  UserData.swift
//  SwiftUIStudy
//
//  Created by eazel7 on 2020/09/22.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
