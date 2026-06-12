# 1. Configuración e Icono
$AppId = "MiDescargador.Youtube.GUI"
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$icoPath = "C:\YTDLP\logo.ico"
$icon = $null
if (Test-Path $icoPath) { $icon = New-Object Drawing.Icon($icoPath) }

# 2. Carpeta de destino
$destino = "C:\YTDLP\Videos"
$folderThumbs = "C:\YTDLP\.thumbs" 
if (!(Test-Path $folderThumbs)) { New-Item -ItemType Directory -Force -Path $folderThumbs }

# 3. Formulario
$form = New-Object System.Windows.Forms.Form
if ($icon) { $form.Icon = $icon }
$form.Text = "Descargador Pro v3.9.6"
$form.Size = New-Object System.Drawing.Size(450, 600)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "None" 
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)

$colorRojo = [System.Drawing.Color]::FromArgb(200, 0, 0)

# --- BARRA DE TÍTULO ---
$pnlTitle = New-Object System.Windows.Forms.Panel
$pnlTitle.Size = New-Object System.Drawing.Size(450, 35)
$pnlTitle.BackColor = [System.Drawing.Color]::Black
$pnlTitle.Location = New-Object System.Drawing.Point(0, 0)

$btnClose = New-Object System.Windows.Forms.Label
$btnClose.Text = "X"; $btnClose.ForeColor = [System.Drawing.Color]::White; $btnClose.TextAlign = "MiddleCenter"
$btnClose.Size = New-Object System.Drawing.Size(35, 35); $btnClose.Location = New-Object System.Drawing.Point(415, 0); $btnClose.Cursor = "Hand"
$btnClose.Add_Click({ $form.Close() })
$btnClose.Add_MouseEnter({ $btnClose.BackColor = [System.Drawing.Color]::FromArgb(232, 17, 35) })
$btnClose.Add_MouseLeave({ $btnClose.BackColor = [System.Drawing.Color]::Black })
$pnlTitle.Controls.Add($btnClose)

