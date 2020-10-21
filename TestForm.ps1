$domainName = Get-ADDomain
$domainName = $domainName.DistinguishedName

$dentalUserOU = $domainName + ", OU = LOCAL, OU = USERS, OU = DENTAL"
$adminUserOU = $domainName + ", OU = LOCAL, OU = USERS, OU = ADMIN"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Add New Users'
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = 'CenterScreen'

$clinicalLabel = New-Object System.Windows.Forms.Label
$clinicalLabel.Location = New-Object System.Drawing.Point(10,10)
$clinicalLabel.Size = New-Object System.Drawing.Size(80,20)
$clinicalLabel.Font = New-Object System.Drawing.Font("Arial",14)
$clinicalLabel.Text = 'Clinical'
$form.Controls.Add($clinicalLabel)

$adminLabel = New-Object System.Windows.Forms.Label
$adminLabel.Location = New-Object System.Drawing.Point(300,10)
$adminLabel.Size = New-Object System.Drawing.Size(80,20)
$adminLabel.Font = New-Object System.Drawing.Font("Arial",14)
$adminLabel.Text = 'Admin'
$form.Controls.Add($adminLabel)

$typeLabel = New-Object System.Windows.Forms.Label
$typeLabel.Location = New-Object System.Drawing.Point(190,40)
$typeLabel.Size = New-Object system.Drawing.Size(50,20)
$typeLabel.Font = New-Object System.Drawing.Font("Arial",10)
$typeLabel.Text = 'Name'
$form.Controls.Add($typeLabel)

$typeLabel = New-Object System.Windows.Forms.Label
$typeLabel.Location = New-Object System.Drawing.Point(20,40)
$typeLabel.Size = New-Object system.Drawing.Size(50,20)
$typeLabel.Font = New-Object System.Drawing.Font("Arial",10)
$typeLabel.Text = 'Name'
$form.Controls.Add($typeLabel)

$typeLabel = New-Object System.Windows.Forms.Label
$typeLabel.Location = New-Object System.Drawing.Point(380,40)
$typeLabel.Size = New-Object system.Drawing.Size(50,20)
$typeLabel.Font = New-Object System.Drawing.Font("Arial",10)
$typeLabel.Text = 'Name'
$form.Controls.Add($typeLabel)

$quantityLabel = New-Object System.Windows.Forms.Label
$quantityLabel.Location = New-Object System.Drawing.Point(100,40)
$quantityLabel.Size = New-Object system.Drawing.Size(60,20)
$quantityLabel.Font = New-Object System.Drawing.Font("Arial",10)
$quantityLabel.Text = 'Quantity'
$form.Controls.Add($quantityLabel)

$quantityLabel = New-Object System.Windows.Forms.Label
$quantityLabel.Location = New-Object System.Drawing.Point(295,40)
$quantityLabel.Size = New-Object system.Drawing.Size(60,20)
$quantityLabel.Font = New-Object System.Drawing.Font("Arial",10)
$quantityLabel.Text = 'Quantity'
$form.Controls.Add($quantityLabel)

$quantityLabel = New-Object System.Windows.Forms.Label
$quantityLabel.Location = New-Object System.Drawing.Point(500,40)
$quantityLabel.Size = New-Object system.Drawing.Size(60,20)
$quantityLabel.Font = New-Object System.Drawing.Font("Arial",10)
$quantityLabel.Text = 'Quantity'
$form.Controls.Add($quantityLabel)

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(225,300)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(300,300)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$objTypeOPCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeOPCheckbox.Location = New-Object System.Drawing.Size(10,60) 
$objTypeOPCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeOPCheckbox.Text = "OP"
$objTypeOPCheckbox.TabIndex = 4
$form.Controls.Add($objTypeOPCheckbox)

$objTypeHYGCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeHYGCheckbox.Location = New-Object System.Drawing.Size(10,80) 
$objTypeHYGCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeHYGCheckbox.Text = "HYG"
$objTypeHYGCheckbox.TabIndex = 4
$form.Controls.Add($objTypeHYGCheckbox)

$objTypeTreatmentCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeTreatmentCheckbox.Location = New-Object System.Drawing.Size(10,100) 
$objTypeTreatmentCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeTreatmentCheckbox.Text = "TREATMENT"
$objTypeTreatmentCheckbox.TabIndex = 4
$form.Controls.Add($objTypeTreatmentCheckbox)

$objTypeSurgeryCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeSurgeryCheckbox.Location = New-Object System.Drawing.Size(10,120) 
$objTypeSurgeryCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeSurgeryCheckbox.Text = "SURGERY"
$objTypeSurgeryCheckbox.TabIndex = 4
$form.Controls.Add($objTypeSurgeryCheckbox)

$objTypeTCCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeTCCheckbox.Location = New-Object System.Drawing.Size(10,140) 
$objTypeTCCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeTCCheckbox.Text = "TC"
$objTypeTCCheckbox.TabIndex = 4
$form.Controls.Add($objTypeTCCheckbox)

$objTypeLABCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeLABCheckbox.Location = New-Object System.Drawing.Size(10,160) 
$objTypeLABCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeLABCheckbox.Text = "LAB"
$objTypeLABCheckbox.TabIndex = 4
$form.Controls.Add($objTypeLABCheckbox)

$objTypeSTERICheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeSTERICheckbox.Location = New-Object System.Drawing.Size(10,180) 
$objTypeSTERICheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeSTERICheckbox.Text = "STERI"
$objTypeSTERICheckbox.TabIndex = 4
$form.Controls.Add($objTypeSTERICheckbox)

$objTypeDrOPCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeDrOPCheckbox.Location = New-Object System.Drawing.Size(10,200) 
$objTypeDrOPCheckbox.Size = New-Object System.Drawing.Size(95,20)
$objTypeDrOPCheckbox.Text = "DrOP"
$objTypeDrOPCheckbox.TabIndex = 4
$form.Controls.Add($objTypeDrOPCheckbox)

$objTypeCHECKOUTCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeCHECKOUTCheckbox.Location = New-Object System.Drawing.Size(180,60) 
$objTypeCHECKOUTCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeCHECKOUTCheckbox.Text = "CHECKOUT"
$objTypeCHECKOUTCheckbox.TabIndex = 4
$form.Controls.Add($objTypeCHECKOUTCheckbox)

$objTypeCHECKINCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeCHECKINCheckbox.Location = New-Object System.Drawing.Size(180,80) 
$objTypeCHECKINCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeCHECKINCheckbox.Text = "CHECKIN"
$objTypeCHECKINCheckbox.TabIndex = 4
$form.Controls.Add($objTypeCHECKINCheckbox)

$objTypeFDCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeFDCheckbox.Location = New-Object System.Drawing.Size(180,100) 
$objTypeFDCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeFDCheckbox.Text = "FD"
$objTypeFDCheckbox.TabIndex = 4
$form.Controls.Add($objTypeFDCheckbox)

$objTypeBACKRECEPTIONCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeBACKRECEPTIONCheckbox.Location = New-Object System.Drawing.Size(180,120) 
$objTypeBACKRECEPTIONCheckbox.Size = New-Object System.Drawing.Size(125,20)
$objTypeBACKRECEPTIONCheckbox.Text = "BACK RECEPTION"
$objTypeBACKRECEPTIONCheckbox.TabIndex = 4
$form.Controls.Add($objTypeBACKRECEPTIONCheckbox)

$objTypeRECEPTIONCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeRECEPTIONCheckbox.Location = New-Object System.Drawing.Size(180,140) 
$objTypeRECEPTIONCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeRECEPTIONCheckbox.Text = "RECEPTION"
$objTypeRECEPTIONCheckbox.TabIndex = 4
$form.Controls.Add($objTypeRECEPTIONCheckbox)

$objTypeDOCTORCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeDOCTORCheckbox.Location = New-Object System.Drawing.Size(180,160) 
$objTypeDOCTORCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeDOCTORCheckbox.Text = "DOCTOR"
$objTypeDOCTORCheckbox.TabIndex = 4
$form.Controls.Add($objTypeDOCTORCheckbox)

$objTypeFINANCIALCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeFINANCIALCheckbox.Location = New-Object System.Drawing.Size(180,180) 
$objTypeFINANCIALCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeFINANCIALCheckbox.Text = "FINANCIAL"
$objTypeFINANCIALCheckbox.TabIndex = 4
$form.Controls.Add($objTypeFINANCIALCheckbox)

$objTypeCONSULTCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeCONSULTCheckbox.Location = New-Object System.Drawing.Size(180,200) 
$objTypeCONSULTCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeCONSULTCheckbox.Text = "CONSULT"
$objTypeCONSULTCheckbox.TabIndex = 4
$form.Controls.Add($objTypeCONSULTCheckbox)

$objTypeADMINCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeADMINCheckbox.Location = New-Object System.Drawing.Size(180,220) 
$objTypeADMINCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeADMINCheckbox.Text = "ADMIN"
$objTypeADMINCheckbox.TabIndex = 4
$form.Controls.Add($objTypeADMINCheckbox)

$objTypeOFFICECheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeOFFICECheckbox.Location = New-Object System.Drawing.Size(370,60) 
$objTypeOFFICECheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeOFFICECheckbox.Text = "OFFICE"
$objTypeOFFICECheckbox.TabIndex = 4
$form.Controls.Add($objTypeOFFICECheckbox)

$objTypeOMCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeOMCheckbox.Location = New-Object System.Drawing.Size(370,80) 
$objTypeOMCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeOMCheckbox.Text = "OM"
$objTypeOMCheckbox.TabIndex = 4
$form.Controls.Add($objTypeOMCheckbox)

$objTypeREMOTECheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeREMOTECheckbox.Location = New-Object System.Drawing.Size(370,100) 
$objTypeREMOTECheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeREMOTECheckbox.Text = "REMOTE"
$objTypeREMOTECheckbox.TabIndex = 4
$form.Controls.Add($objTypeREMOTECheckbox)

$objTypeLTCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeLTCheckbox.Location = New-Object System.Drawing.Size(370,120) 
$objTypeLTCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeLTCheckbox.Text = "LT"
$objTypeLTCheckbox.TabIndex = 4
$form.Controls.Add($objTypeLTCheckbox)

$objTypeDRLTCheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeDRLTCheckbox.Location = New-Object System.Drawing.Size(370,140) 
$objTypeDRLTCheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeDRLTCheckbox.Text = "DRLT"
$objTypeDRLTCheckbox.TabIndex = 4
$form.Controls.Add($objTypeDRLTCheckbox)

$objTypeSTAFFLOUNGECheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeSTAFFLOUNGECheckbox.Location = New-Object System.Drawing.Size(370,160) 
$objTypeSTAFFLOUNGECheckbox.Size = New-Object System.Drawing.Size(130,20)
$objTypeSTAFFLOUNGECheckbox.Text = "STAFF LOUNGE"
$objTypeSTAFFLOUNGECheckbox.TabIndex = 4
$form.Controls.Add($objTypeSTAFFLOUNGECheckbox)

$objTypeREMOTECheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeREMOTECheckbox.Location = New-Object System.Drawing.Size(370,180) 
$objTypeREMOTECheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeREMOTECheckbox.Text = "REMOTE"
$objTypeREMOTECheckbox.TabIndex = 4
$form.Controls.Add($objTypeREMOTECheckbox)

$objTypeCONFERENCEROOMCheckbox = New-Object System.Windows.Forms.Checkbox
$objTypeCONFERENCEROOMCheckbox.Location = New-Object System.Drawing.Size(370,200) 
$objTypeCONFERENCEROOMCheckbox.Size = New-Object System.Drawing.Size(135,20)
$objTypeCONFERENCEROOMCheckbox.Text = "CONFERNCE ROOM"
$objTypeCONFERENCEROOMCheckbox.TabIndex = 4
$form.Controls.Add($objTypeCONFERENCEROOMCheckbox)

$objTypeHOMECheckbox = New-Object System.Windows.Forms.Checkbox 
$objTypeHOMECheckbox.Location = New-Object System.Drawing.Size(370,220) 
$objTypeHOMECheckbox.Size = New-Object System.Drawing.Size(100,20)
$objTypeHOMECheckbox.Text = "HOME"
$objTypeHOMECheckbox.TabIndex = 4
$form.Controls.Add($objTypeHOMECheckbox)

