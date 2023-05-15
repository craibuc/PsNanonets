<#

.LINK
https://app.nanonets.com/api/v2/Inferences/Model/{{ocr_predict_model_id}}/ImageLevelInferences/{{ocr_predict_page_id}}

#>

function Get-NanonetsPrediction {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ApiKey,

        [Parameter(Mandatory)]
        [string]$ModelId,

        [Parameter(Mandatory)]
        [string]$PageId
    )
            
    $Headers = @{
        Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($ApiKey):$password"))
    }
    Write-Debug "Headers: $Headers"
    
    $Uri = "https://app.nanonets.com/api/v2/Inferences/Model/{0}/ImageLevelInferences/{1}" -f $ModelId, $PageId
    Write-Debug "Uri: $Uri"

    $Response = Invoke-WebRequest -Uri $Uri -Method Get -Headers $Headers
    $Content = $Response.Content | ConvertFrom-Json
    $Content

}