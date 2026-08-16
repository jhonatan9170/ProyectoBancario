//
//  ForYouViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit
import WebKit

class ForYouViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://beneficios.sip.pe/")!
        webView.load(URLRequest(url: url))
    }
    
}

extension ForYouViewController {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ForYouViewControllerID")
        return viewController
    }
}
