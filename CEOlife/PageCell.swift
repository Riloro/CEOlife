//
//  PageCell.swift
//  CEOlife
//
//  Created by Alejandro on 22/04/18.
//  Copyright © 2018 Ricardo. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    var page : Page?{
        didSet{
           
            guard let unwrappenPage = page else { return}
            techImageView.image = UIImage(named: unwrappenPage.imageName)
            
            let atributedText = NSMutableAttributedString(string: unwrappenPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25)])
            
            atributedText.append(NSAttributedString(string: "\n\n\(unwrappenPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont(name: "SFProDisplay-Regular", size: 20)!, NSAttributedStringKey.foregroundColor: UIColor.gray]))

            descriptionTextView.attributedText = atributedText
            descriptionTextView.textAlignment = .center
        }
    }
    private let techImageView = { () -> UIImageView in
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tech"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView

    }()

   private let descriptionTextView: UITextView = {
        let textView = UITextView()
    
        let atributedText = NSMutableAttributedString(string: "StartUp de tecnología", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25)])

        atributedText.append(NSAttributedString(string: "\n\nFundarás una startUp que se enfocará en el desarrollo de hardware para el sistema electrónico de autos, aviones y helicópteros.", attributes: [NSAttributedStringKey.font: UIFont(name: "SFProDisplay-Regular", size: 20)!, NSAttributedStringKey.foregroundColor: UIColor.gray]))

        textView.attributedText = atributedText
        // textView.text = "StartUp de tecnología"
        // textView.font = UIFont(name: "SFProDisplay-Regular", size: 25)!
        // textView.font = UIFont.boldSystemFont(ofSize: 21)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView

    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .purple
        addSubview(techImageView)
        addSubview(descriptionTextView)
        setupLayout()
    }
    

    
    private func setupLayout(){
        
        techImageView.centerXAnchor.constraint(equalTo:
            centerXAnchor).isActive = true

        techImageView.topAnchor.constraint(equalTo: topAnchor, constant:100).isActive = true
        techImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        techImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true


        descriptionTextView.topAnchor.constraint(equalTo: techImageView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 23).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -23).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

    }
    
    required init?( coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
