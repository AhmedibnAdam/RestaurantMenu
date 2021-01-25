//
//  CollectionView.swift
//  RestaurantMenu
//
//  Created by Adam on 25/01/2021.
//

import UIKit

extension CategoriesViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmCats?.data.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoriesCollectionViewCell
        let cat = realmCats?.data[indexPath.row]
        cell.title.text = cat?.name
        let url = URL(string: cat!.image)
        cell.img.kf.setImage(with: url)
        cell.img.isHidden = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wifth = (collectionView.bounds.width - 30 )/3.0
        let yourHeight = wifth
        return CGSize(width: wifth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = self.realmCats?.data[indexPath.row]
        getProductsForCategory(cat: cat!)
        if (self.productsForCategory.count > 0) {
            router?.navigateToProducts(parameters: ["productsForCategory": productsForCategory])
        } else {
            Utilites.showErrorAlert(message: Utilites.getStringWithTag(tag: "No products found for this category"), VC: self)
        }
    }
}
