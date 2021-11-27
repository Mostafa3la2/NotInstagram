//
//  LoginController.swift
//  NotInstagram
//
//  Created by Mostafa Alaa on 23/11/2021.
//

import UIKit

class LoginController:UIViewController{
    
    
    private var viewModel = LoginViewModel()
    
    private let iconImage :UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "logo"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    private let emailTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.isEnabled = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    
    private let dontHaveAccountButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(normalText: "Don't have an account ? ", boldText: "Sign up now")
        button.addTarget(self, action: #selector(navigateToSigup), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(normalText: "Forgot password ? ", boldText: "Get help siging in")
        return button
    }()
    
    
    
    @objc func navigateToSigup(){
        let controller = RegisterationController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func configureUI(){
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        self.configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top:view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton,forgotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top:iconImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
        
        configureNotificationObservers()
        
    }
    
    
    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

    }
    @objc func textDidChange(sender:UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        }
        if sender == passwordTextField{
            viewModel.password = sender.text
        }
        updateForm()
    }
}

extension LoginController:FormViewModel{
    func updateForm() {
        loginButton.isEnabled = viewModel.formIsValid
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTextColor, for: .normal)
    }
}
