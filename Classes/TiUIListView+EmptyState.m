//
//  TiUIListView+EmpyState.m
//  titanium-empty-state
//
//  Created by Hans Knöchel on 01.04.18.
//

#import "TiUIListView+EmptyState.h"
#import "TiUIViewProxy.h"

@implementation TiUIListViewProxy (EmptyStateProxy)

- (void)setPlaceholder:(id)arguments
{
  ENSURE_TYPE(arguments, NSDictionary);

  UITableView *tableView = [(TiUIListView *)[self view] tableView];

  if (tableView.emptyDataSetSource == nil && tableView.emptyDataSetDelegate == nil) {
    tableView.emptyDataSetSource = (TiUIListView *)self.view;
    tableView.emptyDataSetDelegate = (TiUIListView *)self.view;
  }

  [self replaceValue:arguments forKey:@"placeholder" notification:NO];
}

- (void)togglePlaceholder:(id)visible
{
  ENSURE_SINGLE_ARG(visible, NSNumber);

  UITableView *tableView = [(TiUIListView *)[self view] tableView];
  [self setValue:visible forKey:@"_placeholderVisible"];
  
  TiThreadPerformOnMainThread(^{
    [tableView reloadData];
  }, NO);
}

@end

@implementation TiUIListView (EmptyState)

#pragma mark DZNEmptyDataSetSource, DZNEmptyDataSetDelegate

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
  NSString *image = [self placeholderPropertyForAttribute:@"image" withType:[NSString class]];

  if (image == nil) {
    return nil;
  }

  return [TiUtils image:image proxy:self.proxy];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
  Class TiUIAttributedStringProxy = NSClassFromString(@"TiUIAttributedStringProxy");
  id title = [self placeholderPropertyForAttribute:@"title" withType:[TiUIAttributedStringProxy class]];

  if (title == nil) {
    return nil;
  }

  return [title valueForKey:@"attributedString"];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
  Class TiUIAttributedStringProxy = NSClassFromString(@"TiUIAttributedStringProxy");
  id description = [self placeholderPropertyForAttribute:@"description" withType:[TiUIAttributedStringProxy class]];

  if (description == nil) {
    return nil;
  }

  return [description valueForKey:@"attributedString"];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
  Class TiUIAttributedStringProxy = NSClassFromString(@"TiUIAttributedStringProxy");
  id buttonTitle = [self placeholderPropertyForAttribute:@"buttonTitle" withType:[TiUIAttributedStringProxy class]];

  if (buttonTitle == nil) {
    return nil;
  }

  return [buttonTitle valueForKey:@"attributedString"];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
  NSString *buttonImage = [self placeholderPropertyForAttribute:@"buttonImage" withType:[NSString class]];

  if (buttonImage == nil) {
    return nil;
  }

  return [TiUtils image:buttonImage proxy:self.proxy];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
  NSString *backgroundColor = [self placeholderPropertyForAttribute:@"backgroundColor" withType:[NSString class]];

  if (backgroundColor == nil) {
    return nil;
  }

  return [TiUtils colorValue:backgroundColor].color;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
  NSNumber *_placeholderVisible = [[self proxy] valueForKey:@"_placeholderVisible"];

  return [TiUtils boolValue:_placeholderVisible];
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
  return [[self proxy] _hasListeners:@"placeholderclick"];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
  NSNumber *scrollEnabled = [self placeholderPropertyForAttribute:@"scrollEnabled" withType:[NSNumber class]];

  return scrollEnabled.boolValue;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
  [[self proxy] fireEvent:@"placeholderclick" withObject:@{ @"clicksource" : @"view" }];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
  [[self proxy] fireEvent:@"placeholderclick" withObject:@{ @"clicksource" : @"button" }];
}

#pragma mark Utilities

- (id)placeholderPropertyForAttribute:(id)attribute withType:(Class)type
{
  NSDictionary *placeholder = [[self proxy] valueForKey:@"placeholder"];

  if (placeholder == nil) {
    return nil;
  }

  id property = placeholder[attribute];

  if (property == nil) {
    return nil;
  }

  if (![property isKindOfClass:type]) {
    [self throwException:@"Invalid placeholder property type"
               subreason:[NSString stringWithFormat:@"Expected %@, got %@", NSStringFromClass(type), NSStringFromClass([property class])]
                location:CODELOCATION];
  }

  return placeholder[attribute];
}

@end
