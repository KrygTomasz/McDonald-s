//
//  QuestionViewController.swift
//  McDonald's
//
//  Created by Tomasz Kryg on 20.10.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

protocol PromotionDelegate: class {
    func showPromotion()
}

class QuestionViewController: UIViewController {

    @IBOutlet weak var yesButton: UIButton! {
        didSet {
            yesButton.addTarget(self, action: #selector(onYesButtonClicked), for: .touchUpInside)
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.addTarget(self, action: #selector(onCancelButtonClicked), for: .touchUpInside)
        }
    }
    
    weak var promotionDelegate: PromotionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    }
    
    @objc func onYesButtonClicked() {
        self.dismiss(animated: true, completion: {
            self.promotionDelegate?.showPromotion()
        })
    }
    
    @objc func onCancelButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }

}
