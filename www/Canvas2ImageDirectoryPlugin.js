//
//  Canvas2ImageDirectoryPlugin.js
//  Canvas2ImageDirectoryPlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//

  module.exports = {

    saveImageDataToLibrary:function(successCallback, failureCallback, canvasId, directory, filename) {
        // successCallback required
        if (typeof successCallback != "function") {
            console.log("Canvas2ImageDirectoryPlugin Error: successCallback is not a function");
        }
        else if (typeof failureCallback != "function") {
            console.log("Canvas2ImageDirectoryPlugin Error: failureCallback is not a function");
        }
        else {
           //  var canvas = (typeof canvasId === "string") ? document.getElementById(canvasId) : canvasId;
           //   var imageData = canvas.toDataURL().replace(/data:image\/png;base64,/,'');
          canvasId = canvasId || {};
           var imageData = canvasId.toDataURL().replace(/data:image\/gif;base64,/,'').replace(/data:image\/png;base64,/,'').replace(/data:image\/jpeg;base64,/,'').replace(/data:image\/jpg;base64,/,'')+'';
            return cordova.exec(successCallback, failureCallback, "Canvas2ImageDirectoryPlugin","saveImageDataToLibrary",[imageData, directory, filename]);
        }
    }
 
  };

