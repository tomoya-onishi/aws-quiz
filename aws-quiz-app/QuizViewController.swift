//
//  QuizViewController.swift
//  aws-quiz-app
//
//  Created by 大西智也 on 2020/12/29.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextVire: UITextView!
    @IBOutlet weak var answerBtn1: UIButton!
    @IBOutlet weak var answerBtn2: UIButton!
    @IBOutlet weak var answerBtn3: UIButton!
    @IBOutlet weak var answerBtn4: UIButton!
    
    var quizArray:Dictionary<Int, Array<String>> = [
        1:["機械学習用の効率を2倍にするサービスは？","0","Amazon SageMaker Neo","Amazon SageMaker nearest neighbor","Amazon SageMaker Ground Truth", "Amazon Rekognition"],
        2: ["機械学習用の効率を2倍にするサービスは？","0","Amazon SageMaker Neo","Amazon SageMaker nearest neighbor","Amazon SageMaker Ground Truth", "Amazon Rekognition"]
    ]
    var quizCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizNumberLabel.text = "第１問"
        quizTextVire.text = quizArray[quizCount][0]
        answerBtn1.setTitle(quizArray[2], for: .normal)
        answerBtn2.setTitle(quizArray[3], for: .normal)
        answerBtn3.setTitle(quizArray[4], for: .normal)
        answerBtn4.setTitle(quizArray[5], for: .normal)
    }
    
    @IBAction func btnAction(sender: UIButton){
        if sender.tag == Int(quizArray[1]){
            self.performSegue(withIdentifier: "success", sender: nil)
        }else{
            self.performSegue(withIdentifier: "failure", sender: nil)
        }
    }

}
