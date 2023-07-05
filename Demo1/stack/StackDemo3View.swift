//
//  StackDemo3View.swift
//  Demo1
//
//  Created by visit on 2023/5/23.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct StackDemo3View: View {
  let itemArray = ["11111", "222", "3333", "444", "5555", "6666", "77", "88", "999", "123", "234", "456"]
    var body: some View {
      VStack {
        Spacer()
        getStepView(stepNum: 1, title: "step1")
        Spacer().frame(height: 50)
        getPageControll(stepNum: 2, total: 4)
        Spacer()

      }
      .background(Color.black)
      .padding()
      
    }
  
  func getStepView(stepNum: NSInteger, title: String) -> some View {
    
    VStack {
      HStack {
        ForEach(1..<4) { index in
          Image(index == stepNum ? "step\(index)_sel" : "step\(index)")
            .resizable()
            .scaledToFit()
            .frame(width: index == stepNum ? 30 : 24, height: index == stepNum ? 30 : 24)
          
          if index < 3 {
            Color.gray
              .frame(height: 1.0)
              .frame(minWidth: 20)
          }
        }
      }
      Text(title)
        .foregroundColor(.white)
    }
  }
  
  func getPageControll(stepNum: NSInteger, total: NSInteger) -> some View {
    
    HStack {
      ForEach(0..<total, id: \.self) { index in
        
        if stepNum == index {
          Circle()
            .foregroundColor(.white)
            .frame(width: 8, height: 8)
            .overlay(Circle().stroke(.red, lineWidth: 3))

        } else {
          Circle()
            .foregroundColor(.white)
            .frame(width: 8, height: 8)
        }
        if index < total-1 {
          Spacer().frame(width: 5)
        }
      }
    }
  }
}

struct StackDemo3View_Previews: PreviewProvider {
    static var previews: some View {
        StackDemo3View()
    }
}
