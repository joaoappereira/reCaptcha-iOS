import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let captchaDelegate = CAPTCHADelegate()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let viewModel = ReCAPTCHAViewModel(siteKey: "xxx", url: URL(string: "http://localhost")!)

        window?.rootViewController = ReCAPTCHAViewController(viewModel: viewModel)
        window?.makeKeyAndVisible()

        viewModel.delegate = captchaDelegate

        return true
    }
}

class CAPTCHADelegate: ReCAPTCHAViewModelDelegate {
    func didSolveCAPTCHA(token: String) {
        print("TOKEN \(token)")
    }
}
