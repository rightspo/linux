
<h1>Linux_report</h1>

<h2>1.Installation of the OS</h2>
<img src = "screenshots/ubuntu_version.png">
<div align="center">Ubuntu version</div>

<h2>2.Creating a user</h2>
<img src = "screenshots/ex02/create_user.png" title = "User added">
<div align="center"">User created and added to adm<br></div>


<img src = "screenshots/ex02/list_of_users.png" title = "output of command cat /etc/passwd">
<div align="center">Output of command cat "/etc/passwd"</div>


<h2>3.Setting up the OS network</h2>
<img src = "screenshots/hostname_user-1.png" title = "output of command changing hostname">
<div align="center">1)Change hostname to "user-1"</div>

<img src = "screenshots/timezone.png" title = "output of command timedatectl">
<div align="center">2)Change timezome to Moscow</div>

<img src = "screenshots/network_interface.png" title = "output of command netstat -i">
<div align="center">3)list of network interfaces<br></div>
<div>&emsp;Lo interface(loopback interface) is a special virtual network interface that your computer uses to communicate with itself. It is used mainly for diagnostic and troubleshooting, and to connect to servers running on the local machine.

<img src = "screenshots/DHCP_adress.png" title = "local network adress">
<div align="center">4)local network adress</div>

<img src = "screenshots/gateway_and_default_ip.png" title = "gateway_and_default_ip">
<div align="center">5)gateway_and_default_ip</div>

<img src = "screenshots/gateway_and_default_ip.png" title = "gateway_and_default_ip">
<div align="center">5)gateway_and_default_ip</div>

<img src = "screenshots/change_ip.png">
<img src = "screenshots/change_gw.png">
<img src = "screenshots/change_dns.png">
<img src = "screenshots/change_dns_2.png">
<div align="center">6)ip, gw and DNS changed. Packet loss result</div>


<h2>4.OS Update</h2>
<img src = "screenshots/ex04/os_update.png">


<h2>5.Using the sudo command</h2>
<div>&emsp;Sudo is a command-line utility for Unix and Unix-based operating systems such as Linux and macOS. The utility provides an efficient way to temporarily grant users or user groups privileged access to system resources so that they can run commands that they cannot run under their regular accounts. Users can even be granted permissions to run commands under the root account -- the most powerful account on Unix-like systems. Sudo also logs all commands and arguments so that administrators can track the behavior of sudo users.</div>
<img src = "screenshots/ex05/change_hostname.png">


<h2>6.Installing and configuring the time service</h2>
<img src = "screenshots/ex06/synchronize.png">


<h2>7.Installing and using text editors</h2>
<img src = "screenshots/ex07/install_all_redactors.png">
<div align="center">all redactors installation</div>

<img src = "screenshots/ex07/vim/create_file.png">
<img src = "screenshots/ex07/vim/save_changes_vim.png">
<div>&emsp;To exit vim with changes you have to write ":wq".</div>
<img src = "screenshots/ex07/vim/dont_save_changes.png">
<div>&emsp;To exit vim without changes you have to write ":q!".</div>
<img src = "screenshots/ex07/vim/search_name_vim.png">
<div>&emsp;To search in vim you have to write "/{pattern}".</div>
<img src = "screenshots/ex07/vim/change_word_vim.png">
<img src = "screenshots/ex07/vim/changed_word_vim.png">
<div>&emsp;To search in vim you have to write "%s/{pattern_to_replace}/{new_pattern}/%s".</div>

<div>---------------------------------------------------------------</div>

<img src = "screenshots/ex07/nano/save_changes_nano.png">
<div>&emsp;To exit nano with changes you have to use ctrl + 'X' and then write "Yes".</div>
<img src = "screenshots/ex07/nano/dont_save_changes.png">
<div>&emsp;To exit nano with changes you have to use ctrl + 'X' and then write "No".</div>
<img src = "screenshots/ex07/nano/search_name_nano.png">
<div>&emsp;To search in vim you have to use ctrl + 'W', then write "/{pattern}".</div>
<img src = "screenshots/ex07/nano/change_word_nano.png">
<div>&emsp;To search in vim you have to use ctrl + '\', then  "{pattern_to_replace}", and then "{new_pattern}".</div>

<div>---------------------------------------------------------------</div>

<img src = "screenshots/ex07/mcedit/save_changes_mcedit.png">
<div>&emsp;To exit mcedit with changes press F10, then choose 'Save'.</div>
<img src = "screenshots/ex07/mcedit/dont_save_changes_mcedit.png">
<div>&emsp;To exit mcedit with changes press F10, then choose 'No'.</div>
<img src = "screenshots/ex07/mcedit/search_name_mcedit.png">
<div>&emsp;To search in mcedit press F7 and write "{pattern}".</div>
<img src = "screenshots/ex07/mcedit/change_word_mcedit.png">
<div>&emsp;To search in mcedit press F7, write "{pattern_to_replace}" and "{new_pattern}".</div>

