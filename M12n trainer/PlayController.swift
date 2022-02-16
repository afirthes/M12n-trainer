//
//  PlayController.swift
//  M12n trainer
//
//  Created by Afir Thes on 06.11.2021.
//

import Foundation
import UIKit

class PlayController: UIViewController {
    
    var game:Game!
    var questionIndex = 0
    var answered = false
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    @IBOutlet weak var xNumber: UILabel!
    @IBOutlet weak var yNumber: UILabel!
    
    private var timer: Timer?
    private var startDate = Date()

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
        
        updateQuestion()
        setupBackgroundTap()
    }
    
    func updateQuestion() {
        let question = game.questions[questionIndex]
        xNumber.text = question.x.description
        yNumber.text = question.y.description
        
        topLeftButton.setTitle(question.answers[0].value.description, for: .normal)
        topRightButton.setTitle(question.answers[1].value.description, for: .normal)
        bottomLeftButton.setTitle(question.answers[2].value.description, for: .normal)
        bottomRightButton.setTitle(question.answers[3].value.description, for: .normal)
        
        topLeftButton.backgroundColor = .clear
        topRightButton.backgroundColor = .clear
        bottomLeftButton.backgroundColor = .clear
        bottomRightButton.backgroundColor = .clear
    }
    
    @IBAction func didPressAnswerButton(_ sender: AnswerRoundButton) {
        guard !answered else { return }
        
        let question = game.questions[questionIndex]
        let answer = question.answers[sender.tag - 1]
        game.questions[questionIndex].answer = answer
        
        sender.backgroundColor = answer.isCorrect ? .green : .red
        
        answered = true
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTapped() {
        if answered {
            questionIndex += 1
            if questionIndex >= Game.QUESTIONS_IN_GAME {
                self.navigationController?.popToRootViewController(animated: true)
            }
            updateQuestion()
            answered = false
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    func timerAction() {
        let timeSpent = Date().timeIntervalSince(startDate)
        let sec = NSLocalizedString("sec", comment: "")
        timeLeftLabel.text = "\(Int(timeSpent)) \(sec)"
    }
    
    override func viewWillLayoutSubviews() {
        self.gradient.frame = self.view.bounds
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    @IBAction func stopGame(_ sender: Any) {
        performSegue(withIdentifier: "resultSeque", sender: self)
        //self.navigationController?.popToRootViewController(animated: true)
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
