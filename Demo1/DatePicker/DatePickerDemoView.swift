//
//  DatePickerDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct DatePickerDemoView: View {
  @State var isShowingDatePicker = false
  @State var birthDate = Date()
  
  var body: some View {
      VStack {
          Button(action: {
              self.isShowingDatePicker = true
          }) {
              Text("Select Birth Date")
                  .foregroundColor(.white)
                  .padding()
                  .background(Color.blue)
                  .cornerRadius(10)
          }
          .sheet(isPresented: $isShowingDatePicker) {
              VStack {
                  DatePicker("Birth Date", selection: self.$birthDate, displayedComponents: .date)
                      .padding()
                
                  
                  Button("Done") {
                      self.isShowingDatePicker = false
                  }
                  .padding()
              }
          }
          
          Text("Selected Birth Date: \(birthDate, formatter: dateFormatter)")
              .padding()
          

        
        HStack {
          Text("Test1")
          
          DatePicker("", selection: self.$birthDate, displayedComponents: .date)

          Text("Test1")
        }
        
      }
  }
  
  var dateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      formatter.timeStyle = .none
      return formatter
  }
}

struct DatePickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemoView()
    }
}
