//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 26/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var incorrectEmailLabel: UILabel!
    
    @IBOutlet weak var anchorBottomView: NSLayoutConstraint!
    
    @IBAction func loginButton(_ sender: Any) {
        let movieListVC = MoviesListViewController(nibName: "MoviesListViewController", bundle: nil)
        movieListVC.modalPresentationStyle = .fullScreen
        self.present(movieListVC, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrectEmailLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotification()
    }
}

extension LoginViewController {
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterKeyboardNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        // Este fn recibe una notificacion para saber cuando mostrarse
//        print(notification.userInfo)
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero // me trae informacion de un diccionario correspondiente a la key llamada "keyboardFrameEndUserInfoKey"
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomView.constant = -keyboardFrame.height // verificar el signo menos aqui
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        // Este fn recibe una notificacion para saber cuando ocultarse
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomView.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}
