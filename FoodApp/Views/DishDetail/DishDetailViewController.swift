//
//  DishDetailViewController.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    

    @IBAction func placeOrderButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showFailed("Please enter your name")
            ProgressHUD.colorAnimation = .systemRed
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkManager.shared.placeOrder(dishID: dish.id ?? "", name: name) { result in
            
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received 👨🏻‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
    }
    
}
