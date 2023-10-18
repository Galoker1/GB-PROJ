//
//  TabBarView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: TabBarProperties = .moviesCatalog
    @GestureState private var dragState: CGFloat = 0
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    
                    ForEach(TabBarProperties.allCases, id: \.rawValue) { tab in
                        HStack {
                            switch selectedTab {
                            case .moviesCatalog:
                                MainPageView(viewModel: FilmViewModel(typeOfTitle: "movie"))
                            case .seriesCatalog:
                                MainPageView(viewModel: FilmViewModel(typeOfTitle: "tv-series"))
                            case .personCatalog:
                                PersonCatalogView()
                            }
                        }
                        .tag(tab)
                    }
                }
                .offset(x: self.offset)
                .gesture(
                    DragGesture().updating($dragState) { (value, state, transaction) in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        swipe(value)
                    }
                )

            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom)
            }
        }
        .ignoresSafeArea(.all)
    }
    private func swipe(_ value: GestureStateGesture<DragGesture, CGFloat>.Value) {
        if value.predictedEndTranslation.width < -50 {
            if let newIndex = TabBarProperties.allCases.firstIndex(of: selectedTab) {
                let nextIndex = (newIndex + 1) % TabBarProperties.allCases.count
                selectedTab = TabBarProperties.allCases[nextIndex]
            }
        } else if value.predictedEndTranslation.width > 50 {
            if let newIndex = TabBarProperties.allCases.firstIndex(of: selectedTab) {
                let previousIndex = (newIndex - 1 + TabBarProperties.allCases.count) % TabBarProperties.allCases.count
                selectedTab = TabBarProperties.allCases[previousIndex]
            }
        }
        self.offset = 0

    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .background(Color.Neutral.num3)
    }
}