$quantityBoxOP = New-Object System.Windows.Forms.TextBox
$quantityBoxOP.Location = New-Object System.Drawing.Point(105,60)
$quantityBoxOP.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxOP)

$quantityBoxHYG = New-Object System.Windows.Forms.TextBox
$quantityBoxHYG.Location = New-Object System.Drawing.Point(105,80)
$quantityBoxHYG.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxHYG)

$quantityBoxTreatment = New-Object System.Windows.Forms.TextBox
$quantityBoxTreatment.Location = New-Object System.Drawing.Point(105,100)
$quantityBoxTreatment.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxTreatment)

$quantityBoxSurgery = New-Object System.Windows.Forms.TextBox
$quantityBoxSurgery.Location = New-Object System.Drawing.Point(105,120)
$quantityBoxSurgery.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxSurgery)

$quantityBoxTC = New-Object System.Windows.Forms.TextBox
$quantityBoxTC.Location = New-Object System.Drawing.Point(105,140)
$quantityBoxTC.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxTC)

$quantityBoxLAB = New-Object System.Windows.Forms.TextBox
$quantityBoxLAB.Location = New-Object System.Drawing.Point(105,160)
$quantityBoxLAB.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxLAB)

$quantityBoxSTERI = New-Object System.Windows.Forms.TextBox
$quantityBoxSTERI.Location = New-Object System.Drawing.Point(105,180)
$quantityBoxSTERI.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxSTERI)

$quantityBoxDrOP = New-Object System.Windows.Forms.TextBox
$quantityBoxDrOP.Location = New-Object System.Drawing.Point(105,200)
$quantityBoxDrOP.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxDrOP)

$quantityBoxCHECKOUT = New-Object System.Windows.Forms.TextBox
$quantityBoxCHECKOUT.Location = New-Object System.Drawing.Point(305,60)
$quantityBoxCHECKOUT.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxCHECKOUT)

$quantityBoxCHECKIN = New-Object System.Windows.Forms.TextBox
$quantityBoxCHECKIN.Location = New-Object System.Drawing.Point(305,80)
$quantityBoxCHECKIN.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxCHECKIN)

$quantityBoxFD = New-Object System.Windows.Forms.TextBox
$quantityBoxFD.Location = New-Object System.Drawing.Point(305,100)
$quantityBoxFD.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxFD)

$quantityBoxBACKRECEPTION = New-Object System.Windows.Forms.TextBox
$quantityBoxBACKRECEPTION.Location = New-Object System.Drawing.Point(305,120)
$quantityBoxBACKRECEPTION.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxBACKRECEPTION)

$quantityBoxRECEPTION = New-Object System.Windows.Forms.TextBox
$quantityBoxRECEPTION.Location = New-Object System.Drawing.Point(305,140)
$quantityBoxRECEPTION.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxRECEPTION)

$quantityBoxDOCTOR = New-Object System.Windows.Forms.TextBox
$quantityBoxDOCTOR.Location = New-Object System.Drawing.Point(305,160)
$quantityBoxDOCTOR.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxDOCTOR)

$quantityBoxFINANCIAL = New-Object System.Windows.Forms.TextBox
$quantityBoxFINANCIAL.Location = New-Object System.Drawing.Point(305,180)
$quantityBoxFINANCIAL.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxFINANCIAL)

$quantityBoxCONSULT = New-Object System.Windows.Forms.TextBox
$quantityBoxCONSULT.Location = New-Object System.Drawing.Point(305,200)
$quantityBoxCONSULT.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxCONSULT)

$quantityBoxADMIN = New-Object System.Windows.Forms.TextBox
$quantityBoxADMIN.Location = New-Object System.Drawing.Point(305,220)
$quantityBoxADMIN.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxADMIN)

$quantityBoxOFFICE = New-Object System.Windows.Forms.TextBox
$quantityBoxOFFICE.Location = New-Object System.Drawing.Point(505,60)
$quantityBoxOFFICE.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxOFFICE)

