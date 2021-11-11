//
//  PlayController.swift
//  M12n trainer
//
//  Created by Afir Thes on 06.11.2021.
//

import Foundation
import UIKit

class PlayController: UIViewController {
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    private var gradient: CAGradientLayer = CAGradientLayer()
    @IBOutlet weak var questionTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var closeButton: UIButton!
    
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
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        let cornerGap = round((screenWidth - 200) / 3)
        let middleGap = (screenWidth - 200) - (cornerGap * 2)
        
        
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: cornerGap),
            bottomLeftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -cornerGap),
            bottomLeftButton.widthAnchor.constraint(equalToConstant: 100),
            bottomLeftButton.heightAnchor.constraint(equalToConstant: 100),
            
            bottomRightButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -cornerGap),
            bottomRightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -cornerGap),
            bottomRightButton.widthAnchor.constraint(equalToConstant: 100),
            bottomRightButton.heightAnchor.constraint(equalToConstant: 100),
            
            topLeftButton.bottomAnchor.constraint(equalTo: bottomLeftButton.topAnchor, constant: -cornerGap),
            topLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: cornerGap),
            topLeftButton.widthAnchor.constraint(equalToConstant: 100),
            topLeftButton.heightAnchor.constraint(equalToConstant: 100),
            
            topRightButton.bottomAnchor.constraint(equalTo: bottomRightButton.topAnchor, constant: -cornerGap),
            topRightButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -cornerGap),
            topRightButton.widthAnchor.constraint(equalToConstant: 100),
            topRightButton.heightAnchor.constraint(equalToConstant: 100)
            
            
        ])
        
        
        questionTopConstraint.constant = (screenHeight - cornerGap * 2 - 200) / 2
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        self.gradient.frame = self.view.bounds
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    @IBAction func stopGame(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    
}
