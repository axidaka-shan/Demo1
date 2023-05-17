//
//  MoreViewTV2.swift
//  Demo1_tvOS
//
//  Created by axidaka on 2023/5/5.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct MoreViewTV2: View {
    var body: some View {
      List {
          ForEach(0..<10) { index in
            SectionItem()

            Button {
              
            } label: {
              ListItem()
                .focusable(true) { _ in
                }
            }
            

               
          }
      }

    }
}

struct SectionItem: View {
    var body: some View {
        HStack {
            Text("SectionItem")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 80)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(Color.clear)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}
