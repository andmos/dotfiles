# Set up Atom in windows
Copy-Item config.cson ~/.atom 
Copy-Item styles.less ~/.atom

$lines = Get-Content atomPackages.txt
$lines | % {
    & apm install $_
}