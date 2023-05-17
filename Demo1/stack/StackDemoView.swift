//
//  StackDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/15.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct StackDemoView: View {
    var body: some View {
      //包括leading、trailing、center
      VStack(alignment:.leading, spacing: 20){
        if #available(iOS 15.0, *) {
          Text("orange")
            .background(.orange)
            .font(.caption)
          Text("red").background(.red).font(.title)
          Text("blue").background(.blue).font(.largeTitle)
          Text("yellow").background(.yellow).font(.callout)
        } else {
          // Fallback on earlier versions
        }
          
      }
      .border(.gray)
      //包括bottom、top、firstTextBaseline、lastTextBaseline、center、
      HStack(alignment:.firstTextBaseline, spacing: 20){
        if #available(iOS 15.0, *) {
          Text("orange").background(.orange).font(.caption)
          Text("red").background(.red).font(.title)
//          Text("blue").background(.blue).font(.largeTitle)
//          Text("yellow").background(.yellow).font(.callout)
        }
          
      }
      .border(.gray)
      //包括leading、trailing、bottom、top、bottomLeading、topLeading、bottomtrailing、toptrailing、center
      ZStack(alignment: .bottomTrailing){
        if #available(iOS 15.0, *) {
          Text("orange").background(.orange).font(.caption)
          Text("red").background(.red).font(.title)
          Text("blue").background(.blue).font(.largeTitle)
          Text("yellow").background(.yellow).font(.callout)
        }
          
      }
      .border(.gray)
  }
}

struct StackDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StackDemoView()
    }
}
