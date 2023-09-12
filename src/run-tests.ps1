Get-ChildItem -Path ./src/Tests/WideWorldImporters -Force | ForEach-Object -Process {
    Invoke-Sqlcmd -InputFile $_.FullName -ConnectionString "Data Source=localhost;Initial Catalog=WideWorldImporters;User Id=sa;Password=Password123!;TrustServerCertificate=true"
}