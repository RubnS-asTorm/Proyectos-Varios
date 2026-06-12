# 1. Configuración e Icono
$AppId = "MiDescargador.Youtube.GUI"
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$icoPath = "C:\YTDLP\logo.ico"
$icon = $null
if (Test-Path $icoPath) { $icon = New-Object Drawing.Icon($icoPath) }

# 2. Carpeta de destino
$destino = "C:\YTDLP\Videos"
$folderThumbs = "C:\YTDLP\.thumbs" # Nueva carpeta para imágenes
if (!(Test-Path $folderThumbs)) { New-Item -ItemType Directory -Force -Path $folderThumbs }

# 3. Formulario
$form = New-Object System.Windows.Forms.Form
if ($icon) { $form.Icon = $icon }
$form.Text = "Descargador Pro v3.4.4"
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

# --- BOTÓN CERRAR (X) ---
$btnClose = New-Object System.Windows.Forms.Label
$btnClose.Text = "X"
$btnClose.ForeColor = [System.Drawing.Color]::White
$btnClose.TextAlign = "MiddleCenter"
$btnClose.Size = New-Object System.Drawing.Size(35, 35)
$btnClose.Location = New-Object System.Drawing.Point(415, 0)
$btnClose.Cursor = "Hand"
$btnClose.Add_Click({ $form.Close() })

# Efectos para la X
$btnClose.Add_MouseEnter({ $btnClose.BackColor = [System.Drawing.Color]::FromArgb(232, 17, 35) })
$btnClose.Add_MouseLeave({ $btnClose.BackColor = [System.Drawing.Color]::Black })

$pnlTitle.Controls.Add($btnClose) 

# --- BOTÓN MINIMIZAR (_) ---
$btnMinimize = New-Object System.Windows.Forms.Label
$btnMinimize.Text = "_"
$btnMinimize.ForeColor = [System.Drawing.Color]::White
$btnMinimize.TextAlign = "MiddleCenter"
$btnMinimize.Size = New-Object System.Drawing.Size(35, 35)
$btnMinimize.Location = New-Object System.Drawing.Point(380, 0)
$btnMinimize.Cursor = "Hand"
$btnMinimize.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$btnMinimize.Add_Click({ $form.WindowState = [System.Windows.Forms.FormWindowState]::Minimized })

