//
//  TabBarView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: TabBarProperties = .moviesCatalog
    
    init() {
        UITabBar.appearance().isHidden = false
    }
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    
                    ForEach(TabBarProperties.allCases, id: \.rawValue) { tab in
                        HStack {
                            switch selectedTab {
                            case .moviesCatalog:
                                MainPageView()
                            case .seriesCatalog:
                                SeriesCatalogView()
                            case .personCatalog:
                                PersonCatalogView()
                            }
                        }
                        .tag(tab)
                    }
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .background(Color.Neutral.num3)
    }
}

