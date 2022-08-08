//
//  PageViewCell.swift
//  APIIntegration
//
//  Created by Nitin Bhatt on 8/5/22.
//

import Foundation
import UIKit

class PageViewCell:UICollectionViewCell{
    
    class var identifier:String{return String(describing: self)}
    
    private let logoImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
        
    var page:Page?{
        didSet{
            guard let unwrappedPage = page else { return }
            logoImageView.image = UIImage(named: unwrappedPage.imageName ?? "")
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.title ?? "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n \(unwrappedPage.description ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))

            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupLayout() {
        let imageContainerView = UIView()
        addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.5).isActive = true
        
        imageContainerView.addSubview(logoImageView)
        
        logoImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor,multiplier: 0.5).isActive = true
         
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -80).isActive = true
    }    
}
