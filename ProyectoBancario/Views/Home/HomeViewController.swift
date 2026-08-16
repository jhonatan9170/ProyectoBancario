//
//  HomeViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var roundedView: UIView!
    
    private let viewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNavBar()
        view.backgroundColor = UIColor(named: "gray3")
        roundedView.backgroundColor = UIColor(named: "primaryBlue")
        roundedView.layer.cornerRadius = 24

        Task {
            await viewModel.fetchProducts()
        }
        
        viewModel.$products
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.productsTableView.reloadData()
            }
            .store(in: &cancellables)
        
    }
    
    private func setupTableView(){
        let nib = UINib(nibName: "AccountsViewCell", bundle: nil)
        productsTableView.register(nib, forCellReuseIdentifier: "procedureCell")
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.rowHeight = 70
        productsTableView.separatorStyle = .none
        productsTableView.backgroundColor = .clear
    }
    
    private func setNavBar(){
        self.navigationItem.title = "Hola " + (UserDefaults.standard.string(forKey: "name") ??  "")
        
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(named: "primaryBlue")
        apparence.titleTextAttributes = [ .foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
       


    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "procedureCell", for: indexPath) as? AccountsViewCell
        guard let cell else { return UITableViewCell() }
        let account = viewModel.products[indexPath.row]
        cell.setupCell(product: account)
        return cell
    }
    
}


extension HomeViewController {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        return viewController
    }
}
