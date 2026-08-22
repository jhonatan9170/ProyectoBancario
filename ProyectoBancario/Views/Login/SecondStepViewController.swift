//
//  SecondStepViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit
import Combine

class SecondStepViewController: UIViewController {
    
    @IBOutlet weak var avatarLogoImg: UIImageView!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var changeUserButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let spiner = UIActivityIndicatorView(style: .large)
    
    private var cancellables: Set<AnyCancellable> = []
    
    var viewModel: SecondStepViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Iniciar sesión"
        
        avatarLogoImg.image = UIImage(named: "avatarLogo")
        changeUserButton.setTitle("Cambiar usuario", for: .normal)
        forgotPasswordLabel.text = "¿Olvidaste tu contraseña?"
        nextButton.setTitle("Iniciar sesión", for: .normal)
        passwordTextField.placeholder = "Ingresa tu clave digital"
        documentLabel.text = viewModel.nombre
        viewModel.$succes
            .sink { succes in
                guard let succes else { return }
                if succes {
                    self.view.window?.rootViewController = BankTabViewController()
                } else {
                    self.showAlert(message: "Error")
                }
            }
            .store(in: &cancellables)
    }
    
    @IBAction func changeUserButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        addSpinner()
        viewModel.password = passwordTextField.text ?? ""
        Task {
            await viewModel.login()
            removeSpiner()
        }
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

extension SecondStepViewController {
    static func build(document: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondStepViewControllerID") as? SecondStepViewController
        let viewModel = SecondStepViewModel()
        viewModel.document = document
        vc?.viewModel = viewModel
        return vc!
    }
}
