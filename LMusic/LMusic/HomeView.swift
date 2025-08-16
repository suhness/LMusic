//
//  Home.swift
//  LMusic
//
//  Created by liu on 2025/8/16.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isRotating = false

    
    var body: some View {
        VStack {
            Text("首页")
                .background(){       //作为背景
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(.red)
                        .font(.system(size: 30))
                }
                .padding()
//            Image("1")
//                .resizable()
//                .scaledToFit()       //比例适应容器
//                .frame(width: 400)   //设置长宽
//                .clipShape(Circle()) //圆形裁剪
//                .overlay(Circle().stroke(Color.red,lineWidth: 3)) //添加边框
//                .clipped()          //防止超出边界
//                .rotationEffect(Angle(degrees: isRotating ? 360 : 0)) //旋转角度45度
//
//                .onAppear(){
//                    withAnimation(      //动画效果
//                        .linear(duration: 10.0)     //线性动画时间
//                        .repeatForever(autoreverses: false) 
//                    ) {
//                        isRotating = true
//                    }
//                }
                

        }
    }
}

#Preview {
    HomeView()
}
