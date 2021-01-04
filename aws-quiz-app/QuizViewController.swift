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
    @IBOutlet weak var isSuccess: UIImageView!
    
    var quizArray:[String] = ["機械学習用の効率を2倍にするサービスは？","0","Amazon SageMaker Neo","Amazon SageMaker nearest neighbor","Amazon SageMaker Ground Truth", "Amazon Rekognition"]
    var quizCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizNumberLabel.text = "第１問"
        quizTextVire.text = quizArray[0]
        answerBtn1.setTitle(quizArray[2], for: .normal)
        answerBtn2.setTitle(quizArray[3], for: .normal)
        answerBtn3.setTitle(quizArray[4], for: .normal)
        answerBtn4.setTitle(quizArray[5], for: .normal)
    }
    
    @IBAction func btnAction(sender: UIButton){
        if sender.tag == Int(quizArray[1]){
            self.isSuccess.isHidden = false
            isSuccess.image = UIImage(named: "success")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.isSuccess.isHidden = true
            }
            print("正解")
        }else{
            self.isSuccess.isHidden = false
            isSuccess.image = UIImage(named: "failure")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.isSuccess.isHidden = true
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
