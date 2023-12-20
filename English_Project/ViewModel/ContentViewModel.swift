//
//  ContentViewModel.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 19/12/23.
//

import SwiftUI
import AVFoundation

@Observable
class contentViewModel{
    
    var searchItem: String = ""
    var newItem: Bool = false
    var info: Bool = false
    var velocity: Float?
    var utterance = AVSpeechUtterance(string: "pop")
    let synthesizer = AVSpeechSynthesizer()
    
    init() {
        
    }
    
    func speak(_ t: String){
        utterance = .init(string: t)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = velocity ?? 0.1
        synthesizer.speak(utterance)
    }
}

