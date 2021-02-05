//
//  SuccessViewController.swift
//  aws-quiz-app
//
//  Created by 大西智也 on 2021/01/20.
//

import UIKit

class SuccessViewController: UIViewController ,UIGestureRecognizerDelegate{
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
    override func viewWillAppear(_ animated: Bool) {
        self.quizCount += 1
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended{
            self.performSegue(withIdentifier: "returnSuccess", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "returnSuccess" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? QuizViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.quizCount = self.quizCount
        }
    }
}
