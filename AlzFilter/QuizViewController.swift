import UIKit

//typealias QuizViewControllerCallback = UIViewController? -> Void

class QuizViewController: UIViewController, UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //get_data_from_url(json_url)
    }
    
    /*
    weak var viewController: UIViewController!
    var callback: ResultHelperCallback
    var imagePickerController: UIImagePickerController!
    
    init(viewController: UIViewController, callback: QuizViewControllerCallback){
        self.viewController = viewController
        self.callback = callback
    }*/
    
    var count=0
    var q1=0
    var q2=0
    var q3=0
    var q4=0
    var q5=0
    var q6=0
    var q7=0
    var q8=0
    var q9=0
    var q10=0
    var q11=0
    
    @IBOutlet weak var question1: UISegmentedControl!
    @IBOutlet weak var question2: UISegmentedControl!
    @IBOutlet weak var question3: UISegmentedControl!
    @IBOutlet weak var question4: UISegmentedControl!
    @IBOutlet weak var question5: UISegmentedControl!
    @IBOutlet weak var question6: UISegmentedControl!
    @IBOutlet weak var question7: UISegmentedControl!
    @IBOutlet weak var question8: UISegmentedControl!
    @IBOutlet weak var question9: UISegmentedControl!
    @IBOutlet weak var question10: UISegmentedControl!
    @IBOutlet weak var question11: UISegmentedControl!
    
    var resultHelper : ResultHelper?
    
    /*
    func pressSubmit(){
        resultHelper = ResultHelper(viewController: self.submit(<#T##sender: UIButton##UIButton#>)){
            (image:UIImage?) in
            //do nothing yet
        }
    }*/
    
    /*
    func showAlert(){
        //สร้าง Actionsheet
        let alertController = UIAlertController(title: nil, message:"คุณแน่ใจหรือไม่ว่าต้องการดูผลลัพธ์", preferredStyle: .ActionSheet)
        
        let pressBack = UIAlertAction(title: "กลับไปแก้ไข", style: .Cancel, handler: nil)
        alertController.addAction(pressBack)
        
        let pressNext = UIAlertAction(title: "ดูผลลัพธ์", style: .Default ) { (action) in
            self.showImagePickerController(.Camera)
        }
        alertController.addAction(pressNext)
        
        let pressAlbum = UIAlertAction(title: "เลือกภาพจากอัลบั้ม", style: .Default ) { (action) in
            self.showImagePickerController(.PhotoLibrary)
        }
        alertController.addAction(pressAlbum)
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }

    func showImagePickerController(sourceType: UIImagePickerControllerSourceType){
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
        
    }*/
    
    @IBOutlet weak var pointLabel: UILabel!
    
    func showAlertSelection(){
        let alertController = UIAlertController(title: nil, message: "คุณแน่ใจกับคำตอบที่เลือกแล้วหรือไม่", preferredStyle: .Alert)
        
        let backAction = UIAlertAction(title: "กลับไปแก้ไข", style: .Cancel, handler: nil)
        alertController.addAction(backAction)
        
        let submitAction = UIAlertAction(title: "ดูผลทดสอบ", style: .Default, handler: nil)
        alertController.addAction(submitAction)
    }
    

    @IBAction func submit(sender: UIButton) {
        
        /*
        let alertView = UIAlertView(title: "แจ้งเตือน!", message: "คุณแน่ใจว่าคำตอบของคุณถูกต้องครบถ้วน?", delegate: self, cancelButtonTitle: "กลับไปแก้ไข", otherButtonTitles: "ดูผลการทดสอบ")
        
        alertView.tag = 1
        
        alertView.show()
        */
    }
    
    // ให้มี Pop Up ถามว่าต้องการแก้ไขคำตอบไหม หรือจะดูผลการทดสอบเลย
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 1 {
            //ถ้ากด กลับไปแก้ไข
            if buttonIndex == 0 {
                print("ผู้ใช้กด กลับไปแก้ไข")
                
            } else {
                test()
                print("ผู้ใช้กด ดูผลการทดสอบ")
                
            }
        }
    }
    
    let vc = ResultViewController()
    
    func test(){
        self.presentViewController(vc, animated: true, completion: nil)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "calculateScoreSegue"{
            
            enum ErrorHandler:ErrorType
            {
                case ErrorFetchingResults
            }
            
            struct datastruct
            {
                var passingData = 0
                
                init(add: NSDictionary)
                {
                    passingData = (add["PassingScore"] as? Int)!
                    print(passingData)
                }
            }
            
            //ทำการรวมคะแนนการ segment control ที่ผู้ใช้เลือกคำตอบ
            count = question1.selectedSegmentIndex+question2.selectedSegmentIndex+question3.selectedSegmentIndex+question4.selectedSegmentIndex+question5.selectedSegmentIndex+question6.selectedSegmentIndex+question7.selectedSegmentIndex+question8.selectedSegmentIndex+question9.selectedSegmentIndex+question10.selectedSegmentIndex+question11.selectedSegmentIndex
            
            //นำ count ที่ได้ไปเปรียบเทียบบน database ว่าผลลัพธ์จะออกมาเป็นอย่างไร
                //รอโค้ด

            //เป็น label ที่ให้แสดงค่าคะแนนว่าทำได้กี่คะแนน
            pointLabel.text = String(count)
            
            //กำหนด
            let vc = segue.destinationViewController as! ResultViewController
            vc.scoreString = pointLabel.text!
            //print("pointlabel = ",pointLabel.text!)
            if count >= 4 {
                vc.resultString = "คุณมีความเสี่ยงเป็นผู้ป่วยโรคอัลไซเมอร์"
            }
            else {
                vc.resultString = "คุณยังไม่มีความเสี่ยงเป็นโรคอัลไซเมอร์"
            }
        }
    }
    
    //ทำให้หน้าจอแอพเป็นแนวตั้งอย่างเดียว
    override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
}