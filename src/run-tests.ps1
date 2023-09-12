Get-ChildItem -Path ./StackOverflow/Tests -Force | ForEach-Object -Process {
    Invoke-Sqlcmd -InputFile $_.FullName -ConnectionString "Data Source=localhost;Initial Catalog=WideWorldImporters;User Id=sa;Password=Password123!;TrustServerCertificate=true"
}