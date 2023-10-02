//
//  TitleWithSaveButtonView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI
struct WideSaveShareButtonsView: View {
    
    var titleFilm: String
    var appLink: String 
    
    @State var isButtonTap: Bool = false
    @State private var isShareSheetPresented = false
    
    var body: some View {
        HStack {
            WideBlueButton(buttonText: "Смотреть на сайте") {
                //TODO: - сделать переход на сайт Кинопоиска по ссылке фильма
                print("Пользователь перешел на сайт")
            }
            .frame(width: 250, height: 60)
            
            Spacer().frame(width: 20)
            
            Button(action: {
                //TODO: - Добавить действие для кнопки "Сохранить"
                isButtonTap.toggle()
            }) {
                Image(systemName: isButtonTap ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .foregroundColor(Color.Primary.num1)
                    .frame(width: 30, height: 30)
            }
            
            Spacer().frame(minWidth: 20)
            
            Button(action: {
                isShareSheetPresented.toggle()
            }) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .foregroundColor(Color.Primary.num1)
                    .frame(width: 30, height: 40)
            }
            .sheet(isPresented: $isShareSheetPresented) {
                ShareSheet(activityItems: [appLink])
            }
        }
        Divider()
            .background(.white)
    }
}
