
import UIKit
// 画面遷移を担うクラスでシングルトン
final class Router {
    // static let shared = Router()を丁寧に書くとこうなる
    static let shared: Router = .init()
    private init() {}
    private var window: UIWindow?

    /// 起動経路
    internal func showRoot(windowScene: UIWindowScene) -> UIWindow?{
        let window = UIWindow(windowScene: windowScene)
        let homeVC = HomeViewController()
        let nav = UINavigationController(rootViewController: homeVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        return window
    }

    // Red画面に画面遷移
//    internal func showRed(from: UIViewController) {
//        guard let toVC = UIStoryboard(name: "Red", bundle: nil).instantiateInitialViewController() as? RedViewController else {
//            return
//        }
//        show(from: from, next: toVC)
//    }
}

private extension Router {
    // 基本の画面遷移メソッド、アニメーションはデフォルト引数でtrue
    func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
        //　移動元がnavigationControllerだったら
        if let nav = from.navigationController {
            // プッシュ遷移
            nav.pushViewController(next, animated: animated)
        } else { // 違うのなら
            // モーダル遷移
            from.present(next, animated: animated)
        }
    }
}
