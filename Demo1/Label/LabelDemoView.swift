//
//  LabelDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/5/10.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct LabelDemoView: View {
    var body: some View {
      ScrollViewReader { _ in
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center) {
            Group {
              if #available(iOS 14.5, *) {
                Label("Lightning1", systemImage: "bolt.fill")
                .labelStyle(.titleAndIcon)
                
                Label("Lightning2", systemImage: "bolt.fill")
                .labelStyle(.automatic)
                
                Label("Lightning3", systemImage: "bolt.fill")
                .labelStyle(.iconOnly)
                
                Label("Lightning3", systemImage: "bolt.fill")
                .labelStyle(.titleOnly)
                
                VStack {
                  Label("Rain", systemImage: "cloud.rain")
                  Label("Snow", systemImage: "snow")
                  Label("Sun", systemImage: "sun.max")
                }
                .labelStyle(.titleAndIcon)
              }
            }
            
            Group {
              
            }
            
              
          }
        }
      }
    }
}

struct LabelDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LabelDemoView()
    }
}
