import SwiftUI

enum ButtonMode: CaseIterable {
    case note, gps, mark
    
    var icon: String {
        switch self {
        case .note: return "note.text"
        case .gps: return "location"
        case .mark: return "mappin"
        }
    }
    
    var title: String {
        switch self {
        case .note: return "Note"
        case .gps: return "GPS"
        case .mark: return "Mark"
        }
    }
    
    var color: Color {
        switch self {
        case .note: return .blue
        case .gps: return .green
        case .mark: return .red
        }
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var showingNoteView = false
    @State private var showingModeMenu = false
    @State private var currentMode: ButtonMode = .note
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    MapView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Map")
                        }
                    
                    NoteListView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("NoteList")
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            TextField("Search...", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Settings action
                        }) {
                            Image(systemName: "gearshape")
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            // Mode selection menu
                            if showingModeMenu {
                                VStack(spacing: 8) {
                                    ForEach(ButtonMode.allCases, id: \.self) { mode in
                                        Button(action: {
                                            currentMode = mode
                                            showingModeMenu = false
                                        }) {
                                            HStack {
                                                Image(systemName: mode.icon)
                                                Text(mode.title)
                                            }
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(mode.color)
                                            .cornerRadius(20)
                                        }
                                    }
                                }
                                .padding(.bottom, 70)
                                .transition(.opacity.combined(with: .scale))
                            }
                            
                            // Main add button
                            Image(systemName: currentMode.icon)
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(currentMode.color)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                                .onTapGesture {
                                    if !showingModeMenu {
                                        handleButtonTap()
                                    }
                                }
                                .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 50) {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        showingModeMenu = true
                                    }
                                }
                        }
                        Spacer()
                    }
                    .padding(.bottom, 34)
                }
                
                // Tap outside to close menu
                if showingModeMenu {
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showingModeMenu = false
                            }
                        }
                }
            }
        }
        .sheet(isPresented: $showingNoteView) {
            NoteView()
        }
    }
    
    private func handleButtonTap() {
        switch currentMode {
        case .note:
            showingNoteView = true
        case .gps:
            // Handle GPS mode action
            print("GPS mode activated")
        case .mark:
            // Handle mark mode action
            print("Mark mode activated")
        }
    }
}
