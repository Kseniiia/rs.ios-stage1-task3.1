#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.accessibilityIdentifier = @"mainView";
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(25, 140, 100, 40)];
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.labelResultColor.text = @"Color";
    
    [self.view addSubview:self.labelResultColor];
    
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(145, 140, 205, 40)];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.viewResultColor.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.viewResultColor];
    
    UILabel *labelRed = [[UILabel alloc] initWithFrame:CGRectMake(25, 200, 100, 40)];
    labelRed.accessibilityIdentifier = @"labelRed";
    labelRed.text = @"RED";
    
    [self.view addSubview:labelRed];
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(125, 200, 225, 40)];
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.delegate = self;
    self.textFieldRed.keyboardType = UIKeyboardTypeNumberPad;
    self.textFieldRed.placeholder = @"0..255";
    
    [self.view addSubview:self.textFieldRed];
    
    UILabel *labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(25, 260, 100, 40)];
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelGreen.text = @"GREEN";
    
    [self.view addSubview:labelGreen];
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(125, 260, 225, 40)];
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.delegate = self;
    self.textFieldGreen.keyboardType = UIKeyboardTypeNumberPad;
    self.textFieldGreen.placeholder = @"0..255";
    
    [self.view addSubview:self.textFieldGreen];
    
    UILabel *labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(25, 320, 100, 40)];
    labelBlue.accessibilityIdentifier = @"labelBlue";
    labelBlue.text = @"BLUE";
    
    [self.view addSubview:labelBlue];
    
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(125, 320, 225, 40)];
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.delegate = self;
    self.textFieldBlue.keyboardType = UIKeyboardTypeNumberPad;
    self.textFieldBlue.placeholder = @"0..255";

    [self.view addSubview:self.textFieldBlue];
    
    UIButton *buttonProcess = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [buttonProcess sizeToFit];
    buttonProcess.center = CGPointMake(self.view.center.x, 400);
    
    [buttonProcess addTarget:self action:@selector(processAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonProcess];
    
}

- (int)stringToInt:(NSString *)string {
    int result;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    if ([scanner scanInt:&result] && [scanner isAtEnd]) {
        return result;
    }
    return -1;
}

- (void)setBackgroundColor:(int)r g:(int)g b:(int)b {
    UIColor *color = [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
    self.viewResultColor.backgroundColor = color;
}

- (NSString *)rgbToHex:(int)r g:(int)g b:(int)b {
    NSString *hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", r, g, b];
    return hexString;
}

- (void)processAction:(UIButton *)button {
    int r = [self stringToInt:self.textFieldRed.text];
    int g = [self stringToInt:self.textFieldGreen.text];
    int b = [self stringToInt:self.textFieldBlue.text];
    
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
        self.labelResultColor.text = @"Error";
    } else {
        [self setBackgroundColor:r g:g b:b];
        self.labelResultColor.text = [self rgbToHex:r g:g b:b];
    }
    
    self.textFieldRed.text = nil;
    self.textFieldGreen.text = nil;
    self.textFieldBlue.text = nil;
    
    [self.view endEditing:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.labelResultColor.text = @"Color";
    [self setBackgroundColor:255 g:255 b:255];
}

@end