# Efectos para Minimizar
$btnMinimize.Add_MouseEnter({ $btnMinimize.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$btnMinimize.Add_MouseLeave({ $btnMinimize.BackColor = [System.Drawing.Color]::Black })
$pnlTitle.Controls.Add($btnMinimize)

# --- TÍTULO ---
$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "PRO DOWNLOADER YT V3.7.3"
$lblTitle.ForeColor = $colorRojo
$lblTitle.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$lblTitle.Location = New-Object System.Drawing.Point(15, 8)
$lblTitle.AutoSize = $true
$pnlTitle.Controls.Add($lblTitle)

# Lógica de arrastre
$mouseDown = $false
$pnlTitle.Add_MouseDown({ $script:mouseDown = $true; $script:offsetX = [System.Windows.Forms.Cursor]::Position.X - $form.Left; $script:offsetY = [System.Windows.Forms.Cursor]::Position.Y - $form.Top })
$pnlTitle.Add_MouseMove({ if ($script:mouseDown) { $form.Left = [System.Windows.Forms.Cursor]::Position.X - $script:offsetX; $form.Top = [System.Windows.Forms.Cursor]::Position.Y - $script:offsetY } })
$pnlTitle.Add_MouseUp({ $script:mouseDown = $false })

$form.Controls.Add($pnlTitle)

# --- CONTENIDO v3.7.0 ---
$fontEtiqueta = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$fontOpciones = New-Object System.Drawing.Font("Segoe UI", 10)

$label = New-Object System.Windows.Forms.Label
$label.Text = "Pega la URL del video aqui:"
$label.Font = $fontEtiqueta
$label.ForeColor = [System.Drawing.Color]::White
$label.Location = New-Object System.Drawing.Point(30, 55)
$label.AutoSize = $true
$form.Controls.Add($label)

# --- CUADRO DE URL ---
$urlInput = New-Object System.Windows.Forms.TextBox
$urlInput.Location = New-Object System.Drawing.Point(30, 85)
$urlInput.Size = New-Object System.Drawing.Size(290, 25)
$urlInput.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)
$urlInput.ForeColor = [System.Drawing.Color]::White
$urlInput.BorderStyle = "FixedSingle"
$urlInput.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$form.Controls.Add($urlInput)

# --- BOTÓN PEGAR (P) ---
$btnPegar = New-Object System.Windows.Forms.Button
$btnPegar.Text = "P"
$btnPegar.Location = New-Object System.Drawing.Point(325, 84)
$btnPegar.Size = New-Object System.Drawing.Size(35, 25)
$btnPegar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnPegar.ForeColor = [System.Drawing.Color]::White
$btnPegar.FlatStyle = "Flat"
$btnPegar.FlatAppearance.BorderSize = 0
$btnPegar.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$btnPegar.Cursor = "Hand"
$btnPegar.Add_Click({ $urlInput.Text = [System.Windows.Forms.Clipboard]::GetText() })
$btnPegar.Add_MouseEnter({ $btnPegar.BackColor = $colorRojo })
$btnPegar.Add_MouseLeave({ $btnPegar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$form.Controls.Add($btnPegar)

# --- BOTÓN LIMPIAR (X) ---
$btnLimpiar = New-Object System.Windows.Forms.Button
$btnLimpiar.Text = "X"
# Lo movemos 5 píxeles a la derecha (325 + 35 + 5 = 365)
$btnLimpiar.Location = New-Object System.Drawing.Point(365, 84) 
$btnLimpiar.Size = New-Object System.Drawing.Size(35, 25)
$btnLimpiar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnLimpiar.ForeColor = [System.Drawing.Color]::White
$btnLimpiar.FlatStyle = "Flat"
$btnLimpiar.FlatAppearance.BorderSize = 0
$btnLimpiar.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$btnLimpiar.Cursor = "Hand"
$btnLimpiar.Add_Click({ $urlInput.Text = "" })
$btnLimpiar.Add_MouseEnter({ $btnLimpiar.BackColor = $colorRojo })
$btnLimpiar.Add_MouseLeave({ $btnLimpiar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60) })
$form.Controls.Add($btnLimpiar)

# --- BARRA DE PROGRESO PERSONALIZADA ---
$pnlProgressBack = New-Object System.Windows.Forms.Panel
$pnlProgressBack.Location = New-Object System.Drawing.Point(30, 115)
$pnlProgressBack.Size = New-Object System.Drawing.Size(370, 12)
$pnlProgressBack.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)
$pnlProgressBack.Visible = $false
$form.Controls.Add($pnlProgressBack)

$pnlProgressBar = New-Object System.Windows.Forms.Panel
$pnlProgressBar.Size = New-Object System.Drawing.Size(0, 12)
$pnlProgressBar.BackColor = $colorRojo
$pnlProgressBack.Controls.Add($pnlProgressBar)

# Etiqueta de Estado
$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Location = New-Object System.Drawing.Point(30, 130)
$lblStatus.Size = New-Object System.Drawing.Size(370, 20)
$lblStatus.ForeColor = [System.Drawing.Color]::White
$lblStatus.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Bold)
$lblStatus.TextAlign = "MiddleCenter"
$lblStatus.Text = ""
$form.Controls.Add($lblStatus)

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100
$timer.Add_Tick({
    if ($pnlProgressBar.Width -lt 350) { $pnlProgressBar.Width += 5 }
})

# --- OPCIONES ---
$groupBox = New-Object System.Windows.Forms.GroupBox
$groupBox.Text = " Formato y Calidad "
$groupBox.Font = $fontEtiqueta
$groupBox.ForeColor = $colorRojo
$groupBox.Location = New-Object System.Drawing.Point(30, 155)
$groupBox.Size = New-Object System.Drawing.Size(370, 175)
$form.Controls.Add($groupBox)

function Add-DarkRadio {
    param($text, $top, $checked=$false)
    $rb = New-Object System.Windows.Forms.RadioButton
    $rb.Text = $text
    $rb.Font = $fontOpciones
    $rb.ForeColor = [System.Drawing.Color]::White
    $rb.Location = New-Object System.Drawing.Point(25, $top)
    $rb.Size = New-Object System.Drawing.Size(320, 25)
    $rb.Checked = $checked
    $groupBox.Controls.Add($rb)
    return $rb
}

