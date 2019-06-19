import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = LoginViewController()
        self.window?.makeKeyAndVisible()
        
        willAutoLogin { (vc) in

            if let viewController = vc as? LoginViewController {
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = LoginViewController()
                self.window?.makeKeyAndVisible()
            }

            if let viewController = vc as? MainViewController {
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = MainViewController()
                self.window?.makeKeyAndVisible()
            }

        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {

    func willAutoLogin(completion: @escaping (UIViewController) -> Void) {

        guard let id = UserDefaults.standard.string(forKey: "id") else { return }
        guard let pw = UserDefaults.standard.string(forKey: "pw") else { return }
        // guard-binding
            // guard let - if id&pw != nil then id&pw에 데이타할당하고 이후 함수 진행
            // else { return } - if id&pw == nil then 이후 함수 진행 하지 않음 (조기 종료)

        Auth.auth().signIn(withEmail: id, password: pw) { (authResult, error) in

            if let err = error {

                let loginVC = LoginViewController()
                completion(loginVC)
            }

            if let result = authResult {
                let mainVC = MainViewController()
                completion(mainVC)
            }
        }

    }
}
