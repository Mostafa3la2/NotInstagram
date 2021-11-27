//
//  RegisterationController.swift
//  NotInstagram
//
//  Created by Mostafa Alaa on 23/11/2021.
//

import UIKit


class RegisterationController:UIViewController{
    
    private var viewModel = RegistrationViewModel()
    
    
    private let plusPhotoButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage( #imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(selectProfileImage), for: .touchUpInside)
        button.tintColor = .white
        button.setWidth(150)
        button.setHeight(150)
        return button
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
    
    private let fullNameTextField = CustomTextField(placeholder: "Fullname")
    private let userNameTextField = CustomTextField(placeholder: "Username")
    
    private let signupButton:UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private let alreadyHaveAccount:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(normalText: "Already have an account ? ", boldText: "Log in now")
        button.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func navigateToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectProfileImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated: true)
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
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top:view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,fullNameTextField,userNameTextField,signupButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top:plusPhotoButton.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(alreadyHaveAccount)
        alreadyHaveAccount.centerX(inView: view)
        alreadyHaveAccount.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

    }
    
    @objc func textDidChange(sender:UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        }
        else if sender == passwordTextField{
            viewModel.password = sender.text
        }
        else if sender == fullNameTextField{
            viewModel.fullname = sender.text
        }else{
            viewModel.username = sender.text
        }
        updateForm()
    }
}

extension RegisterationController:FormViewModel{
    func updateForm() {
        signupButton.isEnabled = viewModel.formIsValid
        signupButton.backgroundColor = viewModel.buttonBackgroundColor
        signupButton.setTitleColor(viewModel.buttonTextColor, for: .normal)
    }
}

extension RegisterationController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else{return}
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true,completion: nil)
    }
}
