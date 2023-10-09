//
//  WideTextFieldWithPlaceholder.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

struct CustomPickerView<T: ChosePickersProperties>: View {
    var placeholder: String
    @Binding var selectedProperties: [String]
    @State private var isPickerVisible = false
    @State var enumCases: [T]
    
    
    init(placeholder: String, selectedProperties: Binding<[String]>, enumCases: [T]) {
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
                    ForEach(selectedProperties, id: \.self) { item in
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
                        .background(Color.Primary.num1)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            
            if isPickerVisible {
                Section {
//                    Picker("", selection: $enumCases) {
                        ForEach(enumCases, id: \.self) { item in
                            HStack {
                                Text(item.russianName)
                                Spacer()
                                
                                Button(action: {
                                    if !selectedProperties.contains(item.russianName) {
                                        addProperties(item.russianName)
                                    }
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(Color.Primary.num1)
                                }
                            }
                        
                        }
//                    }
                    .frame(maxWidth: .infinity)
//                    .pickerStyle(.wheel)
                }
            }
        }
        .background(Color.Neutral.num1)
        .cornerRadius(12)
    }
    
    private func addProperties(_ property: String) {
        selectedProperties.append(property)
    }
    
    private func removeProperties(_ property: String) {
        if let index = selectedProperties.firstIndex(of: property) {
            selectedProperties.remove(at: index)
        }
    }
}

//struct CustomPickerView: View {
//    var placeholder: String
//    @Binding var selectedProperties: [String]
//    @State private var isPickerVisible = false
//    @State var properties = ["Фильм", "Триллер", "Боевик", "Комедия"]
//    
//    init(placeholder: String, selectedProperties: Binding<[String]>) {
//        self.placeholder = placeholder
//        self._selectedProperties = selectedProperties
//    }
//    var body: some View {
//        VStack {
//            HStack {
//                Text(placeholder)
//                    .foregroundColor(Color.Neutral.white)
//                    .opacity(0.5)
//                    .font(Font.T3DisplayRegular())
//                Spacer()
//                Button(action: {
//                    isPickerVisible.toggle()
//                }) {
//                    Image(systemName: "arrowtriangle.down.fill")
//                        .foregroundColor(Color.Primary.num1)
//                        .frame(width: 20, height: 20)
//                }
//            }
//            .padding(.all, 6)
//            
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(selectedProperties, id: \.self) { genre in
//                        HStack {
//                            Text(genre)
//                            
//                            Button(action: {
//                                removeGenre(genre)
//                            }) {
//                                Image(systemName: "xmark.circle")
//                                    .foregroundColor(Color.Neutral.num3)
//                                    .frame(width: 25, height: 25)
//                            }
//                        }
//                        .padding(.all, 2)
//                        .background(Color.Primary.num1)
//                        .cornerRadius(12)
//                    }
//                }
//                .padding(.horizontal)
//            }
//            
//            if isPickerVisible {
//                Form {
//                    Section {
//                        Picker("Strength", selection: $properties) {
//                            ForEach(properties, id: \.self) { genre in
//                                HStack {
//                                    Text(genre)
//                                    Spacer()
//                                    if !selectedProperties.contains(genre) {
//                                        Button(action: {
//                                            addGenre(genre)
//                                        }) {
//                                            Image(systemName: "plus.circle")
//                                                .foregroundColor(Color.Primary.num1)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                        .frame(maxWidth: .infinity)
//                        .pickerStyle(.wheel)
//                    }
//                }
//            }
//        }
//        .background(Color.Neutral.num1)
//        .cornerRadius(12)
//    }
//    
//    private func addGenre(_ genre: String) {
//        selectedProperties.append(genre)
//    }
//    
//    private func removeGenre(_ genre: String) {
//        if let index = selectedProperties.firstIndex(of: genre) {
//            selectedProperties.remove(at: index)
//        }
//    }
//}


