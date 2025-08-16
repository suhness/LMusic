//
//  BottomBarView.swift
//  LMusic
//
//  Created by liu on 2025/8/4.
//

import SwiftUI

struct BottomBarView: View {
    @State private var selectedTab = 0
    @State private var isRotating = false
    @State private var showSheet = false
    
    init() {
        UITabBar.appearance().isHidden = true       //隐藏系统tabbar
    }
    
    var body: some View {
        ZStack(alignment:.bottom){
            TabView(selection: $selectedTab){
                HomeView()
                    .tag(0)
                Text("")
                    .tag(1)
                MyView()
                    .tag(2)
            }
        }
        HStack{
            TabButton(
                icon: "house",
                label: "首页",
                isSelected: selectedTab == 0,
            ){ //action为最后一个参数时可省略 可直接在{}中写函数
                selectedTab = 0
            }
            
            
            Button(
                action: {
                    print("点击了中间的按钮")
                    showSheet = true
                }
            ){
                ZStack {
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60)
                        .rotationEffect(
                            Angle(degrees: isRotating ? 360 : 0),
                            anchor: .center // 明确指定以视图自身中心旋转
                            
                        )
                }
                .offset(y: -20) // 上浮效果
                .onAppear(){
                    withAnimation(
                        .linear(duration: 10.0)     //线性动画时间
                            .repeatForever(autoreverses: false)
                    ){
                        isRotating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSheet) {
                VStack{
                    PlayerView()
                        .navigationTitle("音乐播放器")
                        .padding()
                    Button("关闭"){
                        showSheet = false
                    }
                }
            }
           
            TabButton(
                icon: "person.crop.circle",
                label: "我的",
                isSelected: selectedTab == 0,
            ){ //action为最后一个参数时可省略 可直接在{}中写函数
                selectedTab = 2
            }
        }
    }
}

//自定义tab按键组件
struct TabButton:View {
    let icon:String
    let label:String
    let isSelected:Bool
    let action:() -> Void
    
    var body: some View {
        Button(action:action){
            VStack{
                Image(systemName: isSelected ?  "\(icon).fill" :icon)
                    .font(.system(size: 22))
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(isSelected ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    BottomBarView()
}