$btnMinimize = New-Object System.Windows.Forms.Label
$btnMinimize.Text = "_"; $btnMinimize.ForeColor = [System.Drawing.Color]::White; $btnMinimize.TextAlign = "MiddleCenter"
$btnMinimize.Size = New-Object System.Drawing.Size(35, 35); $btnMinimize.Location = New-Object System.Drawing.Point(380, 0); $btnMinimize.Cursor = "Hand"
$btnMinimize.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$btnMinimize.Add_Click({ $form.WindowState = [System.Windows.Forms.FormWindowState]::Minimized })
$btnMinimize.Add_MouseEnter({ $btnMinimize.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$btnMinimize.Add_MouseLeave({ $btnMinimize.BackColor = [System.Drawing.Color]::Black })
$pnlTitle.Controls.Add($btnMinimize)

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "PRO DOWNLOADER YT V3.9.6"; $lblTitle.ForeColor = $colorRojo; $lblTitle.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$lblTitle.Location = New-Object System.Drawing.Point(15, 8); $lblTitle.AutoSize = $true
$pnlTitle.Controls.Add($lblTitle)

$mouseDown = $false
$pnlTitle.Add_MouseDown({ $script:mouseDown = $true; $script:offsetX = [System.Windows.Forms.Cursor]::Position.X - $form.Left; $script:offsetY = [System.Windows.Forms.Cursor]::Position.Y - $form.Top })
$pnlTitle.Add_MouseMove({ if ($script:mouseDown) { $form.Left = [System.Windows.Forms.Cursor]::Position.X - $script:offsetX; $form.Top = [System.Windows.Forms.Cursor]::Position.Y - $script:offsetY } })
$pnlTitle.Add_MouseUp({ $script:mouseDown = $false })
$form.Controls.Add($pnlTitle)

# --- FUNCIÓN DE DESCARGA ---
function Start-Download {
    param ([string]$Url, [string]$ExtraArgs = "")
    if ([string]::IsNullOrWhiteSpace($Url)) { return }
    
    $pnlProgressBar.Width = 0
    $pnlProgressBack.Visible = $true
    $timer.Start()
    
    $btnDescargar.Enabled = $false; $btnSoloVideo.Enabled = $false; $btnTodaPlaylist.Enabled = $false

    $exe = "C:\YTDLP\yt-dlp.exe"
    $thumbArg = "--write-thumbnail --convert-thumbnails jpg -o `"thumbnail:$folderThumbs/%(title)s.%(ext)s`""
    $output = "-o `"$destino\%(title)s.%(ext)s`""
    
    if ($rb1.Checked) { $formatArgs = "-f `"bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]`" --merge-output-format mp4" }
    elseif ($rb2.Checked) { $formatArgs = "-f `"bv+ba/b`" --merge-output-format mkv" }
    elseif ($rb3.Checked) { $formatArgs = "-x --audio-format mp3 --audio-quality 0" }
    elseif ($rb4.Checked) { $formatArgs = "-x --audio-format wav" }

    $job = Start-Job -ScriptBlock {
        param($e, $a, $u)
        Start-Process $e -ArgumentList "$a $u" -Wait -WindowStyle Hidden
    } -ArgumentList $exe, "$ExtraArgs $formatArgs $thumbArg $output", $Url
    
    while ($job.State -eq "Running") { [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 100 }
    Receive-Job $job
    
    $timer.Stop()
    $pnlProgressBar.Width = 370
    $lblStatus.Text = "FINALIZADO CON ÉXITO" # Corregido: Tilde
    $lblStatus.ForeColor = [System.Drawing.Color]::White # Corregido: Blanco
    
    $btnDescargar.Enabled = $true; $btnSoloVideo.Enabled = $true; $btnTodaPlaylist.Enabled = $true
    
    # Recargar historial para quitar el mensaje de "vació" si es la primera descarga
    Load-Initial-History
}

# --- UI ELEMENTOS ---
$fontEtiqueta = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$fontOpciones = New-Object System.Drawing.Font("Segoe UI", 10)

$label = New-Object System.Windows.Forms.Label
$label.Text = "Pega la URL del video aqui:"; $label.Font = $fontEtiqueta; $label.ForeColor = [System.Drawing.Color]::White
$label.Location = New-Object System.Drawing.Point(30, 55); $label.AutoSize = $true
$form.Controls.Add($label)

$urlInput = New-Object System.Windows.Forms.TextBox
$urlInput.Location = New-Object System.Drawing.Point(30, 85); $urlInput.Size = New-Object System.Drawing.Size(290, 25)
$urlInput.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48); $urlInput.ForeColor = [System.Drawing.Color]::White
$urlInput.BorderStyle = "FixedSingle"; $urlInput.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$form.Controls.Add($urlInput)

$urlInput.Add_TextChanged({
    if ($urlInput.Text -match "list=") {
        $btnDescargar.Visible = $false; $btnCarpeta.Visible = $false
        $btnSoloVideo.Visible = $true; $btnTodaPlaylist.Visible = $true
        $lblStatus.Text = "LISTA DETECTADA"; $lblStatus.ForeColor = [System.Drawing.Color]::Orange
    } else {
        $btnDescargar.Visible = $true; $btnCarpeta.Visible = $true
        $btnSoloVideo.Visible = $false; $btnTodaPlaylist.Visible = $false
        $lblStatus.Text = ""
    }
})

$btnPegar = New-Object System.Windows.Forms.Button
$btnPegar.Text = "P"; $btnPegar.Location = New-Object System.Drawing.Point(325, 84); $btnPegar.Size = New-Object System.Drawing.Size(35, 25)
$btnPegar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60); $btnPegar.ForeColor = [System.Drawing.Color]::White; $btnPegar.FlatStyle = "Flat"
$btnPegar.FlatAppearance.BorderSize = 0; $btnPegar.Add_Click({ $urlInput.Text = [System.Windows.Forms.Clipboard]::GetText() })
$btnPegar.Add_MouseEnter({ $btnPegar.BackColor = $colorRojo }); $btnPegar.Add_MouseLeave({ $btnPegar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$form.Controls.Add($btnPegar)

$btnLimpiar = New-Object System.Windows.Forms.Button
$btnLimpiar.Text = "X"; $btnLimpiar.Location = New-Object System.Drawing.Point(365, 84); $btnLimpiar.Size = New-Object System.Drawing.Size(35, 25)
$btnLimpiar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60); $btnLimpiar.ForeColor = [System.Drawing.Color]::White; $btnLimpiar.FlatStyle = "Flat"
$btnLimpiar.FlatAppearance.BorderSize = 0
$btnLimpiar.Add_Click({ 
    $urlInput.Text = ""
    $lblStatus.Text = "" # Limpia el estado al borrar URL
    $pnlProgressBack.Visible = $false # Esconde la barra
})
$btnLimpiar.Add_MouseEnter({ $btnLimpiar.BackColor = $colorRojo }); $btnLimpiar.Add_MouseLeave({ $btnLimpiar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$form.Controls.Add($btnLimpiar)

# Barra de progreso
$pnlProgressBack = New-Object System.Windows.Forms.Panel
$pnlProgressBack.Location = New-Object System.Drawing.Point(30, 115); $pnlProgressBack.Size = New-Object System.Drawing.Size(370, 12); $pnlProgressBack.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48); $pnlProgressBack.Visible = $false
$form.Controls.Add($pnlProgressBack)

$pnlProgressBar = New-Object System.Windows.Forms.Panel
$pnlProgressBar.Size = New-Object System.Drawing.Size(0, 12); $pnlProgressBar.BackColor = $colorRojo
$pnlProgressBack.Controls.Add($pnlProgressBar)

$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Location = New-Object System.Drawing.Point(30, 130); $lblStatus.Size = New-Object System.Drawing.Size(370, 20); $lblStatus.ForeColor = [System.Drawing.Color]::White; $lblStatus.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Bold); $lblStatus.TextAlign = "MiddleCenter"
$form.Controls.Add($lblStatus)

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 50
$timer.Add_Tick({ if ($pnlProgressBar.Width -lt 370) { $pnlProgressBar.Width += 5 } })

# Formato
$groupBox = New-Object System.Windows.Forms.GroupBox
$groupBox.Text = " Formato y Calidad "; $groupBox.Font = $fontEtiqueta; $groupBox.ForeColor = $colorRojo; $groupBox.Location = New-Object System.Drawing.Point(30, 155); $groupBox.Size = New-Object System.Drawing.Size(370, 175)
$form.Controls.Add($groupBox)

function Add-DarkRadio {
    param($text, $top, $checked=$false)
    $rb = New-Object System.Windows.Forms.RadioButton
    $rb.Text = $text; $rb.Font = $fontOpciones; $rb.ForeColor = [System.Drawing.Color]::White; $rb.Location = New-Object System.Drawing.Point(25, $top); $rb.Size = New-Object System.Drawing.Size(320, 25); $rb.Checked = $checked
    $groupBox.Controls.Add($rb); return $rb
}
$rb1 = Add-DarkRadio "Video MP4 (Mejor Calidad + Audio)" 30 $true
$rb2 = Add-DarkRadio "Video MKV (Maxima Calidad)" 60
$rb3 = Add-DarkRadio "Audio MP3 (Alta Calidad)" 90
$rb4 = Add-DarkRadio "Audio WAV (Sin perdida)" 120

function Set-RedBtn ($btn) {
    $btn.BackColor = $colorRojo; $btn.ForeColor = [System.Drawing.Color]::White; $btn.FlatStyle = "Flat"; $btn.FlatAppearance.BorderSize = 0; $btn.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold); $btn.Cursor = "Hand"
}

$btnDescargar = New-Object System.Windows.Forms.Button
$btnDescargar.Text = "DESCARGAR AHORA"; $btnDescargar.Location = New-Object System.Drawing.Point(30, 345); $btnDescargar.Size = New-Object System.Drawing.Size(370, 50)
Set-RedBtn $btnDescargar
$btnDescargar.Add_Click({ $lblStatus.Text = "DESCARGANDO..."; $lblStatus.ForeColor = [System.Drawing.Color]::White; Start-Download -Url $urlInput.Text -ExtraArgs "--no-playlist" })
$form.Controls.Add($btnDescargar)

$btnCarpeta = New-Object System.Windows.Forms.Button
$btnCarpeta.Text = "ABRIR CARPETA DE VIDEOS"; $btnCarpeta.Location = New-Object System.Drawing.Point(30, 410); $btnCarpeta.Size = New-Object System.Drawing.Size(370, 40)
Set-RedBtn $btnCarpeta
$btnCarpeta.Add_Click({ explorer.exe $destino })
$form.Controls.Add($btnCarpeta)

# Playlist Buttons
$btnSoloVideo = New-Object System.Windows.Forms.Button
$btnSoloVideo.Text = "DESCARGAR SOLO ESTE VIDEO"; $btnSoloVideo.Location = New-Object System.Drawing.Point(30, 345); $btnSoloVideo.Size = New-Object System.Drawing.Size(370, 50)
$btnSoloVideo.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60); $btnSoloVideo.ForeColor = [System.Drawing.Color]::White; $btnSoloVideo.FlatStyle = "Flat"; $btnSoloVideo.Visible = $false
$btnSoloVideo.Add_Click({ $lblStatus.Text = "Descargando individual..."; Start-Download -Url $urlInput.Text -ExtraArgs "--no-playlist" })
$form.Controls.Add($btnSoloVideo)

