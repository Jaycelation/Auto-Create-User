$domain = "TAIDD251"

$ouBase = "DC=TAIDD251,DC=it"
$ouPtit = "OU=ptit,$ouBase"
$ouATTT1 = "OU=ATTT1,$ouPtit"
$ouCNTT1 = "OU=CNTT1,$ouPtit"

if (-not (Get-ADOrganizationalUnit -Filter {Name -eq "ptit"} -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "ptit" -Path $ouBase
}

if (-not (Get-ADOrganizationalUnit -Filter {Name -eq "ATTT1"} -SearchBase $ouPtit -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "ATTT1" -Path $ouPtit
}

if (-not (Get-ADOrganizationalUnit -Filter {Name -eq "CNTT1"} -SearchBase $ouPtit -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "CNTT1" -Path $ouPtit
}

$usersATTT1 = @(
    "AnhLQ015", "AnhND017", "BaoDG027", "BaoND030", "BaoNK031",
    "BaoTQ034", "BinhTT037", "CuongHM039", "DaiLD071", "DatNT077"
)

foreach ($username in $usersATTT1) {
    if (-not (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue)) {
        New-ADUser -Name $username `
                   -GivenName $username `
                   -Surname "Surname" `
                   -SamAccountName $username `
                   -UserPrincipalName "$username@$domain.com" `
                   -Path $ouATTT1 `
                   -AccountPassword (ConvertTo-SecureString "1" -AsPlainText -Force) `
                   -PasswordNeverExpires $true `
                   -Enabled $true
    }
}

$usersCNTT1 = @(
    "AnhHK016", "BangPV057", "BinhPT084", "MaiNTH515", "ChinhTD115"
)

foreach ($username in $usersCNTT1) {
    if (-not (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue)) {
        New-ADUser -Name $username `
                   -GivenName $username `
                   -Surname "Surname" `
                   -SamAccountName $username `
                   -UserPrincipalName "$username@$domain.com" `
                   -Path $ouCNTT1 `
                   -AccountPassword (ConvertTo-SecureString "1" -AsPlainText -Force) `
                   -PasswordNeverExpires $true `
                   -Enabled $true
    }
}