$quantityBoxOM = New-Object System.Windows.Forms.TextBox
$quantityBoxOM.Location = New-Object System.Drawing.Point(505,80)
$quantityBoxOM.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxOM)

$quantityBoxREMOTE = New-Object System.Windows.Forms.TextBox
$quantityBoxREMOTE.Location = New-Object System.Drawing.Point(505,100)
$quantityBoxREMOTE.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxREMOTE)

$quantityBoxLT = New-Object System.Windows.Forms.TextBox
$quantityBoxLT.Location = New-Object System.Drawing.Point(505,120)
$quantityBoxLT.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxLT)

$quantityBoxDRLT = New-Object System.Windows.Forms.TextBox
$quantityBoxDRLT.Location = New-Object System.Drawing.Point(505,140)
$quantityBoxDRLT.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxDRLT)

$quantityBoxSTAFFLOUNGE = New-Object System.Windows.Forms.TextBox
$quantityBoxSTAFFLOUNGE.Location = New-Object System.Drawing.Point(505,160)
$quantityBoxSTAFFLOUNGE.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxSTAFFLOUNGE)

$quantityBoxSTAFFLOUNGE = New-Object System.Windows.Forms.TextBox
$quantityBoxSTAFFLOUNGE.Location = New-Object System.Drawing.Point(505,180)
$quantityBoxSTAFFLOUNGE.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxSTAFFLOUNGE)

$quantityBoxCONFERENCEROOM = New-Object System.Windows.Forms.TextBox
$quantityBoxCONFERENCEROOM.Location = New-Object System.Drawing.Point(505,200)
$quantityBoxCONFERENCEROOM.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxCONFERENCEROOM)

$quantityBoxHOME = New-Object System.Windows.Forms.TextBox
$quantityBoxHOME.Location = New-Object System.Drawing.Point(505,220)
$quantityBoxHOME.Size = New-Object System.Drawing.Size(40,20)
$form.Controls.Add($quantityBoxHOME)

$form.Topmost = $true


