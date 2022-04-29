import SwiftUI
import Firebase
import GoogleSignIn


@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView(info: delegate)
                    .accentColor(.black)
                    .onAppear {
                        if #available(iOS 15.0, *) {
                            let tabBarAppearance = UITabBarAppearance()
                            tabBarAppearance.configureWithDefaultBackground()
                            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                        }
                    }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }
}
