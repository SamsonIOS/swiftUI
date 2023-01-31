//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//
 
import SwiftUI

struct NeomorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: -5, y: -5)
            .shadow(color: Color("darkShadow"), radius: 5, x: 5, y: 5)
    }
}

struct NeomorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("darkShadow"), radius: 5, x: -5, y: -5)
    }
}

struct NeomorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color("background")))
            .neomorphismUnSelectedStyle()
    }
}

extension View {
    func neomorphismUnSelectedStyle() -> some View {
        modifier(NeomorphismUnSelected())
    }
    
    func neomorphismSelectedStyle() -> some View {
        modifier(NeomorphismSelected())
    }
    
    func neomorphismUnSelectedCircleStyle() -> some View {
        modifier(NeomorphismUnSelectedCircle())
    }
}

struct ContentView: View {
    
    @State var isCarClose = false
    @State var tagSelected = 0
    
    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
    
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("187 km")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(25)
    }
    
    var carView: some View {
        Image(isCarClose ? "closeCar" : "car")
            .resizable()
            .frame(height: 150)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .bottom, endPoint: .top)
    }
    
    var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .neomorphismUnSelectedCircleStyle()
                        .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        )
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color("background")))
        .neomorphismUnSelectedStyle()
    }
    
    var closedCarControllView: some View {
        Button {
            withAnimation {
                isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(isCarClose ? "Закрыть" : "Открыть")
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                        .renderingMode(.template)
                        .neomorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(Color("background")))
            .neomorphismSelectedStyle()
        }
        .frame(width: 300)
    }
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carView
                controllPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 1 {
                    closedCarControllView
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
