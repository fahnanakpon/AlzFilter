import UIKit

typealias ResultHelperCallback = UIViewController? -> Void

class ResultHelper: NSObject {
    
    weak var viewController: UIViewController!
    var callback: ResultHelperCallback
    var imagePickerController: UIImagePickerController!
    
    init(viewController: UIViewController, callback: ResultHelperCallback){
        self.viewController = viewController
        self.callback = callback
    }
    
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
        
    }
    

}
