//
//  ResultViewController.swift
//  M12n trainer
//
//  Created by CHUKANOV Sergey on 16.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animationView: CustomizableAnimation!
    
    private var gradient: CAGradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.colors = [
            UIColor(named: "backgroundGradientTop")!.cgColor,
            //UIColor(named: "backgroundGradientTop")!.cgColor
            UIColor(named: "backgroundGradientBottom")!.cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        self.animationView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startAnim)))
        self.view.isUserInteractionEnabled = true
        
    }
    
    @objc
    func startAnim() {
        animationView.startAnimation()
    }
    
    @IBAction func pressedOk(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        self.gradient.frame = self.view.bounds
    }

}
