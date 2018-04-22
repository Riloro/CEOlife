//
//  Catalogo.swift
//  CEOlife
//
//  Created by Alejandro on 21/04/18.
//  Copyright © 2018 Ricardo. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    
}

class Catalogo: UIViewController {
    
    
    let techImageView = { () -> UIImageView in
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tech"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let descriptionTextView: UITextView = {
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
    
    /*let parrafoTextView: UITextView = {
        let parrafo = UITextView()
        parrafo.text = "Fundarás una startUp que se enfocará en el desarrollo de hardware para el sistema electrónico de autos, aviones y helicópteros."
        parrafo.font = UIFont(name: "SFProDisplay-Regular", size: 20)!
        //parrafo.font = UIFont.boldSystemFont(ofSize: 14)
        parrafo.translatesAutoresizingMaskIntoConstraints = false
        parrafo.textColor = UIColor.gray
        parrafo.textAlignment = .center
        parrafo.isEditable = false
        parrafo.isScrollEnabled = false
        return parrafo
        
    }()*/
    private let previusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Anterior", for: .normal)
       // let orange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
      //  button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let NextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Siguiente", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let orange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
       button.setTitleColor(orange, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .mainOrange
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(techImageView)
        view.addSubview(descriptionTextView)
       // view.addSubview(parrafoTextView)
        setupLayout()
        setupBottonControls()
    
    }
    
    fileprivate func setupBottonControls(){
        
      //  view.addSubview(previusButton)
       // previusButton.backgroundColor = .red
       // previusButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        //let yellowView = UIView()
       // yellowView.backgroundColor = .yellow
       // let blueView = UIView()
      //  blueView.backgroundColor = .blue
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previusButton,pageControl,NextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
           //  previusButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
       
    
    }
    private func setupLayout(){
        techImageView.centerXAnchor.constraint(equalTo:
            view.centerXAnchor).isActive = true
        
        techImageView.topAnchor.constraint(equalTo: view.topAnchor, constant:100).isActive = true
        techImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        techImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: techImageView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //Parrafo
//        parrafoTextView.topAnchor.constraint(equalTo: techImageView.bottomAnchor, constant: 100).isActive = true
//        parrafoTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
//        parrafoTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
//        parrafoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
  

    
}
