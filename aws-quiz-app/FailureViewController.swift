//
//  ReturnResultViewController.swift
//  aws-quiz-app
//
//  Created by 大西智也 on 2021/01/05.
//

import UIKit

class FailureViewController: UIViewController ,UIGestureRecognizerDelegate{
    var quizCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.tapped(_:)))
        
        // デリゲートをセット
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended{
            self.performSegue(withIdentifier: "return", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "return" {
            let next = segue.destination as? QuizViewController
            next?.quizCount = self.quizCount
        }
    }

}
