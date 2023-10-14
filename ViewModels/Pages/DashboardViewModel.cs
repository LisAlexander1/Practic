// This Source Code Form is subject to the terms of the MIT License.
// If a copy of the MIT was not distributed with this file, You can obtain one at https://opensource.org/licenses/MIT.
// Copyright (C) Leszek Pomianowski and WPF UI Contributors.
// All Rights Reserved.

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Windows.Threading;
using Wpf.Ui.Controls;

namespace Practic.ViewModels.Pages
{
    public partial class DashboardViewModel : ObservableObject
    {

        private ISnackbarService _snackbarService { get; set; }
        
        [ObservableProperty]
        private string _uriString = "https://www.gutenberg.org/cache/epub/23218/pg23218.txt";

        [ObservableProperty]
        private string _bookText = "";
        
        [ObservableProperty]
        private bool _isLoading = false;

        public DashboardViewModel(ISnackbarService snackbarService)
        {
            _snackbarService = snackbarService;
        }

        [RelayCommand]
        private void DownloadText()
        {
            IsLoading = true;
            try
            {
                var httpClient = new HttpClient();
                using var request = new HttpRequestMessage(HttpMethod.Get, new Uri(UriString));
                var response = httpClient.SendAsync(request);

                response.ContinueWith(task =>
                {
                    if (!task.IsCanceled)
                    {
                        if (!task.Result.IsSuccessStatusCode)
                        {
                            Application.Current.Dispatcher?.Invoke(
                                () => _snackbarService.Show("Error", $"Код ошибки: {task.Result.StatusCode}",ControlAppearance.Caution));
                        }

                        task.Result.Content.ReadAsStringAsync().ContinueWith(task => BookText = task.Result);
                    }
                    else
                    {
                        Application.Current.Dispatcher?.Invoke(
                            () => _snackbarService.Show("Error", $"Нет ответа",ControlAppearance.Caution));
                    }
                    IsLoading = false;
                });
            }
            catch (UriFormatException e)
            {
                _snackbarService.Show("Неправильный формат ссылки", e.Message, ControlAppearance.Caution);
            }
            
        }

        [RelayCommand]
        private void Task1()
        {
            var task = Task.Factory.StartNew(() => BookText = $"«{BookText}»");
        }
        
        [RelayCommand]
        private void Task2()
        {
            IsLoading = true;
            var task = Task.Factory.StartNew(InsertSymbolAfterLetter);

            task.ContinueWith(task =>
            {
                BookText = task.Result;
                IsLoading = false;

            });
        }

        private string InsertSymbolAfterLetter()
        {
            
            var result = "";
            foreach (var symbol in BookText)
            {
                result += symbol;
                if (symbol >= 65 && symbol <= 90 || symbol >= 97 && symbol <= 122)
                {
                    result += "»";
                }
            }

            return result;
        }
    }
}
