connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274664038A" && level==0} -index 0
fpga -file C:/Users/Pedro/Documents/UA/CR/Labs/Lab4/CountDownTimerSoftware/workspace/TimerSoftwareApp/_ide/bitstream/download.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/Pedro/Documents/UA/CR/Labs/Lab4/CountDownTimerSoftware/workspace/TimerSoftwareApp/Debug/TimerSoftwareApp.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
