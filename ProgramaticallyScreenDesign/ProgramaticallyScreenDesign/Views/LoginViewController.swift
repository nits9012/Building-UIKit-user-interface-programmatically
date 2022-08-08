//
//  LoginViewController.swift
//  APIIntegration
//
//  Created by Nitin Bhatt on 8/6/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let contentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionTextView:UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Welcome back", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n Please enter your email and password.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))

        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let logoImage:UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "logo_round"))
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Enter you email "
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        return textField
    }()
    
    private let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = " Enter your password "
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        return textField
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setScrollView()
        self.setImageViewAndTextView()
        self.setButtonAndTextField()
    }
    
    func setScrollView(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)

        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
       
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setImageViewAndTextView(){
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(imageContainerView)
        imageContainerView.addSubview(logoImage)

        imageContainerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        imageContainerView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor).isActive = true
        imageContainerView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.4).isActive = true
        
        logoImage.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalTo: contentView.heightAnchor ,multiplier: 0.4).isActive = true
        
        self.scrollView.addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor,constant: 25).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,constant: -25).isActive = true
    }
    
    func setButtonAndTextField(){
        let textFieldContainerView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField])
        textFieldContainerView.translatesAutoresizingMaskIntoConstraints = false
        textFieldContainerView.distribution = .fillEqually
        textFieldContainerView.axis = .vertical
        textFieldContainerView.spacing = 20
        self.scrollView.addSubview(textFieldContainerView)
        
        textFieldContainerView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor,constant: 20).isActive = true
        textFieldContainerView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor,constant: 25).isActive = true
        textFieldContainerView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,constant: -25).isActive = true
        textFieldContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.scrollView.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: textFieldContainerView.bottomAnchor,constant: 40).isActive = true
        loginButton.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor,constant: 25).isActive = true
        loginButton.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,constant: -25).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
