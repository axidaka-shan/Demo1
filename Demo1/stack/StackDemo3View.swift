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
        Text("0000")
        Text("1111")
        Text("2222")
        Text("333")
        Text("44444")
        Text("5555")
        Text("6666")
        Text("7777")
        Text("8888")

        HStack {
          ForEach(itemArray, id: \.self) { item in
            Text(item)

          }
//          Text("0000")
//          Text("1111")
//          Text("2222")
//          Text("333")
//          Text("44444")
//          Text("5555")
//          Text("6666")
//          Text("7777")
//          Text("8888")
//          Text("9999")


        }
        
      }
    }
}

struct StackDemo3View_Previews: PreviewProvider {
    static var previews: some View {
        StackDemo3View()
    }
}
