//
//  Test.swift
//  GB-PROJ
//
//  Created by Александра Макей on 09.10.2023.
//

import SwiftUI

struct Test: View {
    @State private var isPickerVisible = false
    @State private var selectedItems: Set<String> = [] // Используйте Set для хранения выбранных элементов
    @State private var newItemText = ""

    var body: some View {
        VStack {
            TextField("Добавить элемент", text: $newItemText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                isPickerVisible.toggle()
            }) {
                Text("Выбрать элементы")
            }
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(selectedItems), id: \.self) { item in // Преобразуйте Set в Array для ForEach
                        HStack {
                            Text(item)
                            Button(action: {
                                removeItem(item)
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isPickerVisible) {
            CustomMultiPicker(selectedItems: $selectedItems, items: ["Item 1", "Item 2", "Item 3", "Item 4"])
        }
    }

    private func removeItem(_ item: String) {
        selectedItems.remove(item)
    }
}


struct CustomMultiPicker: View {
    @Binding var selectedItems: Set<String>
    let items: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    if selectedItems.contains(item) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                    } else {
                        selectedItems.insert(item)
                    }
                }
            }
        }
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