$rb1 = Add-DarkRadio "Video MP4 (Mejor Calidad + Audio)" 30 $true
$rb2 = Add-DarkRadio "Video MKV (Maxima Calidad)" 60
$rb3 = Add-DarkRadio "Audio MP3 (Alta Calidad)" 90
$rb4 = Add-DarkRadio "Audio WAV (Sin perdida)" 120

# --- BOTONES ---
function Set-RedBtn ($btn) {
    $btn.BackColor = $colorRojo
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = "Flat"
    $btn.FlatAppearance.BorderSize = 0
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
    $btn.Cursor = "Hand"
}

# --- SECCIÓN DE HISTORIAL ---
$lblHistorialTitle = New-Object System.Windows.Forms.Label
$lblHistorialTitle.Text = "ULTIMAS DESCARGAS (HAZ CLICK PARA ABRIR)"
$lblHistorialTitle.ForeColor = [System.Drawing.Color]::Gray
$lblHistorialTitle.Font = New-Object System.Drawing.Font("Segoe UI", 7, [System.Drawing.FontStyle]::Bold)
$lblHistorialTitle.Location = New-Object System.Drawing.Point(30, 465)
$lblHistorialTitle.AutoSize = $true
$form.Controls.Add($lblHistorialTitle)

$pnlHistorial = New-Object System.Windows.Forms.FlowLayoutPanel
$pnlHistorial.Location = New-Object System.Drawing.Point(20, 485) # Un poco más a la izquierda
$pnlHistorial.Size = New-Object System.Drawing.Size(410, 90)     # Más ancho
$pnlHistorial.FlowDirection = "LeftToRight"
$pnlHistorial.WrapContents = $false # ESTO evita que se vayan abajo si no caben
$form.Controls.Add($pnlHistorial)

function Add-To-History ($videoPath) {
    $thumbContainer = New-Object System.Windows.Forms.Panel
    $thumbContainer.Size = New-Object System.Drawing.Size(125, 80)
    
    $pbThumb = New-Object System.Windows.Forms.PictureBox
    $pbThumb.Size = New-Object System.Drawing.Size(115, 65)
    $pbThumb.SizeMode = "Zoom"
    $pbThumb.Cursor = "Hand"
    
    # --- Guardamos la ruta en el TAG para que no se pierda ---
    $pbThumb.Tag = $videoPath 
    
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($videoPath)
    # CAMBIO AQUÍ: Ahora busca en la carpeta de miniaturas
    $folderThumbs = "C:\YTDLP\.thumbs"
    $thumbFile = Get-ChildItem -Path $folderThumbs -Filter "$baseName.*" | 
                 Where-Object { $_.Extension -match "jpg|png|webp" } | Select-Object -First 1

    if ($thumbFile) {
        $bytes = [System.IO.File]::ReadAllBytes($thumbFile.FullName)
        $ms = New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)
        $pbThumb.Image = [System.Drawing.Image]::FromStream($ms)
    } else {
        $pbThumb.BackColor = [System.Drawing.Color]::FromArgb(40,40,40)
    }

    # --- EVENTO DE CLIC ---
    $pbThumb.Add_Click({
        # Recuperamos la ruta guardada en el Tag del objeto que recibió el clic
        $ruta = $this.Tag
        if ($ruta) { 
            Start-Process $ruta 
        }
    })

    # Efecto al pasar el ratón (se ilumina)
    $pbThumb.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::Red })
    $pbThumb.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::Transparent })

    # Añadir un cartelito con el nombre del video al dejar el ratón encima
    $toolTip = New-Object System.Windows.Forms.ToolTip
    $toolTip.SetToolTip($pbThumb, $baseName)

    $thumbContainer.Controls.Add($pbThumb)
    
    # Control de límite (3 fotos máximo)
    if ($pnlHistorial.Controls.Count -ge 3) { 
        $pnlHistorial.Controls.RemoveAt($pnlHistorial.Controls.Count - 1) 
    }
    
    # Añadir al panel y mover al principio
    $pnlHistorial.Controls.Add($thumbContainer)
    $pnlHistorial.Controls.SetChildIndex($thumbContainer, 0)
    $pnlHistorial.Refresh()
}

