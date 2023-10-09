//
//  TabBar.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: TabBarProperties
    
     var fillImage: String {
        selectedTab.tabImage + ".fill"
    }
    
    var body: some View {
        HStack {
            ForEach(TabBarProperties.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: selectedTab == tab ? fillImage : tab.tabImage)
                    .font(.system(size: 25))
                    .scaleEffect( tab == selectedTab ? 1.2 : 0.8 )
                    .foregroundColor(selectedTab == tab ? Color.Primary.num1 : Color.Primary.num1)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
        } 
        .frame(width: UIScreen.main.bounds.width, height: 60)
       
            .background(Color.Neutral.num3)
            .padding(.bottom)
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.personCatalog))
    }
}
