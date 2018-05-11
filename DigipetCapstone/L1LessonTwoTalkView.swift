//
//  L1LessonOneTalkView.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 5/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Speech
import UIKit
import SpriteKit
import GameplayKit

class L1LessonTwoTalkView : UIViewController, SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myView: SKView!
    @IBOutlet weak var talkButton: UIButton!
    
    let audioEngine = AVAudioEngine()
    var speechRecognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    
    //var detectedText : String = ""
    
    func recordAndRecognizeSpeech() {
        guard let node = audioEngine.inputNode as Optional else { return }
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 2048, format: recordingFormat) {buffer, _ in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            sleep(1)
            try audioEngine.start()
        } catch {
            return print(error)
        }
        
        guard let myRecognizer = SFSpeechRecognizer() else {
            return
        }
        if !myRecognizer.isAvailable {
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if result != nil {
                if let result = result {
                    let best = result.bestTranscription.formattedString.lowercased()
                    print(best)
                    print("hewwo!")
                    //self.detectedText = best
                    self.textField.text = best
                }
            } else if let error = error {
                print(error)
            }
        })
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.talkButton.isEnabled = true
                case .denied:
                    self.talkButton.isEnabled = false
                    print("Error!")
                    print("User denied access")
                case .restricted:
                    self.talkButton.isEnabled = false
                    print("Error!")
                    print("Speech recognition restricted")
                case .notDetermined:
                    self.talkButton.isEnabled = false
                    print("Error!")
                    print("Speech recognition not yet authorized")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en"))
        textField.isUserInteractionEnabled = false
        //myView.presentScene(myScene)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.searchBar.endEditing(true)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if isRecording == true {
            request.endAudio()
            request = SFSpeechAudioBufferRecognitionRequest()
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            isRecording = false
            (myView.scene as! L1LessonTwo).checkAnswer(answer: textField.text!)
        } else {
            self.recordAndRecognizeSpeech()
            isRecording = true
        }
    }
    
    func revealButton() {
        talkButton.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

