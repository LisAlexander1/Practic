   M S B A M L   `   `   `  ����B  >Practic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Practic.HelpersPractic.Helpers  5      9!clr-namespace:Practic.Views.PagesPractic.Views.Pages  5      '    !Practic.Views.Pages.DashboardPage   5      W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1helpersclr-namespace:Practic.Helpers     5      3local!clr-namespace:Practic.Views.Pages     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      A =Wpf.Ui, Version=3.0.0.0, Culture=neutral, PublicKeyToken=null/ui&http://schemas.lepo.co/wpfui/2022/xaml  5      R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5         TextFillColorPrimaryBrush  N� 
Foreground#  �   5       N� Title$ DashboardPage��5        ApplicationBackgroundBrush  Wpf.Ui.Markup.Design   
Background# �  5	         
Foreground# �   5
       � 	Resources 5      2  ,Practic.Helpers.BooleanToVisibilityConverter   BooleanToVisibilityConverter��%   &	         5   
   6/   5      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   � $��0��6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $
��Auto �6#   �� 5       $
��Auto �6#    5"      �� 5#      �� 5$      $
��Auto �6    .+�5&      �� $��0��5'      $��0��5(      $��4q�5)      ��5*      �� *ViewModel.UriString+ �� Mode$ TwoWay=��� 5+      $��Загрузить��5-      $��1��5.      $��0,4,4,4q�5/      $��Stretch=�50      $	��100��51      ��5,      �� *ViewModel.DownloadTextCommand+51      � 52      $��2��53      $��1��54      $��4��55      $��4,0,4,4q�57       � IsIndeterminate 56      �� *ViewModel.IsLoading+57      58      �� 59   
   	 �� AcceptsReturn$
	 True��5:      
 �� 
AcceptsTab$

 True��5;      $��1��5<      $	��350��5=      $��4,0,4,4q�5>       �� TextWrapping$
 Wrap=�5@      $��Stretch=�5A      " �� VerticalScrollBarVisibility$ Visible=�5B      ��5?      �� *ViewModel.BookText+$ TwoWay=�5B      � 5C   
   $��2��6   $��70��6    5D      �� 5E      �� 5F      .+�5H      �� $��Задача 1��5J      $��0��5K      $��Stretch=�5L      $��4,0,2,4q�5M      $	��Top=�5N      ��5I      �� *ViewModel.Task1Command+5N      �� 5O      $��Задача 2��5Q      $��1��5R      $��Stretch=�5S      $��2,0,4,4q�5T      $	��Top=�5U      ��5P      �� *ViewModel.Task2Command+5U      5V      5W      5X      