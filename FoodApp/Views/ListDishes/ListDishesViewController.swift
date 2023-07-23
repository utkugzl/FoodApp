//
//  ListDishesViewController.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var dishListTableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dishListTableView.delegate = self
        dishListTableView.dataSource = self
        
        title = category.name
        
        registerCells()
        
        ProgressHUD.show()
        NetworkManager.shared.fetchCategoryDishes(categoryID: category.id ?? "") { [weak self] result in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.dishListTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        dishListTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controler = DishDetailViewController.instantiate()
        controler.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controler, animated: true)
    }
    
    
}
