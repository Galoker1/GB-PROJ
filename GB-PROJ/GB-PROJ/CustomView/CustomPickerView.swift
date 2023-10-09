//
//  WideTextFieldWithPlaceholder.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

struct CustomPickerView<T: ChosePickersProperties>: View {
    var placeholder: String
    @Binding var selectedProperties: Set<String>
    @State private var isPickerVisible = false
    @State var enumCases: [T]
    
    
    init(placeholder: String, selectedProperties: Binding<Set<String>>, enumCases: [T]) {
        self.placeholder = placeholder
        self._selectedProperties = selectedProperties
        self.enumCases = enumCases
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
                    ForEach(Array(selectedProperties), id: \.self) { item in
                        HStack {
                            Text(item)
                            
                            Button(action: {
                                removeProperties(item)
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color.Neutral.num3)
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .padding(.all, 2)
                        .background(Color.Primary.num2)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            
            if isPickerVisible {
                List {
                    ForEach(enumCases, id: \.self) { item in
                        HStack {
                            Text(item.russianName)
                            if selectedProperties.contains(item.russianName) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                            }
                      
                        }
                        .listRowBackground(Color.Neutral.num1)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if selectedProperties.contains(item.russianName) {
                                selectedProperties.remove(item.russianName)
                            } else {
                                selectedProperties.insert(item.russianName)
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
    
    private func addProperties(_ property: String) {
        var propertiesArray = Array(selectedProperties)
        propertiesArray.append(property)
        selectedProperties = Set(propertiesArray)
    }
    
    private func removeProperties(_ property: String) {
        var propertiesArray = Array(selectedProperties)
        if let index = propertiesArray.firstIndex(of: property) {
            propertiesArray.remove(at: index)
            selectedProperties = Set(propertiesArray)
        }
    }
}

