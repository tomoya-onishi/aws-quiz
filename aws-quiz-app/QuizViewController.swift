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
        2: ["二問目","2","Amazon SageMaker Neo","Amazon SageMaker nearest neighbor","Amazon SageMaker Ground Truth", "Amazon Rekognition"]
    ]
    var quizCount = 1

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let quiz = quizArray[quizCount]{
            quizNumberLabel.text = "第" + String(quizCount) + "問"
            quizTextVire.text = quiz[0]
            answerBtn1.setTitle(quiz[2], for: .normal)
            answerBtn2.setTitle(quiz[3], for: .normal)
            answerBtn3.setTitle(quiz[4], for: .normal)
            answerBtn4.setTitle(quiz[5], for: .normal)
        }
    }
    @IBAction func btnAction(sender: UIButton){
        dump(quizArray[quizCount])
        if let quiz = quizArray[quizCount]{
            if sender.tag == Int(quiz[1]){
                self.performSegue(withIdentifier: "success", sender: nil)
            }else{
                self.performSegue(withIdentifier: "failure", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "success" {
            let successView = segue.destination as! SuccessViewController
            //SecondViewでtextを宣言する必要あり
            successView.quizCount = quizCount
        }else if segue.identifier == "failure" {
            let failureView = segue.destination as! FailureViewController
            failureView.quizCount = quizCount
        }
    }
}