<h2>8.Installing and basic setup of the SSHD service</h2>

<img src = "screenshots/ex08/install_openssh.png">
<img src = "screenshots/ex08/auto-start.png">
<img src = "screenshots/ex08/change_port.png">
<img src = "screenshots/ex08/ps_command.png">
<img src = "screenshots/ex08/netstat_tan.png">
<div>Netstat - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.</div>
<div>&emsp;-t flag shows active TCP-connections.</div>
<div>&emsp;-a flag shows both listening and non-listening sockets.</div>
<div>&emsp;-a flag shows numerical addresses.</div>

<h2>9.Installing and using the top, htop utilities</h2>

<div>TOP:</div>
<div>&emsp;- Uptime: 17:31:51 up 18 min</div>
<div>&emsp;- Number of authorised users: 1</div>
<div>&emsp;- Total system load: 0.03, 0.03, 0.03</div>
<div>&emsp;- Total number of processes: 100</div>
<div>&emsp;- Cpu load: 0.0%</div>
<div>&emsp;- Memory load: 201.4</div>
<div>&emsp;- Pid of the process with the highest memory usage: 2667</div>
<div>&emsp;- Pid of the process taking the most CPU time: 2639</div>

<img src = "screenshots/ex09/top.png">
<div align="center">Top sorted by %CPU</div>

<img src = "screenshots/ex09/top_most_pcu_time_usage.png">
<div align="center">Top sorted by TIME+</div>

<img src = "screenshots/ex09/sort_by_pid.png">
<div align="center">Htop sorted by PID</div>
<img src = "screenshots/ex09/sort_by_percent_cpu.png">
<div align="center">Htop sorted by %CPU</div>
<img src = "screenshots/ex09/sort_by_percent_mem.png">
<div align="center">Htop sorted by %MEM</div>
<img src = "screenshots/ex09/sort_by_time.png">
<div align="center">Htop sorted by TIME+<E+</div>

<img src = "screenshots/ex09/filter_by_sshd.png">
<div align="center">Htop filtered by sshd<E+</div>

<img src = "screenshots/ex09/search_syslog.png">
<div align="center">Htop serch by syslog</div>

<img src = "screenshots/ex09/hostname_time_added.png">
<div align="center">Htop with hostname, clock and uptime output added</div>

<h2>10.Using the fdisk utility</h2>

<img src = "screenshots/ex10/disk_name_capacity_num_of_sectors.png">
<div align="center">Info about discs</div>

<img src = "screenshots/ex10/swap_size.png">
<div align="center">Swap size</div>

<div align="left">Disc info:<\div>
<div>&emsp;Disc name: /dev/sda</div>
<div>&emsp;Disc capacity: 10 G</div>
<div>&emsp;Number of sectors: 20971520</div>
<div>&emsp;Swap size: 1.4 G</div>

<h2>11.Using the df utility</h2>

<img src = "screenshots/ex11/df.png">
<div align="center">Df command</div>

<div align="left">Df info:<\div>
<div>&emsp;Partion size: 8408452 Kb</div>
<div>&emsp;Used: 4200496 Kb</div>
<div>&emsp;Available: 3759240 Kb</div>
<div>&emsp;Percentage used: 53%</div>

<img src = "screenshots/ex11/df_Th.png">
<div align="center">Df -Th command</div>

<div align="left">Df -Th info:<\div>
<div>&emsp;Partion size: 8.1 G</div>
<div>&emsp;Used: 4.1 G</div>
<div>&emsp;Available: 3.6 G</div>
<div>&emsp;Percentage used: 53%</div>

<h2>12.Using the du utility</h2>

<div>flag "-h" outputs the info in human-readable format</div>
<div>flag "-s" outputs only the size of main catalog</div>

<img src = "screenshots/ex12/du.png">
<img src = "screenshots/ex12/du_home.png">
<img src = "screenshots/ex12/du_var_readable_format.png">
<img src = "screenshots/ex12/du_varlog_readable_format.png">
<img src = "screenshots/ex12/du_varlog_all.png">

<h2>13.Using the du utility</h2>

<img src = "screenshots/ex13/ncdu_home.png">
<img src = "screenshots/ex12/ncdu_var.png">
<img src = "screenshots/ex12/ncdu_varlog.png">

<h2>14.Working with system logs</h2>

<img src = "screenshots/ex14/cat_dmesg.png">
<img src = "screenshots/ex14/cat_syslog.png">
<img src = "screenshots/ex14/cat_auth_log.png">

<img src = "screenshots/ex14/last_login.png">
<img src = "screenshots/ex14/logs_after_restart.png">

<h2>15.Using the CRON job scheduler</h2>

<img src = "screenshots/ex15/active_jobs_for_crone.png">
<img src = "screenshots/ex15/log_screenshot.png">
<img src = "screenshots/ex15/remove_cron.png">
