<#
.SYNOPSIS
    Starts Microsoft Remote Assistance
.DESCRIPTION
    This function is set to work with the helpdesk mode of Windows Remote Assistance. You can either enter a computer name and the function will attempt to start a connection to the remote computer. If no computer name is specified Windows Remote Assistance will open to the Advanced Help Desk Mode, which is where you can enter a computer name to connect to.
.PARAMETER  ComputerName
    This parameter is for the remote computer you wish to connect to. By default if you don’t specify a remote computer Windows Remote Assistant will open up to the helpdesk screen.
.EXAMPLE
    PS C:\> Start-MSRA computer1
    
    Description
    -----------
    This example shows how to call the Start-MSRA function and automatically connect to the remote computer.
.NOTES
    Author: Matthew J. DeGarmo
    GitHub: https://github.com/matthewjdegarmo
#>
Function Start-MSRA() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false,
            HelpMessage = 'This is the remote computer you wish to connect to.')]
        [Alias('CN')]
        [string]
        $ComputerName = ""
    )
	
    If ($ComputerName -eq "") {
        Start-Process -FilePath "C:\Windows\System32\msra.exe" -Args "/Offerra"
    }
    Else {
        If (Test-Connection -ComputerName $ComputerName -Count 2 -Quiet) {
            Start-Process -FilePath "C:\Windows\System32\msra.exe" -Args "/Offerra \\$ComputerName"
        }
        Else {
            Return "Failed to Connect to $ComputerName"
        }
    }
}#End Function: Start-MSRA








