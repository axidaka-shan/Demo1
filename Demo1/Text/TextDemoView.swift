//
//  TextDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/27.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

/**
 
 在SwiftUI中，任何View都可以用这个.fixedSize(horizontal: true, vertical: false)，当我们应用了该modifier后，布局系统在返回size的时候，就会返回与之对应的idealWIdth或者idealHeight。
 
 */

/**
 在SwiftUI中，.alignmentGuide(.trailing, computeValue: { _ in 0 })是一个视图修饰符，用于指定视图的对齐方式。在这种情况下，它将视图的右侧对齐到父视图的右侧，并将其偏移量设置为0。这意味着该视图将紧贴着其父视图的右侧边缘。
 */

struct TextDemoView: View {
    var body: some View {
      VStack {
        
        Group {
          // 布局的时候，是自下而上的。
          Text("Hello, World!")
                      .frame(width: 350, height: 100)
                      .background(Color.green)
                      .frame(width: 300, height: 200)
                      .background(Color.orange.opacity(0.5))
        }
        
        VStack {
          Text("Hello, World!nadasdsadadasdadadasda\ndadadaszczcvzvzxv")
            .lineLimit(1)
            .frame(width: 100)
            .font(.title)

          Spacer().frame(height: 20)

          Text("这个文本还挺长的，到达了一定字数后，就超过了一行的显示范围了！！！")
            .border(Color.blue)
            .frame(width: 200, height: 100)
            .border(Color.green)
            .font(.title)

          Spacer().frame(height: 20)
          
          Text("这个文本还挺长的，到达了一定字数后，就超过了一行的显示范围了！！！")
            .fixedSize(horizontal: true, vertical: false)
            .border(Color.blue)
            .frame(width: 200, height: 100)
            .border(Color.green)
            .font(.title)
          
          Spacer().frame(height: 20)
          
          Text("这个文本还挺长的，到达了一定字数后，就超过了一行的显示范围了！！！")
            .frame(idealWidth: 300)
            .fixedSize(horizontal: true, vertical: false)
            .border(Color.blue)
            .frame(width: 200, height: 100)
            .border(Color.green)
            .font(.title)
        
        }
        .frame(width: 200)
        .background(Color.gray)
        
        Spacer().frame(height: 20)

        HStack {
          
          Text("Left")
            .font(.caption)
          
          Spacer()
          
          Text("Right")
          .alignmentGuide(.trailing, computeValue: { _ in 0 })
        }
        
        Group {
          Spacer()
          
          ScrollView(.horizontal, showsIndicators: false) {
              Text("这是一段很长的文本，当文本内容超出屏幕宽度时，可以左右滑动。")
                  .font(.headline)
                  .padding()
          }
          
          Spacer()
        }
        
      }
    }
}

struct TextDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TextDemoView()
    }
}
