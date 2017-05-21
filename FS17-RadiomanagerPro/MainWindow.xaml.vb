Imports System.IO
Imports System.Net
Imports Newtonsoft.Json
Class MainWindow
    Private Sub btnSearch_Click(sender As Object, e As RoutedEventArgs) Handles btnSearch.Click
        Dim url = "http://www.radio-browser.info/webservice/json/stations/byname/" + textBox.Text
        Dim request As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        request.Method = WebRequestMethods.Http.[Get]
        request.UserAgent = "FS17-Radiomanager/1.0"
        request.ContentType = "application/json; charset=utf-8"

        Dim sJsonAnswer As String
        Dim response = DirectCast(request.GetResponse(), HttpWebResponse)

        Using sr = New StreamReader(response.GetResponseStream())
            sJsonAnswer = sr.ReadToEnd()
        End Using
        Dim Radiostations As List(Of Searchresult) = DirectCast(JsonConvert.DeserializeObject(sJsonAnswer, GetType(List(Of Searchresult))),
            List(Of Searchresult))
        Dim view As CollectionView = CollectionViewSource.GetDefaultView(Radiostations)
        ' view.GroupDescriptions.Add(New PropertyGroupDescription("Name"))
        resultView.ItemsSource = view
    End Sub

    Private Sub _AddStation(sender As Object, e As RoutedEventArgs)
        Dim url As String = DirectCast(DirectCast(e.Source, MenuItem).CommandParameter, Searchresult).url
        Dim sStationName As String = DirectCast(DirectCast(e.Source, MenuItem).CommandParameter, Searchresult).name
        _AddToFS17(url, sStationName)
    End Sub

    Private Sub _StationHomepage(sender As Object, e As RoutedEventArgs)
        Dim url As String = DirectCast(DirectCast(e.Source, MenuItem).CommandParameter, Searchresult).homepage
        Process.Start(url)
    End Sub

    Private Sub _AddToFS17(url As String, ByVal sName As String)
        Dim sFilename As String = "streamingInternetRadios.xml"
        Dim sDirectory As String = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\my games\FarmingSimulator2017\music"
        Dim sFullpath = Path.Combine(sDirectory, sFilename)
        If File.Exists(sFullpath) Then
            Try
                Dim doc As XDocument = XDocument.Load(sFullpath)
                Dim root As New XElement("streamingInternetRadio")
                Dim comm As XComment = New XComment(sName)
                root.Add(comm)
                root.Add(New XAttribute("href", url))
                doc.Element("streamingInternetRadios").Add(root)
                doc.Save(sFullpath)
                MsgBox($"{sName} successfully added.")
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
    End Sub
End Class
