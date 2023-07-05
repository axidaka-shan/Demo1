//
//  FocusDemoView.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/7/3.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FocusDemoView: View {
  @Namespace var mainNamespace
  @Environment(\.resetFocus) var resetFocus
  
  @State private var selectedSection = SelectedSection.sec_1
  
  enum SelectedSection {
    case sec_1
    case sec_2
    case sec_3
  }
  
  var body: some View {
      VStack(alignment: .leading) {

          Text("Section 1")

          Group(){
              ScrollView(.horizontal) {
                  HStack() {
                      ForEach(0 ..< 10) { item in
                          Button(action: {
                              
                          }) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }
          }.onMoveCommand(){direction in
              print(direction)
              if direction == .down{
                  self.selectedSection = SelectedSection.sec_2
              }
          }.prefersDefaultFocus(self.selectedSection == SelectedSection.sec_1, in: mainNamespace)

          Text("Section 2")

          Group(){
              ScrollView(.horizontal) {
                  HStack() {
                      ForEach(0 ..< 2) { item in
                          Button(action: {
                              
                          }) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }
          }.onMoveCommand(){direction in
              print(direction)
              if direction == .down{
                  self.selectedSection = SelectedSection.sec_3
              }
              if direction == .up{
                  self.selectedSection = SelectedSection.sec_1
              }
          }.prefersDefaultFocus(self.selectedSection == SelectedSection.sec_2, in: mainNamespace)

          Text("Section 3")

          Group(){
              ScrollView(.horizontal) {
                  HStack() {
                      ForEach(0 ..< 3) { item in
                          Button(action: {
                              
                          }) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }
          }.onMoveCommand(){direction in
              print(direction)
              if direction == .up{
                  self.selectedSection = SelectedSection.sec_2
              }
          }.prefersDefaultFocus(self.selectedSection == SelectedSection.sec_3, in: mainNamespace)

          Spacer()
      }
      .focusScope(mainNamespace)
      .onAppear(){
          print(selectedSection)
      }
      .onChange(of: self.selectedSection){newValue in
          resetFocus(in: mainNamespace)
      }
  }
}

struct FocusDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusDemoView()
    }
}

struct FocusableRectangle: View {
    @Environment(\.isFocused) var isFocused: Bool
    @State var color = Color.blue
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 300.0, height: 200.0)
            .onChange(of: isFocused, perform: { value in
                color = value ? Color.red : Color.blue
            })
    }
}
