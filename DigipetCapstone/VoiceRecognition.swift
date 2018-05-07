//
//  VoiceRecognition.swift
//  DigipetCapstone
//
//  Created by Katie Katz on 5/7/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit
import Speech

class VoiceRecognition: UIViewController, SFSpeechRecognizerDelegate {
    let audioEngine = AVAudioEngine()
    var speechRecognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    
    @IBOutlet weak var detectedTextLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func frenchPress(_ sender: Any) {
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "fr_FR"))
    }
    @IBAction func spanishPress(_ sender: Any) {
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko_KR"))
    }
    @IBAction func mandarinPress(_ sender: Any) {
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier:   "zh_Hans"))
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isRecording == true {
            request.endAudio()
            request = SFSpeechAudioBufferRecognitionRequest()
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            isRecording = false
            startButton.setTitle("Talk!", for: .normal)
        } else {
            self.recordAndRecognizeSpeech()
            isRecording = true
            startButton.setTitle("Stop!", for: .normal)
        }
    }
    
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
                    let best = result.bestTranscription.formattedString
                    print(best)
                    print("hewwo!")
                    self.detectedTextLabel.text = best
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
                    self.startButton.isEnabled = true
                case .denied:
                    self.startButton.isEnabled = false
                    self.detectedTextLabel.text = "User denied access"
                case .restricted:
                    self.startButton.isEnabled = false
                    self.detectedTextLabel.text = "Speech recognition restricted"
                case .notDetermined:
                    self.startButton.isEnabled = false
                    self.detectedTextLabel.text = "Speech recognition not yet authorized"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestSpeechAuthorization()
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

