//
//  CustomYearsPickerView .swift
//  GB-PROJ
//
//  Created by Александра Макей on 17.10.2023.
//

import SwiftUI

struct CustomYearsPickerView: View {
    var placeholder: String
    @Binding var selectedYears: Set<Int>
    @State private var isPickerVisible = false
    var yearRange: [Int]
    
    init(placeholder: String, selectedYears: Binding<Set<Int>>, yearRange: [Int]) {
        self.placeholder = placeholder
        self._selectedYears = selectedYears
        self.yearRange = yearRange
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(placeholder)
                    .foregroundColor(Color.Neutral.white)
                    .opacity(0.5)
                    .font(Font.T3DisplayRegular())
                Spacer()
                Button(action: {
                    isPickerVisible.toggle()
                }) {
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(Color.Primary.num1)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.all, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(selectedYears), id: \.self) { item in
                        HStack {
                            Text("\(item)")
                            
                            Button(action: {
                                removeYear(item)
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color.Neutral.num3)
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .padding(.all, 2)
                        .background(Color.Primary.num1)
                        .opacity(0.7)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            
            if isPickerVisible {
                List {
                    ForEach(yearRange, id: \.self) { item in
                        HStack {
                            Text("\(item)")
                            if selectedYears.contains(item) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                            }
                        }
                        .listRowBackground(Color.Neutral.num1)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if selectedYears.contains(item) {
                                selectedYears.remove(item)
                            } else {
                                selectedYears.insert(item)
                            }
                        }
                    }
                }
                .frame(height: 135)
                .background(Color.Neutral.num1)
                .listStyle(.inset)
            }
        }
        .background(Color.Neutral.num1)
        .cornerRadius(12)
    }
    
    private func addYear(_ year: Int) {
        selectedYears.insert(year)
    }
    
    private func removeYear(_ year: Int) {
        selectedYears.remove(year)
    }
}
