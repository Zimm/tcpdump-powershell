param(
	[Parameter(Mandatory=$true)][string]$TraceFilePath,
	[string]$FileExtension,
	[Byte]$IpProtocols,
	[Parameter(Mandatory=$true)][int32]$ListenTime,
	[Byte]$level,
	[string[]]$ipv4_address
)

if($level -eq 0) {
	$level = 6
}


$timestamp = Get-Date -f yyyy-MM-dd_HH-mm-ss
$filename = "$TraceFilePath\netcap-$timestamp"
New-NetEventSession -Name Session1 -LocalFilePath $TraceFilePath\netcap-$timestamp.etl -MaxFileSize 512  -CaptureMode SaveToFile 
Add-NetEventPacketCaptureProvider -SessionName Session1 -level $level -IpAddresses $ipv4_address
Add-NetEventProvider -Name "Microsoft-Windows-TCPIP" -SessionName Session1 -level $level 
Add-NetEventProvider -Name 'Microsoft-Windows-SMBClient' -level $level -SessionName Session1 
Start-NetEventSession -Name Session1 
Start-Sleep($ListenTime)
Stop-NetEventSession -Name Session1
Remove-NetEventSession 

if($FileExtension -eq "cap") {
	$s = New-PefTraceSession -Path "$filename.Cap" -SaveOnStop
	$s | Add-PefMessageProvider -Provider “$TraceFilePath\netcap-$timestamp.etl”
	$s | Start-PefTraceSession
}

# SIG # Begin signature block
# MIIEMwYJKoZIhvcNAQcCoIIEJDCCBCACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUZB7kJOQRSZikEVY8ziFes/0e
# yACgggI9MIICOTCCAaagAwIBAgIQme+KLqdvWoBBTdBQNfew4jAJBgUrDgMCHQUA
# MCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdDAe
# Fw0xODA0MDExMzExMjhaFw0zOTEyMzEyMzU5NTlaMBoxGDAWBgNVBAMTD1Bvd2Vy
# U2hlbGwgVXNlcjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAnW+xflcWx9bQ
# uFip9QUGkX0gQOwOo5nCo5WCPTEqYeU9W8FKyH4oPpxZY8EL1P5j42ca5gg8R36o
# fLAZS5Z7ZpSJuizKTqtuvPupnnxe0lNZgYO8t9rh2D7ZY7CWyiqJCWyvrOLk3ftD
# 5wSysXkJ1YWOpsgj0VqKPfQek7nGGUkCAwEAAaN2MHQwEwYDVR0lBAwwCgYIKwYB
# BQUHAwMwXQYDVR0BBFYwVIAQ5NwlOwpAik5toFcQ6X+Fr6EuMCwxKjAoBgNVBAMT
# IVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdIIQDvgwn7IAwZ5BnqyX
# DMmAYjAJBgUrDgMCHQUAA4GBAAGAOUWF8Wux8KI199yLgVZc7k5BkceOWNkoOoVo
# GYNoYZzCEIN02ajnHBE4zSobWtrabmXgZfJqGZQ5hCztlWKJOpaDP/Zi1x27EvvO
# ZsjFUuk7YhHyIuB1WcvG/n9tugXOHMriiHvKjQpYfEETeOxifedy0iTyNyiPPRDO
# pi7uMYIBYDCCAVwCAQEwQDAsMSowKAYDVQQDEyFQb3dlclNoZWxsIExvY2FsIENl
# cnRpZmljYXRlIFJvb3QCEJnvii6nb1qAQU3QUDX3sOIwCQYFKw4DAhoFAKB4MBgG
# CisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcC
# AQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYE
# FJbV7npp2BOYBu1I5mfMmbgW1N9iMA0GCSqGSIb3DQEBAQUABIGAAPbN4dAmql+h
# KtFniZRIEnUPLX67b0xvJQPB7F5lHAuaaguOeEFBCgD7IjvQBnaEuzgAioitMs/U
# TQY4pwtmBAHAGooyhsoXE0mKEviHiKc4OyFpgOpAZZxqBgo1WaQzAxHb/o1Q5Dpk
# uv3Q1kAlBhK0hfPbH8x7SAtOri7An+k=
# SIG # End signature block
