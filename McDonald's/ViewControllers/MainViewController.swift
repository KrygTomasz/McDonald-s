//
//  MainViewController.swift
//  McDonald's
//
//  Created by Tomasz Kryg on 20.10.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var promotionButton: UIButton! {
        didSet {
            promotionButton.addTarget(self, action: #selector(onPromotionButtonClicked), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    @objc func onPromotionButtonClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let questionVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController else {
            return
        }
        questionVC.modalTransitionStyle = .crossDissolve
        questionVC.promotionDelegate = self
        self.present(questionVC, animated: true)
    }

}

extension MainViewController: PromotionDelegate {
    
    func showPromotion() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let promotionVC = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(promotionVC, animated: true)
    }
    
}
