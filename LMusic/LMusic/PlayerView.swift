//
//  PlayerView.swift
//  LMusic
//
//  Created by liu on 2025/8/16.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var playerService = AudioPlayerService()   //音频数据服务类
    @State private var showFilePicker = false               //是否显示文件

    
    
    var body: some View {
        VStack{
            Button(action: {
                playerService.toggle()  //播放暂停
            }){
                Image(systemName:playerService.isPlaying ? "pause.circle":"play.circle")
                    .font(.system(size: 60))
            }
            .padding()
            // 文件选择按钮
            Button("选择音频文件") {
                showFilePicker = true
            }
            // 显示当前文件名（可选）
        }
        .padding()
                .sheet(isPresented: $showFilePicker) {
                    DocumentPicker { url in
                        playerService.initPlayer(audioURL: url) // 选择文件后加载
                    }
                }
    }
}

struct DocumentPicker:UIViewControllerRepresentable{
    var onPick: (URL) -> Void
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(
            forOpeningContentTypes: [.audio],
            asCopy: true
        )
        picker.delegate = context.coordinator
        return picker
        
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onPick: onPick)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var onPick: (URL) -> Void
        
        init(onPick: @escaping (URL) -> Void) {
            self.onPick = onPick
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            onPick(url)
        }
    }
}



#Preview {
    PlayerView()
}
