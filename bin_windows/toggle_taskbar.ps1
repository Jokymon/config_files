# ============================================================
# toggle-taskbar-multimon.ps1
# Smoothly toggles "Show my taskbar on all displays"
# without restarting Explorer (minimal flicker)
# ============================================================

# Registry key for the taskbar multi-monitor setting
$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$ValueName = "MMTaskbarEnabled"

# Read current value (default to 0 if not present)
try {
    $current = (Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction Stop).$ValueName
} catch {
    $current = 0
}

# Toggle the value
$new = if ($current -eq 1) { 0 } else { 1 }
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $new

Write-Host "Set 'Show taskbar on all displays' to: $new"

# ------------------------------------------------------------
# Send Windows the same change notification the Settings app uses
# This avoids restarting Explorer and prevents the black-screen flash
# ------------------------------------------------------------
if (-not ([System.Management.Automation.PSTypeName]'NativeMethods').Type) {
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    
    public class NativeMethods {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern IntPtr SendMessageTimeout(
            IntPtr hWnd,
            uint Msg,
            UIntPtr wParam,
            UIntPtr lParam,
            uint fuFlags,
            uint uTimeout,
            out UIntPtr result
        );
    }
"@
}

$HWND_BROADCAST = [IntPtr]0xffff
$WM_SETTINGCHANGE = 0x1A

[UIntPtr]$result = [UIntPtr]::Zero

# Broadcast "settings changed" to all top-level windows
[NativeMethods]::SendMessageTimeout(
    $HWND_BROADCAST,
    $WM_SETTINGCHANGE,
    [UIntPtr]::Zero,
    [UIntPtr]::Zero,
    1,
    1000,
    [ref]$result
) | Out-Null

Write-Host "Refresh notification sent. Taskbar updated."
# ============================================================