$btnTodaPlaylist = New-Object System.Windows.Forms.Button
$btnTodaPlaylist.Text = "DESCARGAR TODA LA LISTA"; $btnTodaPlaylist.Location = New-Object System.Drawing.Point(30, 410); $btnTodaPlaylist.Size = New-Object System.Drawing.Size(370, 40)
$btnTodaPlaylist.BackColor = [System.Drawing.Color]::DarkRed; $btnTodaPlaylist.ForeColor = [System.Drawing.Color]::White; $btnTodaPlaylist.FlatStyle = "Flat"; $btnTodaPlaylist.Visible = $false
$btnTodaPlaylist.Add_Click({ $lblStatus.Text = "Descargando lista completa..."; Start-Download -Url $urlInput.Text -ExtraArgs "--yes-playlist -o '$destino\%(playlist_title)s\%(title)s.%(ext)s'" })
$form.Controls.Add($btnTodaPlaylist)

# Historial
$lblHistorialTitle = New-Object System.Windows.Forms.Label
$lblHistorialTitle.Text = "ULTIMAS DESCARGAS (HAZ CLICK PARA ABRIR)"; $lblHistorialTitle.ForeColor = [System.Drawing.Color]::Gray; $lblHistorialTitle.Font = New-Object System.Drawing.Font("Segoe UI", 7, [System.Drawing.FontStyle]::Bold); $lblHistorialTitle.Location = New-Object System.Drawing.Point(30, 465); $lblHistorialTitle.AutoSize = $true
$form.Controls.Add($lblHistorialTitle)