# SIG # Begin signature block
# MIIPcgYJKoZIhvcNAQcCoIIPYzCCD18CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUNzz7sruC4V/SYu2Q9RTexMmr
# EGKgggzlMIIGXzCCBUegAwIBAgIKFf/aSAACAACzwTANBgkqhkiG9w0BAQsFADBI
# MRMwEQYKCZImiZPyLGQBGRYDY29tMRcwFQYKCZImiZPyLGQBGRYHbnBwZG5ldDEY
# MBYGA1UEAxMPTlBQRElzc3VpbmdDQTA0MB4XDTE4MTAwNjAxMTkwMVoXDTIwMTAw
# NTAxMTkwMVowJTEjMCEGA1UEAwwaRGVHYXJtbywgTWF0dGhldyBKLiBbRGFzaF0w
# ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIUpGz5BW0vsL9Y6oO3lKl
# eM7a6z51Ndn/HMljhxNvrMPH/w9olw6pMn8wnBSxoBzu0X0eO1t6ysl8M5ZeXOnh
# t6Kx7R0EhVL4qyggnxUjEVP8ltY9D5vSgGfI9uulZSejHxcfeNOEfLap2v4ou6lH
# g1OR9wdjCgCWUKUk4Gij+/GJQmudKtDyOEUIvFZbJw9f3mGUSZKjWXTB8I9FYF/I
# NGD9tsnxkQs7e/aZmA7W4K4ul6wGsjGhqG7P5acqKcM47murc2g0kdvoqcVEry/2
# K4TPvpxs71Z8HsiHVIJxcsnfUMW0x7hr0iEmsTW028T3aE0R1otfdV2Xt4AgRNDF
# AgMBAAGjggNsMIIDaDA9BgkrBgEEAYI3FQcEMDAuBiYrBgEEAYI3FQiFlIobhO3q
# F4T9iy6E3NB3hoKqPYFChKb1RNyscAIBZAIBAjATBgNVHSUEDDAKBggrBgEFBQcD
# AzALBgNVHQ8EBAMCB4AwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAdBgNV
# HQ4EFgQUz191vSEkuETcmSi2TdUbsLE3MVcwHwYDVR0jBBgwFoAUSFVgCJ/28xHg
# RU3XdEatEBPTNUYwggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaBumxkYXA6
# Ly8vQ049TlBQRElzc3VpbmdDQTA0KDIpLENOPVlPQ1NFQzIyLENOPUNEUCxDTj1Q
# dWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
# aW9uLERDPW5wcGRuZXQsREM9Y29tP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/
# YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludIY9aHR0cDovL1lP
# Q1NFQzIyLm5wcGRuZXQuY29tL0NlcnRFbnJvbGwvTlBQRElzc3VpbmdDQTA0KDIp
# LmNybIYzaHR0cDovL3d3dy5ucHBkLmNvbS9jZXJ0ZGF0YS9OUFBESXNzdWluZ0NB
# MDQoMikuY3JsMIIBIwYIKwYBBQUHAQEEggEVMIIBETCBrgYIKwYBBQUHMAKGgaFs
# ZGFwOi8vL0NOPU5QUERJc3N1aW5nQ0EwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5
# JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ucHBk
# bmV0LERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlm
# aWNhdGlvbkF1dGhvcml0eTBeBggrBgEFBQcwAoZSaHR0cDovL1lPQ1NFQzIyLm5w
# cGRuZXQuY29tL0NlcnRFbnJvbGwvWU9DU0VDMjIubnBwZG5ldC5jb21fTlBQRElz
# c3VpbmdDQTA0KDIpLmNydDAzBgNVHREELDAqoCgGCisGAQQBgjcUAgOgGgwYLW1q
# ZGVnYXJAcHJkLm5wcGRuZXQuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQDOHwyouXYs
# 9QTPaMWrLX5SYsTkngrDHVyQUHyct5TVMahP7Q2pGY1w5CppD3youXBaEBi25EFx
# Oa78Bx8LTLaNr2i6Oku4fhjAtPuosB7TL8ODGCDK1kif20isPr3DIs2ke3rtBg/9
# 7AHm50RQ0hVN7xEKc+WNsOM954oa7D7pMvtwn3L4hxo61Xd6TyzPxD3PcEdN3k1L
# /qX0oIK7I/imAalAGZTtVgsTopVbXUkSGfL09kRjiWSi3NvM3BaYQXCsxKAp2FEL
# 2R1/zTDohqgX4mpoRkz8kn23/MY+y9hpsAyVrIrVqCRq4oxu1wU99jJ7jFlbnOJM
# d+6EJ922c65jMIIGfjCCBGagAwIBAgITfgAAAB64lTWnpHAKdwAAAAAAHjANBgkq
# hkiG9w0BAQsFADBFMRMwEQYKCZImiZPyLGQBGRYDQ09NMRcwFQYKCZImiZPyLGQB
# GRYHTlBQRE5FVDEVMBMGA1UEAxMMTlBQRCBSb290IENBMB4XDTE3MDIxNjE3MzMy
# MloXDTI2MDQxMjE1MDkyMlowSDETMBEGCgmSJomT8ixkARkWA2NvbTEXMBUGCgmS
# JomT8ixkARkWB25wcGRuZXQxGDAWBgNVBAMTD05QUERJc3N1aW5nQ0EwNDCCASIw
# DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOXe5B2JHpAAEzLgy24VkpOqj+ZO
# a/7yr50h5YIbX3h5gBybFmiLPtIVq+HBhxmhtPoQ63RCTv6S+sDMyFgUilqos2DO
# TusRCb4bv/0YODGSqZn+GlXULeC5wzzENmS0X2cz/9ld4RQ0XH4x3aUFfStMvkte
# 9yd4cCCC1ZnZQLMJOhWTxVpYy7D/I4RqUuQ4stBNsvbz1oAQLygnhGqmuOEGzJF8
# 32d7y2uyTAVPvxQm/7q7+VZTsAMuDPaFvP7I4nv0XPPxWYwqtA1h5bKGttj3AoaT
# odckmwVwBWwo3gH4cbHTC7rfjEFcMQplqD1WHNYzyVlKrsq/q9RnZKRvO1MCAwEA
# AaOCAmIwggJeMBIGCSsGAQQBgjcVAQQFAgMCAAIwIwYJKwYBBAGCNxUCBBYEFOlz
# eL6Rr6Hsy5CLV3/qQs1sx9kjMB0GA1UdDgQWBBRIVWAIn/bzEeBFTdd0Rq0QE9M1
# RjCBpAYDVR0gBIGcMIGZMIGWBggrBgEEAYHHNzCBiTBUBggrBgEFBQcCAjBIHkYA
# TgBQAFAARAAgAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAFAAcgBhAGMAdABpAGMA
# ZQAgAFMAdABhAHQAZQBtAGUAbgB0MDEGCCsGAQUFBwIBFiVodHRwOi8vd3d3Lm5w
# cGQuY29tL2NlcnRkYXRhL2Nwcy5hc3AAMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIA
# QwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFGoL
# RkNmrxkdscuqKeDTRJT809irMD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly93d3cu
# bnBwZC5jb20vY2VydGRhdGEvTlBQRF9Sb290X0NBLmNybDCBwgYIKwYBBQUHAQEE
# gbUwgbIwga8GCCsGAQUFBzAChoGibGRhcDovLy9DTj1OUFBEJTIwUm9vdCUyMENB
# LENOPUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxj
# bj1Db25maWd1cmF0aW9uLERDPU5QUERORVQsREM9Q09NP2NBQ2VydGlmaWNhdGU/
# YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MA0GCSqGSIb3
# DQEBCwUAA4ICAQBe8E00MQYC5W50b0tMisEhAc/GXj5iFSA6Zf61QwQ8ynFcwcaz
# FaNjt//iF23r1fmo/lC09jIgCsZHPQhzP0h5Dhb+LhNvv2m+Xl+hrWGGreAfzOfl
# HnbS3gX8QQpP9Td2oEyRGZj/c68OmB7hkEc5O3qRN47oRpwXZ2wA6Chp+I7RO1jz
# 42RLnEAdgyG+5CvsLg7mLg6xwPH2SAje9X2o1hc63g2fCYwAs4AfX/+yLM4OFeGs
# MRzNWDls89f3Jizk3SQW4rw6JI1O/mFTgvE0iCmzkpRoL0t+1o13vymCeOKLu6+Z
# 1VEA+LT2hUvykn8SCDXrecixg3XKDXx1wjJS6vKWj7awRwlLWW9GHGfROSWCAb5R
# Kmr+Vpsle+DIIOadKdp/8RsZ50RO8vuTbwkUyiGG/oSEQqC061iNDV5m8NyUs1yK
# l7CGQbDkXfRixRK2bEHT4f37tB/ZkHgD2wdRso6VOBRSCWzsTHPBgjSZTt/EHUq7
# tWmSiS7v0FZXCiW9KjParz+D89iYk0z0kdMTJm9utegXTP3fXpQ1BGwavz/urYy2
# eULOz7quh1hzW7fWJEsndUtHR0UCowEvAE0tZUAAsp5binmkBgUl+zFstKSmD+WF
# LrJZ8BltKMA2bRizYsXZdpQI/n+o4CwpNHT/Hf4vAQTZPWLHMKnvEX02cTGCAfcw
# ggHzAgEBMFYwSDETMBEGCgmSJomT8ixkARkWA2NvbTEXMBUGCgmSJomT8ixkARkW
# B25wcGRuZXQxGDAWBgNVBAMTD05QUERJc3N1aW5nQ0EwNAIKFf/aSAACAACzwTAJ
# BgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0B
# CQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAj
# BgkqhkiG9w0BCQQxFgQU0sjeyWcFrmeUVq1wfHDDNkocX40wDQYJKoZIhvcNAQEB
# BQAEggEAY8W6jLFK1+55u+Cj3167X3C25yps2hUgC7+xZjPcl2za020dg7qpw/eb
# Uy0b5pcOMNn0IIshmaYsGunIfEu0DMAJ60+BMG94hwy2ilGo3x/GjNb642Uh9PWS
# CiWya/17rigVqDuT9ncWEKbo5KprTKOeo/s1cqj2V9Rl8/hLCoSFiutJwB9H6SYd
# yyDSTzU65Z6yGg7JXt7Xztt3FcIdbyjHfXODk0S/dbVj81YQZlXYbd4RaARfALV4
# oFyjh0G3hg7L0+O08WtFXjapfDmI4era1nmfuF4EuP6zJgPw5gYUlN3jfQ83HwOR
# j3waIgNwq6gPCcNRE3ztbLA66uw9sg==
# SIG # End signature block
