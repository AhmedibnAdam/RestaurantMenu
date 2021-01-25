//
//  ProductDetailsViewController.swift
//  RestaurantMenu
//
//  Created by Adam on 25/01/2021.
//


import UIKit
import Kingfisher

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    var product: ProductsDatum?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = product?.name
        categoryLabel.text = product?.category?.name
        priceLabel.text = "\(product?.price ?? 0)"
        let url = URL(string: product?.image ?? "")
        displayImageView.kf.setImage(with: url)
    }
    @IBAction func submitButtonClicked(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
