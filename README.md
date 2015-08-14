![image](./PhotoBroswer/title.jpg)


<br/><br/><br/>
照片浏览器终结者
===============
<br/>
.Swift 1.2<br/><br/>
.Xcode 6.3

<br/><br/>
>.请直接拖拽PhotoBroswer文件夹到你的项目即可，不支持pod。<br/>
>.依赖框架说明：CFSnapKit（布局库）、Haneke（图片缓存库）、NVActivityIndicatorView（加载视图）

特别注意：<br/>
1.本框架包比较大，你最好现在先开始下载。不然你可能会等很久。<br/>
2.本次的文档会比较有趣，是以图片各功能来讲述的，请认真查看图片说明文字，使用也内嵌在这些图片说明中。<br/>
3.本框架有OC版本，本次主要是汲取了OC版本所有bug与不足精心推出的OC完美版，https://github.com/nsdictionary/CorePhotoBroswerVC。<br/>



<br/><br/><br/>
快速集成
===============

<br/><br/>
#### 1.添加库
拖拽PhotoBroswer文件夹到你的项目，拖拽Frameworks中的依赖库到您的项目中。

<br/><br/>
#### 2.展示相册：分本地相册和网络相册
本地相册和网络相册并没有本质区域，请注意设置设置相册类型photoType以区分是本地相册还是网络相册


<br/>
##### 2.1展示本地相册

    /** 本地相册 */
    func showLocal(index: Int){
        
        
        let pbVC = PhotoBroswer()
        
        /**  设置相册展示样式  */
        pbVC.showType = showType
        
        /**  设置相册类型  */
        pbVC.photoType = PhotoBroswer.PhotoType.Local
        
        //强制关闭显示一切信息
        pbVC.hideMsgForZoomAndDismissWithSingleTap = true
        
        var models: [PhotoBroswer.PhotoModel] = []
        
        let title = langType == LangType.Chinese ? titleLocalCH : titleEN
        let desc = langType == LangType.Chinese ? descLocalCH : descLocalEN
        
        //模型数据数组
        for (var i=0; i<9; i++){
        
           let model = PhotoBroswer.PhotoModel(localImg:UIImage(named: "\(i+1).jpg")! , titleStr: title, descStr:desc[i], sourceView: displayView.subviews[i] as! UIView)
            
            models.append(model)
        }
        /**  设置数据  */
        pbVC.photoModels = models
        
        pbVC.show(inVC: self,index: index)
    }


<br/>
##### 2.2展示网络相册

    /** 网络相册相册 */
    func showHost(index: Int){
        
        
        let pbVC = PhotoBroswer()
        
        /**  设置相册展示样式  */
        pbVC.showType = showType
        
        /**  设置相册类型  */
        pbVC.photoType = PhotoBroswer.PhotoType.Host
        
        //强制关闭显示一切信息
        pbVC.hideMsgForZoomAndDismissWithSingleTap = true
        
        var models: [PhotoBroswer.PhotoModel] = []
        
        let titles = langType == LangType.Chinese ? titleHostCH : titleHostEN
        let descs = langType == LangType.Chinese ? descHostCH : descHostEN
        
        //模型数据数组
        for (var i=0; i<9; i++){
            
            let model = PhotoBroswer.PhotoModel(hostHDImgURL: hostHDImageUrls[i], hostThumbnailImg: (displayView.subviews[i] as! UIImageView).image, titleStr: titles[i], descStr: descs[i], sourceView: displayView.subviews[i] as! UIView)
            models.append(model)
        }
        
        /**  设置数据  */
        pbVC.photoModels = models
        
        pbVC.show(inVC: self,index: index)
    }

#### 3.功能详解（图文使用，请认真查看）：

<br/>
##### 基本展示 
![image](./PhotoBroswer/Show/1.gif)<br/>

<br/>
##### 无NavBar，无TabBar 
![image](./PhotoBroswer/Show/2.gif)<br/>

<br/>
##### 有NavBar，无TabBar
![image](./PhotoBroswer/Show/3.gif)<br/>

<br/>
##### 无NavBar，有TabBar
![image](./PhotoBroswer/Show/4.gif)<br/>

<br/>
##### 有NavBar，有TabBar
![image](./PhotoBroswer/Show/5.gif)<br/>

<br/>
##### Push模式
请直接设置pbVC.showType = PhotoBroswer.ShowType.Push <br/>
![image](./PhotoBroswer/Show/6.gif)<br/>

<br/>
##### Modal模式
请直接设置pbVC.showType = PhotoBroswer.ShowType.Modal <br/>
![image](./PhotoBroswer/Show/7.gif)<br/>

<br/>
##### 放大模型：仿网易新闻，经典OC版本模式
请直接设置pbVC.showType = PhotoBroswer.ShowType.ZoomAndDismissWithCancelBtnClick <br/>
![image](./PhotoBroswer/Show/8.gif)<br/>

<br/>
##### 这么大模式：微信、新浪微博缩放模式
大家在OC版本反馈想要的功能，，经典OC版本无此功能<br/>
请直接设置pbVC.showType = PhotoBroswer.ShowType.ZoomAndDismissWithSingleTap <br/>
![image](./PhotoBroswer/Show/9.gif)<br/>
<br/>

##### 横屏功能支持：大家在OC版本反馈想要的功能
![image](./PhotoBroswer/Show/10.gif)<br/>

<br/>
##### 图片保存
![image](./PhotoBroswer/Show/11.gif)<br/>

<br/>
##### 信息滚动查看：大家在OC版本反馈想要的功能
![image](./PhotoBroswer/Show/12.gif)<br/>


<br/>
##### 单击模式：详细信息模式
![image](./PhotoBroswer/Show/17.jpg)<br/>

<br/>
##### 单击模式：去除详细信息模式，仿微信
这个是大家在OC版本反馈想要的功能<br/>
请设置以下代码，注意此功能仅仅在ZoomAndDismissWithSingleTap下有效

        //强制关闭显示一切信息
        pbVC.hideMsgForZoomAndDismissWithSingleTap = true

![image](./PhotoBroswer/Show/18.gif)<br/>

<br/>
##### 缩略图未加载成功，大图也没有加载成功
![image](./PhotoBroswer/Show/13.gif)<br/>

<br/>
##### 缩略图加载成功，大图没有加载成功
![image](./PhotoBroswer/Show/14.gif)<br/>

<br/>
##### 缩略图加载成功，大图也加载成功
![image](./PhotoBroswer/Show/15.gif)<br/>

<br/>
##### 缩略图加载成功，图片查看中下载成功及动画
![image](./PhotoBroswer/Show/16.gif)<br/>





<br/><br/><br/>
Charlin Feng的事业，希望得到您的支持！
===============
我们创业啦，就在成都！一切都是那么的艰难，但我们无谓艰难！勇往直前！我们希望得到您的支持，就算仅仅是心灵上的！<br/>
四川西成软件技术有限公司：http://ios-android.cn<br/>

<br/><br/>




