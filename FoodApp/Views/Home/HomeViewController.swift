//
//  HomeViewController.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        
        registerCells()

    }
    
    private func registerCells() {
        foodCategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    



}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setup(category: categories[indexPath.row])
        
        return cell
    }
}
