//
//  SwippingController.swift
//  APIIntegration
//
//  Created by Nitin Bhatt on 8/5/22.
//

import UIKit


class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "logo_round", title: "Join us for some fun and games!", description: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "logo", title: "Get Premium Benefits, Subscriptions & Cashback offers", description: "Online discounts are one of the most effective ways to save some bucks on your shopping bills. And you can easily get discounts with a varsity of coupons"),
        Page(imageName: "logo_balloon", title: "VIP Perks and Exclusive Benefits in Rewards ...", description: "If you buy our VIP membership for a year, you will not only have discounts on our products, but you will also be eligible for special benefits and offers."),
    ]
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(handleNextButtonClick), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNextButtonClick(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        if nextIndex  > (pages.count - 1){
            let controller = LoginViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }else{
            pageControl.currentPage = nextIndex
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(handlePrevButtonClick), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevButtonClick(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let pageControl:UIPageControl = {
        let pagecontrol = UIPageControl()
        pagecontrol.currentPage = 0
        pagecontrol.numberOfPages = 3
        pagecontrol.currentPageIndicatorTintColor = .red
        pagecontrol.pageIndicatorTintColor = .gray
        return pagecontrol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        // Register cell classes
        collectionView?.backgroundColor = .white
        collectionView?.register(PageViewCell.self, forCellWithReuseIdentifier: PageViewCell.identifier)
        collectionView?.isPagingEnabled = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    func createStackView(){
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        self.view.addSubview(bottomControlStackView)

        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SwippingController{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageViewCell.identifier, for: indexPath) as? PageViewCell else{
            fatalError("Cell not loaded")
        }
        cell.page = pages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
