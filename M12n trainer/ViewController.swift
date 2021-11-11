//
//  ViewController.swift
//  M12n trainer
//
//  Created by Afir Thes on 05.11.2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var mainQuote: UILabel!
    private var gradient: CAGradientLayer = CAGradientLayer()
    private var kern = 1.0;

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
        
        setMainQuoteText("""
            Counting and computing is the basis of order in your head
            """)
        self.mainQuote.layer.masksToBounds = false
    }
    
    override func viewWillLayoutSubviews() {
        self.gradient.frame = self.view.bounds
        self.mainQuote.sizeToFit()
        
        // Попытка побороть обрезание загагулин выступающих за UILabel ==> Безуспешно
        self.mainQuote.frame = CGRect(
            x: self.mainQuote.frame.maxX,
            y: self.mainQuote.frame.maxY,
            width: self.view.bounds.width,
            height: self.mainQuote.frame.height + 100
        )
    }
    
    fileprivate func setMainQuoteText(_ text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let textAttr = NSAttributedString(string: text, attributes: [
            .font: UIFont(name: "SavoyeLetPlain", size: 28)!,
            .foregroundColor: UIColor.white,
            .kern: 1.2,
            .paragraphStyle: paragraphStyle
        ])
        self.mainQuote.attributedText = textAttr
    }


    @IBAction func startToPlay(_ sender: UIButton) {
        performSegue(withIdentifier: "playSegue", sender: self)
    }
}