$pnlHistorial = New-Object System.Windows.Forms.FlowLayoutPanel
$pnlHistorial.Location = New-Object System.Drawing.Point(20, 485); $pnlHistorial.Size = New-Object System.Drawing.Size(410, 90); $pnlHistorial.FlowDirection = "LeftToRight"; $pnlHistorial.WrapContents = $false
$form.Controls.Add($pnlHistorial)

function Add-To-History ($videoPath) {
    $thumbContainer = New-Object System.Windows.Forms.Panel; $thumbContainer.Size = New-Object System.Drawing.Size(125, 80)
    $pbThumb = New-Object System.Windows.Forms.PictureBox; $pbThumb.Size = New-Object System.Drawing.Size(115, 65); $pbThumb.SizeMode = "Zoom"; $pbThumb.Cursor = "Hand"; $pbThumb.Tag = $videoPath
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($videoPath)
    $thumbFile = Get-ChildItem -Path $folderThumbs -Filter "$baseName.*" | Where-Object { $_.Extension -match "jpg|png|webp" } | Select-Object -First 1
    if ($thumbFile) {
        $bytes = [System.IO.File]::ReadAllBytes($thumbFile.FullName)
        $pbThumb.Image = [System.Drawing.Image]::FromStream((New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)))
    } else { $pbThumb.BackColor = [System.Drawing.Color]::FromArgb(40,40,40) }
    $pbThumb.Add_Click({ Start-Process $this.Tag })
    $pbThumb.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::Red }); $pbThumb.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::Transparent })
    $thumbContainer.Controls.Add($pbThumb)
    if ($pnlHistorial.Controls.Count -ge 3) { $pnlHistorial.Controls.RemoveAt($pnlHistorial.Controls.Count - 1) }
    $pnlHistorial.Controls.Add($thumbContainer); $pnlHistorial.Controls.SetChildIndex($thumbContainer, 0)
}

function Load-Initial-History {
    $pnlHistorial.Controls.Clear()
    if (Test-Path $destino) {
        $archivos = Get-ChildItem -Path $destino -File | Where-Object { $_.Extension -match "mp4|mkv|webm|mp3|wav" } | Sort-Object LastWriteTime -Descending | Select-Object -First 3
        if ($archivos.Count -gt 0) { 
            # Si hay videos, los ponemos y el mensaje NO aparece
            $archivos | ForEach-Object { Add-To-History $_.FullName } 
        } else {
            # Solo si está vacío ponemos el mensaje
            $lblVacio = New-Object System.Windows.Forms.Label; $lblVacio.Text = "Aun no hay descargas..."; $lblVacio.ForeColor = [System.Drawing.Color]::DimGray; $lblVacio.TextAlign = "MiddleCenter"; $lblVacio.Size = New-Object System.Drawing.Size(370, 60); $pnlHistorial.Controls.Add($lblVacio)
        }
    }
}

$form.Add_Shown({ Load-Initial-History })
$form.ShowDialog()