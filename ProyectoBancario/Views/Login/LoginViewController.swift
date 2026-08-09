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
        setupUI()
    }
    
    private func setupUI() {
        
        logoImg.image = UIImage(named: "primaryLogo")
        titleLbl.text = "Identifícate para continuar"
        titleLbl.font = UIFont(name: "Montserrat-Bold", size: 24)
        titleLbl.textColor = UIColor(named: "gray1")
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .center
        documentTxtF.setPrimaryTextField(placeholder: "Número de documento", keyboarType: .decimalPad)
        nextBtn.setPrimaryButton(text: "Continuar")
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        let result = viewModel.validateDocument(documentTxtF.text ?? "")
        
        switch result {
        case .success:
            // TODO : Go to next Page
            break
        case .failure(message: let message):
            showAlert(message: message)
        }

    }

}
