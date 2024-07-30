//
//  ViewController.swift
//  FunnyStory
//
//  Created by Adam Chen on 2024/7/30.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var fatherNameTextField: UITextField!
    @IBOutlet weak var sportTextField: UITextField!
    @IBOutlet weak var drinkTextField: UITextField!
    @IBOutlet weak var lameJokeTextView: UITextView!
    let speaker = AVSpeechSynthesizer()
    
    //鍵盤收起來的指令
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Gif動畫
    func addGif(){
        let snowImageView = UIImageView(frame: CGRect(x: 110, y: 550, width: 200, height: 200))
        view.addSubview(snowImageView)
        var images = [UIImage]()
        for i in 0...4 {
            images.append(UIImage(named: "animated-snow-image-0061-\(i)")!)
        }
        snowImageView.animationImages = images
        snowImageView.animationDuration = 0.5
        snowImageView.animationRepeatCount = 35
        snowImageView.startAnimating()
        
    }
    
    //停止語音
    func stopSpeak() {
        speaker.stopSpeaking(at: .immediate)
    }

    @IBAction func speakLameJoke(_ sender: Any) {
        
        if nameTextField.text == ""{
            nameTextField.attributedPlaceholder = NSAttributedString(string: "請輸入主角的名稱", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        else if fatherNameTextField.text == ""{
            fatherNameTextField.attributedPlaceholder = NSAttributedString(string: "請輸入爸爸的名稱", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        else if sportTextField.text == ""{
            sportTextField.attributedPlaceholder = NSAttributedString(string: "請輸入做什麼運動", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        else if drinkTextField.text == ""{
            drinkTextField.attributedPlaceholder = NSAttributedString(string: "請輸入飲料", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        else{
            stopSpeak()
            let jokeText = "有一天兒子\(nameTextField.text!)和爸爸\(fatherNameTextField.text!)一起在公園\(sportTextField.text!)，結束後\(fatherNameTextField.text!)覺得很口渴，於是叫\(nameTextField.text!)去買\(drinkTextField.text!)給他喝，但\(nameTextField.text!)遲遲沒有去買，\(fatherNameTextField.text!)就生氣的說：『你是要逼爸渴死嗎？』，於是\(nameTextField.text!)就開始B-BOX了。"
            lameJokeTextView.text = jokeText
            
            //語音
            let utterance = AVSpeechUtterance(string: jokeText)
            utterance.volume = 0.5
            utterance.rate = 0.5
            utterance.pitchMultiplier = 1
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            speaker.speak(utterance)
            
            addGif()
        }
                
    }
    
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}

