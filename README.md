# popup
create popup message information need to be confirm, or cancel

![alt text](https://github.com/ajijoyo/popup/blob/master/example.png)


#usage

```objective-c
#import "popUp.h"

for confirm or cancel show popup message
[[popUp showMessage:@"lorem ipsum\nipsum ipsum" withTitle:@"with title"]
     withConfirm:@"confirm" onConfirm:^{
     
     }withCancel:@"cancel" onCancel:^{
     
     }];
     
for confirm show popup message  
[[popUp showMessage:@"lorem ipsum\nipsum ipsum" withTitle:@"with title"]
     withConfirm:@"oke" onConfirm:^{
         
     }];

 //you need uncomment on line 36 in 'popUp.m' and fill your images
[popUp showProgress];

[popUp stopProgress];
```

feel free to pull request for add feature
