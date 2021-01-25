//
//  CollectionView.swift
//  RestaurantMenu
//
//  Created by Adam on 25/01/2021.
//

import UIKit
extension ProductsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsForCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoriesCollectionViewCell
        let product = productsForCategory[indexPath.row]
        cell.title.text = product.name
        let url = URL(string: product.image)
        cell.img.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wifth = (collectionView.bounds.width - 30 )/3.0
        let yourHeight = wifth

        return CGSize(width: wifth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsForCategory[indexPath.row]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { [self] in
            presentProductDetails(fromVC: self, product: product)
        })
        
    }
   
}
