//
//  CompositeUICollectionView.swift
//  CompositeCollectionview
//
//  Created by eazel7 on 2020/09/22.
//

import Foundation
import SwiftUI
import UIKit

struct CompositeUICollectionViewWrapper: UIViewRepresentable {
    var numberOfItemInSection: Int
    var numberOfSection: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CompositeCell")
        
        return collectionView
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(1.0)))
                leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                
                let trailingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
                trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                
                let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0)), subitem: trailingItem, count: 2)
                
                let nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.85), heightDimension: .fractionalHeight(0.4)), subitems: [leadingItem, trailingGroup])
                
                let section = NSCollectionLayoutSection(group: nestedGroup)
                section.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                
                return section
        }
        
        return layout
    }
    
    func updateUIView(_ compositeUICollectionView: UICollectionView, context: Context) {
        compositeUICollectionView.reloadData()
//        compositeUICollectionView.
    }
    
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        var wrapper: CompositeUICollectionViewWrapper
        init (_ wrapper: CompositeUICollectionViewWrapper) {
            self.wrapper = wrapper
        }
        
        func updateNumberOfItem(sender: CompositeUICollectionViewWrapper) {
            wrapper.numberOfItemInSection = sender.numberOfItemInSection
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return wrapper.numberOfItemInSection
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return wrapper.numberOfSection
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositeCell", for: indexPath)
            cell.backgroundColor = .brown
            return cell
        }
    }
    
}


struct CompositeUICollectionView_Previews: PreviewProvider {
    static var previews: some View {
//        Text("test")
//            .foregroundColor(.blue)
        CompositeUICollectionViewWrapper(numberOfItemInSection: 6, numberOfSection: 2)
            .scaledToFit()
//            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
