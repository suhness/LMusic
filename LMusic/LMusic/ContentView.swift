//
//  ContentView.swift
//  LMusic
//
//  Created by liu on 2025/8/2.
//

import SwiftUI
import AVKit // 新增导入


struct ContentView: View {
    
    init() {
           configureAudioSession()
       }
    
    var body: some View {
        BottomBarView()
    }
    
    private func configureAudioSession() {
           do {
               try AVAudioSession.sharedInstance().setCategory(
                   .playback,
                   mode: .default
               )
               try AVAudioSession.sharedInstance().setActive(true)
           } catch {
               print("音频会话配置失败: \(error.localizedDescription)")
           }
       }
    
}

#Preview {
    ContentView()
}