$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    switch('Checked'){
        ($objTypeOPCheckbox.CheckState){
            if (($quantityBoxOP -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxOP -as [int])){
                    New-ADUser -Name "OP0"+$i -Path $dentalUserOU -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -SamAccountName OP0+$i
                }
            }
        }
        ($objTypeHYGCheckbox.CheckState){
            if (($quantityBoxHYG -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxHYG -as [int])){
                    New-ADUser -Name "HYG0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU -SamAccountName HYG0+$i
                }
            }
        }
        ($objTypeTreatmentCheckbox.CheckState){
            if (($quantityBoxTreatment -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxTreatment -as [int])){
                    New-ADUser -Name "TREATMENT0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU -SamAccountName TREATMENT0+$i
                }
            }
        }
        ($objTypeSurgeryCheckbox.CheckState){
            if (($quantityBoxSurgery -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxSurgery -as [int])){
                    New-ADUser -Name "SURGERY0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU -SamAccountName SURGERY0+$i
                }
            }
        }
        ($objTypeTCCheckbox.CheckState){
            if (($quantityBoxTC -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxTC -as [int])){
                    New-ADUser -Name "TC0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU  -SamAccountName TC0+$i
                }
            }
        }
        ($objTypeLABCheckbox.CheckState){
            if (($quantityBoxLAB -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxLAB -as [int])){
                    New-ADUser -Name "LAB0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU  -SamAccountName LAB0+$i
                }
            }
        }
        ($objTypeSTERICheckbox.CheckState){
            if (($quantityBoxSTERI -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxSTERI -as [int])){
                    New-ADUser -Name "STERI0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU  -SamAccountName STERI0+$i
                }
            }
        }
        ($objTypeDrOPCheckbox.CheckState){
            if (($quantityBoxDrOP -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxDrOP -as [int])){
                    New-ADUser -Name "DROP0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $dentalUserOU -SamAccountName DROP0+$i
                }
            }
        }
        ($objTypeCHECKOUTCheckbox.CheckState){
            if (($quantityBoxCHECKOUT -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxCHECKOUT -as [int])){
                    New-ADUser -Name "CHECKOUT0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName CHECKOUT0+$i
                }
            }
        }
        ($objTypeCHECKINCheckbox.CheckState){
            if (($quantityBoxCHECKIN -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxCHECKIN -as [int])){
                    New-ADUser -Name "CHECKIN0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName CHECKIN0+$i
                }
            }
        }
        ($objTypeFDCheckbox.CheckState){
            if (($quantityBoxFD -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxFD -as [int])){
                    New-ADUser -Name "FRONTDESK0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName FRONTDESK+$i
                }
            }
        }
        ($objTypeBACKRECEPTIONCheckbox.CheckState){
            if (($quantityBoxBACKRECEPTION -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxBACKRECEPTION -as [int])){
                    New-ADUser -Name "BACKRECEPTION0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU  -SamAccountName BACKRECEPTION0+$i
                }
            }
        }
        ($objTypeRECEPTIONCheckbox.CheckState){
            if (($quantityBoxRECEPTION -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxRECEPTION -as [int])){
                    New-ADUser -Name "RECEPTION0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName RECEPTION0+$i
                }
            }
        }
        ($objTypeDOCTORCheckbox.CheckState){
            if (($quantityBoxDOCTOR -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxDOCTOR -as [int])){
                    New-ADUser -Name "DR0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName DR0+$i
                }
            }
        }
        ($objTypeFINANCIALCheckbox.CheckState){
            if (($quantityBoxFINANCIAL -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxFINANCIAL -as [int])){
                    New-ADUser -Name "FINANCIAL0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName FINANCIAL0+$i
                }
            }
        }
        ($objTypeCONSULTCheckbox.CheckState){
            if (($quantityBoxCONSULT -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxCONSULT -as [int])){
                    New-ADUser -Name "CONSULT0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName CONSULT0+$i
                }
            }
        }
        ($objTypeADMINCheckbox.CheckState){
            if (($quantityBoxADMIN -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxADMIN -as [int])){
                    New-ADUser -Name "ADMIN0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName ADMIN0+$i
                }
            }
        }
        ($objTypeOFFICECheckbox.CheckState){
            if (($quantityBoxOFFICE -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxOFFICE -as [int])){
                    New-ADUser -Name "OFFICE0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName OFFICE0+$i
                }
            }
        }
        ($objTypeOMCheckbox.CheckState){
            if (($quantityBoxOM -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxOM -as [int])){
                    New-ADUser -Name "OM0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName OM0+$i
                }
            }
        }
        ($objTypeREMOTECheckbox.CheckState){
            if (($quantityBoxREMOTE -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxREMOTE -as [int])){
                    New-ADUser -Name "REMOTE0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName REMOTE0+$i
                }
            }
        }
        ($objTypeLTCheckbox.CheckState){
            if (($quantityBoxLT -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxLT -as [int])){
                    New-ADUser -Name "LT0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName LT0+$i
                }
            }
        }
        ($objTypeDRLTCheckbox.CheckState){
            if (($quantityBoxDRLT -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxDRLT -as [int])){
                    New-ADUser -Name "DRLT0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName DRLT0+$i
                }
            }
        }
        ($objTypeSTAFFLOUNGECheckbox.CheckState){
            if (($quantityBoxSTAFFLOUNGE -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxSTAFFLOUNGE -as [int])){
                    New-ADUser -Name "STAFFLOUNGE0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName STAFFLOUNGE0+$i
                }
            }
        }
        ($objTypeCONFERENCEROOMCheckbox.CheckState){
            if (($quantityBoxCONFERENCEROOM -as [int]) -gt 0){
                $i=1
                while ($i -le ($quantityBoxCONFERENCEROOM -as [int])){
                    New-ADUser -Name "CONFERENCEROOM0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName CONFERENCEROOM0+$i
                }
            }
        }
        ($objTypeHOMECheckbox.CheckState){
            if (($quantityBoxHOME -as [int]) -gt 0){
                $i=1
                while ($i -ne ($quantityBoxHOME -as [int])){
                    New-ADUser -Name "HOME0"+$i -AccountPassword 'Dental@1' -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -Path $adminUserOU -SamAccountName HOME0+$i
                }
            }
        }
    }
}