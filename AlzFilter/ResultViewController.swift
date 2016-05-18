import UIKit

class ResultViewController: UIViewController {
    
    var scoreString = ""
    @IBOutlet weak var score: UILabel!
    
    var resultString = ""
    @IBOutlet weak var result: UILabel!
    
    
    var toPass:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = scoreString
        result.text = resultString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  
    //ทำให้หน้าจอแอพเป็นแนวตั้งอย่างเดียว
    override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

}
