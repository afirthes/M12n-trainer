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
    @IBOutlet weak var author: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgroundGradient()
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        updateQuote()
    }
    
    func updateQuote() {
        let quote:Quoter.Quote = Quoter.shared.random()
        setMainQuoteText(quote.text)
        self.author.text = quote.author
        self.mainQuote.layer.masksToBounds = false
    }
    
    func updateBackgroundGradient() {
        gradient.colors = [
            UIColor(named: "backgroundGradientTop")!.cgColor,
            UIColor(named: "backgroundGradientBottom")!.cgColor
        ]
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateBackgroundGradient()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegue" {
            if let destinationVC = segue.destination as? PlayController {
                destinationVC.game = Game()
            }
        }
    }
}