# --- CARGA AUTOMÁTICA AL INICIAR ---
function Load-Initial-History {
    $pnlHistorial.Controls.Clear()
    $rutaReal = "C:\YTDLP\Videos"
    
    # Verificamos si la carpeta existe y tiene videos
    if (Test-Path $rutaReal) {
        $archivos = Get-ChildItem -Path $rutaReal -File | 
                    Where-Object { $_.Extension -match "mp4|mkv|webm|mp3|wav" } | 
                    Sort-Object LastWriteTime -Descending | 
                    Select-Object -First 3
        
        if ($archivos) {
            foreach ($file in $archivos) {
                Add-To-History $file.FullName
            }
        } else {
            # --- MENSAJE DE CARPETA VACÍA ---
            $lblVacio = New-Object System.Windows.Forms.Label
            $lblVacio.Text = "Aun no hay descargas. Pega un link arriba para empezar"
            $lblVacio.ForeColor = [System.Drawing.Color]::DimGray
            $lblVacio.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Italic)
            $lblVacio.Size = New-Object System.Drawing.Size(370, 60)
            $lblVacio.TextAlign = "MiddleCenter"
            $pnlHistorial.Controls.Add($lblVacio)
        }
    }
}

# --- BOTÓN DESCARGAR ---
$btnDescargar = New-Object System.Windows.Forms.Button
$btnDescargar.Text = "DESCARGAR AHORA"
$btnDescargar.Location = New-Object System.Drawing.Point(30, 345)
$btnDescargar.Size = New-Object System.Drawing.Size(370, 50)
Set-RedBtn $btnDescargar

$btnDescargar.Add_Click({
    if ([string]::IsNullOrWhiteSpace($urlInput.Text)) { return }
    
    $lblStatus.Text = "DESCARGANDO..."
    $lblStatus.ForeColor = [System.Drawing.Color]::White
    $pnlProgressBar.Width = 0
    $pnlProgressBack.Visible = $true
    $timer.Start()
    $btnDescargar.Enabled = $false
    
    $exe = "C:\YTDLP\yt-dlp.exe"
    $output = "-o ""$destino\%(title)s.%(ext)s"""
    $url = $urlInput.Text
    
    # IMPORTANTE: Añadimos --write-thumbnail para que el historial tenga imagen
    $thumbArg = "--write-thumbnail --convert-thumbnails jpg -o `"thumbnail:$folderThumbs/%(title)s.%(ext)s`""
    if ($rb1.Checked) { $args = "-f ""bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]"" --merge-output-format mp4 $thumbArg" }
    elseif ($rb2.Checked) { $args = "-f ""bv+ba/b"" --merge-output-format mkv $thumbArg" }
    elseif ($rb3.Checked) { $args = "-x --audio-format mp3 --audio-quality 0 $thumbArg" }
    elseif ($rb4.Checked) { $args = "-x --audio-format wav $thumbArg" }

    $job = Start-Job -ScriptBlock {
        param($e, $a, $o, $u)
        Start-Process $e -ArgumentList "$a $o $u" -Wait -WindowStyle Hidden
    } -ArgumentList $exe, $args, $output, $url
    
    while ($job.State -eq "Running") { [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 100 }
    Receive-Job $job
    
    $timer.Stop()
    $pnlProgressBar.Width = 370
    $lblStatus.Text = "DESCARGA FINALIZADA CON EXITO"
    $lblStatus.ForeColor = [System.Drawing.Color]::White
    $btnDescargar.Enabled = $true

    # Actualizar Historial
    $ultimo = Get-ChildItem $destino | Sort-Object LastWriteTime -Descending | Where-Object { $_.Extension -notmatch "jpg|webp|png" } | Select-Object -First 1
    if ($ultimo) { Add-To-History $ultimo.FullName }
})
$form.Controls.Add($btnDescargar)

# --- BOTÓN CARPETA ---
$btnCarpeta = New-Object System.Windows.Forms.Button
$btnCarpeta.Text = "ABRIR CARPETA DE VIDEOS"
$btnCarpeta.Location = New-Object System.Drawing.Point(30, 410)
$btnCarpeta.Size = New-Object System.Drawing.Size(370, 40)
Set-RedBtn $btnCarpeta
$btnCarpeta.Add_Click({ explorer.exe $destino })
$form.Controls.Add($btnCarpeta)

# Cargar historial guardado antes de mostrar la ventana
Load-Initial-History
$form.Add_Shown({ Load-Initial-History }) # Esto carga el historial CUANDO ya se ve la ventana

$form.ShowDialog()