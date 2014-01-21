//
//  ViewController.m
//  SocialTest
//
//  Created by SDT-1 on 2014. 1. 21..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clickFB:(id)sender {
	NSString *service = SLServiceTypeFacebook;
	if([SLComposeViewController isAvailableForServiceType:service]) {
		SLComposeViewController *composer = [SLComposeViewController composeViewControllerForServiceType:service];
		
		UIImage *image = [UIImage imageNamed:@"Default.png"];
		[composer addImage:image];
		
		[composer setInitialText:@"소셜 프레임웤을 이용한 글쓰기 테스트!"];
		
		composer.completionHandler = ^(SLComposeViewControllerResult result) {
			if(SLComposeViewControllerResultDone == result) {
				NSLog(@"글 작성 완료");
			}else {
				NSLog(@"글작성 실패");
			}
		};
		
		[self presentViewController:composer animated:YES completion:nil];
		
	}
}
- (IBAction)btnClicked:(id)sender {
	UIImage *image = [UIImage imageNamed:@"Default.png"];
	NSArray *items = @[@"액티비티 뷰 컨트롤러 테스팅!", image];
	
	UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
	
	vc.completionHandler = ^(NSString *activityType, BOOL completed) {
		NSLog(@"%@의 동작 끝", activityType);
	};
	
	[self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
