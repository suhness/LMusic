//
//  AudioPlayerService.swift
//  LMusic
//
//  Created by liu on 2025/8/16.
//

import AVFoundation

class AudioPlayerService:ObservableObject{
    @Published var isPlaying = false
    private var audioPlayer:AVAudioPlayer?
    
    //初始化播放器
    func initPlayer(audioURL:URL) ->(Void){
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.prepareToPlay()
        } catch{
            print("播放器初始化失败: \(error.localizedDescription)")
        }
        
    }
    //播放 暂停
    func toggle(){
        guard let player = audioPlayer else {return}
        
        if player.isPlaying{
            player.pause()
            isPlaying = false
        }else{
            player.play()
            isPlaying = true
        }
    }
    
    //停止并释放资源
    func stop(){
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }
    
    //播放本地文件
    func playLocalFile(name:String){
        guard let path = Bundle.main.path(forResource: name, ofType: nil) else {
             print("找不到音频文件")
             return
         }
        initPlayer(audioURL: URL(fileURLWithPath: path))

    }
}


