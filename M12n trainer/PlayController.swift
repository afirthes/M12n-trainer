//
//  PlayController.swift
//  M12n trainer
//
//  Created by Afir Thes on 06.11.2021.
//

import Foundation
import UIKit

class PlayController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
