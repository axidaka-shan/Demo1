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

          ForEach(0..<20) { index in

            if index == 0 || index == 2 || index == 4 {
              SectionItem()
                .focusable(false)
            } else {
//              Button {
//
//              } label: {
//                ListItem2()
//              }
              ListItemButton {
                
              }

            }

          }
      }
     
    }
}

struct SectionItem: View {
  @FocusState var isFocused

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
        .focusable()
        .focused($isFocused, equals: true)
        .onChange(of: isFocused) { newValue in
          isFocused = newValue
            if newValue {
                // Do something when focused
            } else {
                // Do something when unfocused
            }
        }
    }
}

struct ListItem2: View {
  @FocusState var isFocused

    var body: some View {
        HStack {
            Text("Title")
            .foregroundColor(isFocused ? Color.black : Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
          Spacer()

            Image(systemName: "chevron.right")
                .frame(width: 80, height: 80)
        }
        .frame(height: 80)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(isFocused ? Color.white : Color.clear)
        .cornerRadius(40)
        .shadow(color: .gray, radius: 5)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .focusable()
        .focused($isFocused, equals: true)
        .onChange(of: isFocused) { newValue in
          isFocused = newValue
            if newValue {
                // Do something when focused
            } else {
                // Do something when unfocused
            }
        }
    }
}

struct ListItemButton: View {
  
 var action: () -> Void
  
  @FocusState var isFocused

    var body: some View {
      Button {
        
      } label: {
        HStack {
            Text("Title")
            .foregroundColor(isFocused ? Color.black : Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
          Spacer()

            Image(systemName: "chevron.right")
                .frame(width: 80, height: 80)
        }
        .frame(height: 80)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(isFocused ? Color.white : Color.clear)
        .cornerRadius(40)
        .shadow(color: .gray, radius: 5)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
      }
//        .focused($isFocused, equals: true)
        .focused($isFocused)
        .onChange(of: isFocused) { newValue in
          isFocused = newValue
            if newValue {
                // Do something when focused
            } else {
                // Do something when unfocused
            }
        }
    }
}

struct MyView: View {
    @State private var isFocused = false
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .foregroundColor(isFocused ? Color.white : Color.black)
            .background(isFocused ? Color.red : Color.white)
            .focusable(true) { isFocused = $0 }
    }
}

struct NewMyView: View {
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Text("Hello, World!")
          .padding()
          .foregroundColor(isFocused ? Color.white : Color.black)
          .background(isFocused ? Color.red : Color.white)
          .focusable()
          .focused($isFocused, equals: true)
          .onChange(of: isFocused) { newValue in
            isFocused = newValue
              if newValue {
                  // Do something when focused
              } else {
                  // Do something when unfocused
              }
          }
    }
}
