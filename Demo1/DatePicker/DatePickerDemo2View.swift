//
//  DatePickerDemo2View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct DatePickerDemo2View: View {
  @State var birthDate: Date = Date()
  @State var isDatePickerShown: Bool? = false
  
  var body: some View {
      VStack {
          Button(action: {
              self.isDatePickerShown?.toggle()
          }) {
              Text(dateFormatter.string(from: birthDate))
                  .foregroundColor(.white)
                  .padding()
                  .background(Color.blue)
                  .cornerRadius(10)
          }
      }
      .sheet(isPresented: Binding(
        get: { self.isDatePickerShown ?? false },
        set: { self.isDatePickerShown = $0 }
        ), content: {
        
          DatePicker("", selection: self.$birthDate, displayedComponents: .date)
              .labelsHidden()
              .datePickerStyle(GraphicalDatePickerStyle())
              .frame(height: 300)
          
          Spacer()
            .frame(height: 30)

          HStack{
            Spacer()

            Button(action: {
                self.isDatePickerShown?.toggle()
            }) {
                Text("Done")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.trailing, 20)
          }
      })
  }
  
  var dateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      return formatter
  }
}

struct DatePickerDemo2View_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo2View()
    }
}
