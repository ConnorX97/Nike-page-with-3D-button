//
//  ContentView.swift
//  NikeShop
//
//  Created by Sherzod Fayziev on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var color = #colorLiteral(red: 0.9539086223, green: 0.9683395028, blue: 0.9095165133, alpha: 1)
    @State var nightColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    @State var nightCardColor = #colorLiteral(red: 0.6784313917160034, green: 0.6784313917160034, blue: 0.6784313917160034, alpha: 1.0)
    @State var showShoe = false
    @State var night = false
   // @State var buttonTapped = false
    
    @State var tapped = false

    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .foregroundColor( night ? Color(nightColor) : Color(color))
                .ignoresSafeArea(.all)
            VStack {
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .shadow(color: .black .opacity(night ? 0.7 : 0.3), radius: 5, x: 5, y: 5)
                            .shadow(color: .white .opacity(night ? 0.5 : 0), radius: 5, x: -5, y: -5)
                            .foregroundColor( night ? Color(nightColor) : Color(color))
                        
                        Circle()
                            .fill(
                                .shadow(.inner(color: .black .opacity(night ? 0.7 : 0.3) ,radius: 3, x:5, y: 5))
                                .shadow(.inner(color: .white .opacity(0.7), radius:3, x: -5, y: -5))
                            )
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor( night ? Color(nightColor) : Color(color))
                        Circle()
                            .frame(width: 30, height: 30, alignment: .center)
                            .shadow(color: .black .opacity(tapped ? 0 : night ? 0.7 : 0.3), radius: 5, x: 5, y: 5)
                            .shadow(color: .white .opacity(night ? 0.5 : 0.3), radius: tapped ? 0 : 3, x: tapped ? 0 : -5, y: tapped ? 0 : -5)
                        
                            .scaleEffect(x: tapped ? 0.96 : 1, y: tapped ? 0.96 : 1)
                            .animation(.easeInOut, value: tapped)
                            .foregroundColor( night ? Color(nightColor) : Color(color))
                        Image(systemName: "person")
                            .foregroundColor( night ? Color(color) : Color(nightColor) .opacity(0.8))
                            .scaleEffect(x: tapped ? 0.96 : 1, y: tapped ? 0.96 : 1)
                    }
                    .pressEvents {
                        withAnimation(.easeInOut(duration: 1)) {
                            tapped = true
                        }
                    } onRelease: {
                        withAnimation {
                            tapped = false
                        }
                    }
                        .padding()
                        .foregroundColor(Color(nightColor))
                   // .padding()
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    
                    Spacer()
                    Button(action: {
                        self.night.toggle()
                    }, label: {
                        Image(systemName: night ? "lightbulb.led" : "lightbulb.max.fill")
                            .foregroundColor( night ? .white : . black)
                            .font(.system(size: 25))
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding()
                    })
                }
                
                HStack(alignment: .center, spacing: 30){
                    Button(action: {}, label: {
                        Text("Hot")
                            .foregroundColor( night ? .white : .gray)
                    })
                    Button(action: {
                        self.night.toggle()
                    }, label: {
                        Text("Selling")
                            .foregroundColor( night ? .white : .gray)
                    })
                    Button(action: {}, label: {
                        Text("Pre-sale")
                            .foregroundColor( night ? .white : .gray)
                    })
                }.blur(radius: showShoe ? 10 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showShoe)
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundColor( night ? Color(nightCardColor) : Color(color))
                        .shadow(color: .black .opacity(0.3), radius: 30, x: 0, y: 20)
                        .frame(width: 230, height: 300, alignment: .center)
                        .offset(x: 20, y: 0)
                        .offset(x: showShoe ? -20 : 0)
                        .rotationEffect(.degrees(5))
                        .rotationEffect(.degrees(showShoe ? -5 : 0))
                    .animation(.easeInOut(duration: 1), value: showShoe)

                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundColor( night ? Color(nightCardColor) : Color(color))
                        .shadow(color: .black .opacity(0.3), radius: 30, x: 0, y: 20)
                        .frame(width: 230, height: 300, alignment: .center)
                    .offset(x: -20, y: 0)
                    .offset(x: showShoe ? 20 : 0)
                    .rotationEffect(.degrees(-5))
                    .rotationEffect(.degrees(showShoe ? 5 : 0))
                    .animation(.easeInOut(duration: 1), value: showShoe)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundColor( night ? Color(nightCardColor) : Color(color))
                        .shadow(color: .black .opacity(0.3), radius: 30, x: 0, y: 20)
                        .frame(width: showShoe ? 320 : 230, height: showShoe ? 500 : 300, alignment: .center)
                        .offset(x: 0, y: showShoe ? -50 : 0)
                        .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0), value: showShoe)
                    VStack{
                        Image("Jordan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, alignment: .center)
                            .offset(x: showShoe ? -50 : 0, y: showShoe ? -100 : 0)
                        if showShoe == true {
                            VStack(alignment: .leading, spacing: 20){
                                Rectangle()
                                    .frame(width: 160, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))
                                Rectangle()
                                    .frame(width: 240, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))

                                Rectangle()
                                    .frame(width: 180, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))

                                Rectangle()
                                    .frame(width: 230, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))

                                Rectangle()
                                    .frame(width: 240, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))
                                Rectangle()
                                    .frame(width: 210, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))
                                Rectangle()
                                    .frame(width: 170, height: 7)
                                    .foregroundColor(night ? .white .opacity(0.3) : .gray .opacity(0.3))
                                

                            }.offset(x: 0, y: -100)
                        }
                        Text("Nike Air Jordan 1")
                            .foregroundColor( night ? .white : .gray)
                            .fontWeight(showShoe ? .bold : .light)
                       
                            .offset(y: showShoe ? -30 : 0)
                        
                    }
                    .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.5), value: showShoe)
                    
                }
                
                .onTapGesture {
                    self.showShoe.toggle()
                }
                HStack{
                    if showShoe == true {
                        Button(action: {}, label: {
                            Text("Buy now")
                                .foregroundColor(.white)
                                .padding(.all)
                                .padding(.horizontal, 40)
                                .background(.orange)
                                .cornerRadius(50)
                        })
                        
                    }
                }.animation(.easeInOut(duration: 0.4), value: showShoe)
                Spacer()
                
            }
                   } .preferredColorScheme(.light)
            .animation(.easeInOut(duration: 0.7), value: night)
    }
}

#Preview {
    ContentView()
}

struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}



extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(ButtonPress(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}



