//
//  HomeViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit
import Combine

class HomeViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    let spiner = UIActivityIndicatorView(style: .large)
    
    private let viewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor(named: "gray3")
        backgroundView.backgroundColor = UIColor(named: "bluePrimary")
        backgroundView.layer.cornerRadius = 24
        setupTableView()
        addSpinner()
        Task {
            await viewModel.getProcedures()
        }
        viewModel.$accounts
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.tableView.reloadData()
                self.removeSpiner()
            }
            .store(in: &cancellables)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Hola " + (UserDefaults.standard.string(forKey: "name") ?? "")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "bluePrimary")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView(){
        let nib = UINib(nibName: "AccountsViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "procedureCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    func addSpinner() {
        spiner.center = view.center
        view.alpha = 0.65
        view.addSubview(spiner)
        spiner.startAnimating()
    }
    
    func removeSpiner() {
        spiner.removeFromSuperview()
        view.alpha = 1
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "procedureCell", for: indexPath) as? AccountsViewCell
        guard let cell else { return UITableViewCell() }
        let account = viewModel.accounts[indexPath.row]
        cell.setupCell(product: account)
        return cell
    }
    
}


extension HomeViewController {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeViewControllerID")
    }
}
