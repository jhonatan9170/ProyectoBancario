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
    
    var viewModel: SecondStepViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Iniciar sesión"
        avatarLogoImg.image = UIImage(named: "avatarLogo")
        documentLabel.text = viewModel?.document
        changeUserButton.setTitle("Cambiar de usuario", for: .normal)
        passwordTextField.placeholder = "Contraseña"
        forgotPasswordLabel.text = "¿Olvidaste tu contraseña?"
        nextButton.setTitle("Iniciar sesión", for: .normal)
        
        viewModel?.$isSuccess
            .sink { isSucces in
                if isSucces {
                    let vc = BankTabViewController()
                    self.view.window?.rootViewController = vc
                }
            }
            .store(in: &cancellables)
    }
    
    @IBAction func changeUserButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        viewModel?.password = passwordTextField.text ?? ""
        Task {
            await viewModel?.login()
        }
    }
    
}

extension SecondStepViewController {
    static func build(document: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondStepViewControllerID") as? SecondStepViewController
        let viewModel = SecondStepViewModel()
        viewModel.document = document
        vc?.viewModel = viewModel
        return vc ?? UIViewController()
    }
}
