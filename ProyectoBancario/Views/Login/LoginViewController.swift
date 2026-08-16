//
//  LoginViewController.swift
//  T1-solucion
//
//  Created by Jhonatan Chavez on 1/08/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var documentTxtF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
   private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedDocument = viewModel.savedDocument {
            let vc = SecondStepViewController.build(document: savedDocument)
            navigationController?.pushViewController(vc, animated: true)
        }
        setupUI()
    }
    
    private func setupUI() {
        
        logoImg.image = UIImage(named: "primaryLogo")
        
        titleLbl.text = "Identifícate para continuar"
        titleLbl.font = UIFont(name: "Montserrat-Bold", size: 24)
        titleLbl.textColor = UIColor(named: "gray1")
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .center
        
        documentTxtF.placeholder = "Número de documento"
        documentTxtF.textColor = UIColor(named: "gray1")
        documentTxtF.font = UIFont(name: "Montserrat-Bold", size: 16)
        documentTxtF.backgroundColor = UIColor(named: "gray2")
        documentTxtF.layer.cornerRadius = 8
        documentTxtF.borderStyle = .none
        documentTxtF.keyboardType = .numberPad
        
        ButtonStyle.setPrimaryButton(button: nextBtn, text: "Continuar")
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        let result = viewModel.validate(document: documentTxtF.text ?? "")
        
        switch result {
        case .valid:
            let vc = SecondStepViewController.build(document: documentTxtF.text ?? "")
            navigationController?.pushViewController(vc, animated: true)
        case .invalid(let message):
            let alert = UIAlertController(
                title: "Error",
                message: message,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            present(alert, animated: true)
        }

    }

}
