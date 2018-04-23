//
//  swipingController.swift
//  CEOlife
//
//  Created by Alejandro on 22/04/18.
//  Copyright © 2018 Ricardo. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let pages = [
        Page(imageName: "procesador", headerText: "StartUp de tecnología", bodyText: "Fundarás una startUp que se enfocará en el desarrollo de hardware para el sistema electrónico de autos, aviones y helicópteros.")
        ,Page(imageName: "panel", headerText: "StartUp de tecnología", bodyText: "Fundarás una startUp que se enfocará en el desarrollo de metodos limpios para la generacoón de energía eléctrica."),
         Page(imageName: "app", headerText: "StartUp de tecnología", bodyText: "Fundarás una startUp que se enfocará en el desarrollo de aplicaciones móviles para resolver las necesidades de ciertas empresas por medio de la tecnología." ),
         Page(imageName: "robot", headerText: "StartUp de tecnología", bodyText: "Fundarás una startUp que se enfocará en el desarrollo de robots industriales para acercar  las empresas a la industria 4.0")
    ]
    
    private let selectionButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("¡Comenzar!", for: .normal)
//        let xPostion:CGFloat = 50
//        let yPostion:CGFloat = 100
//        let buttonWidth:CGFloat = 150
//        let buttonHeight:CGFloat = 45
//
//        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleContinuar), for: .touchUpInside)
        
        //  button.setTitleColor(.gray, for: .normal)
        return button
        
        
    }()
   
    
    @objc private func handleContinuar (){
        print("Presionando Continuar")
         appDelegate?.window?.removeFromSuperview()
        let viewController: UIViewController = UIStoryboard(
            name: "Main", bundle: nil
            ).instantiateViewController(withIdentifier: "Equipo") as! Equipo
        // .instantiatViewControllerWithIdentifier() returns AnyObject!
        // this must be downcast to utilize it
        
        self.present(viewController, animated: false, completion: nil)
        
       
       
       
    }
    
    
    private let previusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Anterior", for: .normal)
        // let orange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        //  button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    @objc private func handlePrev (){
        print("Presionando Siguiente")
        let nextIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    private let NextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Siguiente", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let orange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        button.setTitleColor(orange, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext (){
        print("Presionando Siguiente")
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1 )
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .mainOrange
        return pc
    }()
    
    fileprivate func setupBottonControls(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previusButton,pageControl,NextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
    }
    
    fileprivate func setUpSelectionButton(){
        
      //  selectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectionButton)
   
        selectionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
        selectionButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        selectionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        selectionButton.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -50).isActive = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
        print(x,view.frame.width, x/view.frame.width)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupBottonControls()
        setUpSelectionButton()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        
//        let page = pages[indexPath.item]
//        cell.techImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//        cell.techImageView.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    
}
