# D02_LinuxNetwork

## **Part 1. ipcalc tool**

### **1.1. Networks and Masks**

**1. Network address of 192.167.38.54/13**

![Интернет адрес 192.167.38.54/13](ex01/ex1.1/1/screenshot.png)\
*Интернет адрес 192.167.38.54/13*

Сетевым адресом для 192.167.38.54/13 является 192.160.0.0/13

**2. conversion of the mask 255.255.255.0 to prefix and binary, /15 to normal and binary, 11111111.11111111.11111111.11110000 to normal and prefix**

![Маска 255.255.255.0](ex01/ex1.1/2/mask_255_255_255.png)\
*Маска 255.255.255.0*

![Маска 15](ex01/ex1.1/2/mask_15.png)\
*Маска /15*

![Маска 28](ex01/ex1.1/2/mask_28.png)\
*Маска 11111111.11111111.11111111.11110000*

**3. minimum and maximum host in 12.167.38.4 network with masks: /8, 11111111.11111111.00000000.00000000, 255.255.254.0 and /4**

![Маска 8](ex01/ex1.1/3/mask_8.png)\
*Маска /8*

![Маска 16](ex01/ex1.1/3/mask_16.png)\
*Маска 11111111.11111111.00000000.00000000*

![Маска 23](screens/mask_255_255_254_0___1_task.png)\
*Маска 255.255.254.0*

![Маска 4](ex01/ex1.1/3/mask_4.png)\
*Маска /4*

### **1.2. localhost**

Приложение, работающее на localhost, означает, что приложение запущено и функционирует на том же компьютере (или сервере), с которого производится запрос к нему.

Такое приложение использует сетевой адрес ***127.0.0.0/8***, который является специальным адресом для обратной связи на компьютере. Весь трафик, направленный на этот адрес, остается внутри компьютера и не покидает его сетевой интерфейс.

Для того, чтобы определить, можно ли обратиться к приложению, работающему на localhost, со следующими IP: *194.34.23.100*, *127.0.0.2*, *127.1.0.1*, *128.0.0.1,* пропингуем эти адреса:

![Пинг ip](screens/1_point_2_localhost.png)\
*Пингуем ip из localhost*

### **1.3. Network ranges and segments**

<details open>
  <summary>Описание IP</summary>

  **Публичные IP(белые IP)** — адреса, которые используются для выхода в интернет и общения с другими устройствами, также обладающими публичными адресами.

  **Частные IP(серые IP)** — адреса, которые используются для связи устройств в локальных сетях. Такие устройства могут общаться между собой только при условии нахождния их в одном адресном пространстве.\
  Для частных IP-адресов выделены 4 подсети:\
  * 10.0.0.0 — 10.255.255.255 с маской 255.0.0.0;
  * 172.16.0.0 – 172.31.255.255 с маской 255.240.0.0;
  * 192.168.0.0 – 192.168.255.255 с маской 255.255.0.0;
  * 100.64.0.0 – 100.127.255.255 с маской 255.192.0.0 (используется в качестве адресов для CG-NAT).
  
  CG-NAT позволяет провайдерам выдавать разным устройствам один и тот же IP для выхода в интернет.
</details>

1) **Публичные IP(белые IP)**: 134.43.0.2, 172.0.2.1, 192.172.0.1, 172.68.0.2, 192.169.168.1.\
**Частные IP(серые IP)**: 10.0.0.45, 192.168.4.2, 172.20.250.4, 172.16.255.255, 10.10.10.10.
2) В диапазон ip адресов 10.10.0.0/18 входят адреса: 10.10.0.2, 10.10.10.10, 10.10.1.255
![ip_range](screens/1_point_3.png)\
*Диапазон ip для 10.10.0.0/18*


## **Part 2. Static routing between two machines**

Перед установкой виртуальных машин выбираем у ws1 и ws2 в настроках в пункте "Сеть" второй адаптер и делаем его активным. В списке доступных сетей выбираем "Внутренняя сеть" и её название, оно должно быть одинаковым на обеих машинах.

![ip_a_ws1](ex02/ex2.1/ws1/ip_a_ws1.png)\
*Сетевые интерфейсы машины ws1*

![ip_a_ws2](ex02/ex2.1/ws2/ip_a_ws2.png)\
*Сетевые интерфейсы машины ws2*

<details open>
  <summary>Описание интерфейсов</summary>

  **lo (сетевой интерфейс)** — виртуальный интерфейс, присутствующий по умолчанию в любом Linux. Он используется для отладки сетевых программ и запуска серверных приложений на локальной машине. С этим интерфейсом всегда связан адрес 127.0.0.1. У него есть dns-имя – localhost. Посмотреть привязку можно в файле /etc/host.

  **enp0s3** — интерфейс "Nat" нашей виртуальной машины. Он позволяет общаться с интернетом.

  **enp0s8** — интерфейс локальной сети с названием "itnet". 
</details>

![config_file_ws1](ex02/ex2.1/ws1/config_file_ws1.png)\
*Изменённый файл конфигурации ip на первой машине*

![config_file_ws2](ex02/ex2.1/ws2/config_file_ws2.png)\
*Изменённый файл конфигурации ip на второй машине*

![changed_ip_ws1](ex02/ex2.1/ws1/changed_ip_ws1.png)\
*Вывод команды `ip a` после применённх изменений на первой машине*

![changed_ip_ws2](ex02/ex2.1/ws2/changed_ip_ws2.png)\
*Вывод команды `ip a` после применённх изменений на второй машине*

### **2.1. Adding a static route manually**

![ip_r_sdd_ws1](ex02/ex2.1/ws1/add_route_ws1.png)\
*Добавление нового статического маршрута на машине 1 командой `ip r add`*

![ip_r_sdd_ws1](ex02/ex2.1/ws2/add_route_ws2.png)\
*Добавление нового статического маршрута на машине 2 командой `ip r add`*

![ping_ws2_form_ws1](ex02/ex2.1/ws1/ping_from_ws1.png)\
*Пинг второй машины*

![ping_ws1_form_ws2](ex02/ex2.1/ws2/ping_from_ws2.png)\
*Пинг первой машины*

### **2.2. Adding a static route with saving**

![ping_ws1_form_ws2](ex02/ex2.2/ws1/manual_route_ws1.png)\
*Статический маршрут на первой машине*

![ping_ws1_form_ws2](ex02/ex2.2/ws2/manual_route_ws2.png)\
*Статический маршрут на второй машине*

![ping_ws2_form_ws1](ex02/ex2.2/ws1/ping_ws2_from_ws1.png)\
*Пинг второй машины*

![ping_ws1_form_ws2](ex02/ex2.2/ws2/ping_ws1_from_ws2.png)\
*Пинг первой машины*

## **Part 3. iperf3 utility**

### **3.1. Connection speed**

* 8 Mbps = 1 MB/s;
* 100 MB/s = 100000 Kbps
* 1 Gbps = 1000 Mbps

### **3.2. iperf3 utility**

Для определения скорости передачи пакетов необходимо сделать машину, принимающую пакеты, сервером. Для этого запустим на ней команду `iperf3 -s`.

![make_ws1_server](ex03/ex3.2/make_ws1_server.png)\
*Использование команды `iperf3 -s`*

![output from sender](ex03/ex3.2/ping_ws1.png)\
*Пингуем первую машину*

![output from server](ex03/ex3.2/output_from_ws2.png)\
*Измеренная скорость на первой машине*

## **Part 4. Network firewall**

### **4.1. iptables utility**

![firewall_ws1](ex04/ex4.1/ws1/firewall_ws1.png)\
*Furiwall первой машины*

![firewall_ws2](ex04/ex4.1/ws2/firewall_ws2.png)\
*Furiwall второй машины*

![Run firewall](ex04/ex4.1/ws2/chmod_ws2.png)\
*Запускаем firewall*

Разница между правилами заключается в том, что в firewall для первой машины мы прописали, что пришедший пакет следует заблокировать, а для второй принять. Потому первую машину попинговать невозмодно, в отличие от второй. Это связано с тем, что приоритет имеет правило идущее первым в файле `firewall.sh`.

### **4.2. nmap utility**

![nmap and ping](ex04/ex4.2/nmap_host_up.png)\
*Использование `ping` и `nmap` для определения неработающей машины*

![save dumps](ex04/ex4.2/dump_ws2.png)\
*Сохранени dump'ов*

## **Part 5. Static network routing**

### **5.1. Configuration of machine addresses**

![ip_ws11](ex05/ex5.1/ws11/config_file_ws11.png)\
*Изменённый файл конфигурации ip на ws11*

![ip_ws21](ex05/ex5.1/ws21/config_file_ws21.png)\
*Изменённый файл конфигурации ip на ws21*

![ip_ws22](ex05/ex5.1/ws22/config_file_ws22.png)\
*Изменённый файл конфигурации ip на ws22*

![ip_r1](ex05/ex5.1/r1/config_file_r1.png)\
*Изменённый файл конфигурации ip на r1*

![ip_r2](ex05/ex5.1/r2/config_file_r2.png)\
*Изменённый файл конфигурации ip на r2*

![ip_a_ws11](ex05/ex5.1/ws11/ip_-4_a_ws11.png)\
*Вывод команды `ip -4 a` на ws11*

![ip_a_ws21](ex05/ex5.1/ws21/ip_-4_a_ws21.png)\
*Вывод команды `ip -4 a` на ws21*

![ipa_a_ws22](ex05/ex5.1/ws22/ip_-4_a_ws22.png)\
*Вывод команды `ip -4 a` на ws22*

![ip_a_r1](ex05/ex5.1/r1/ip_-4_a_r1.png)\
*Вывод команды `ip -4 a` на r1*

![ip_a_r2](ex05/ex5.1/r2/ip_-4_a_r2.png)\
*Вывод команды `ip -4 a` на r2*

![ping_r1_from_ws11](ex05/ex5.1/ping_r1_from_ws11.png)\
*Пинг r1 из ws11*

![ping_ws22_from_ws21](ex05/ex5.1/ping_ws22_from_ws21.png)\
*Пинг ws22 из ws21*

### **5.2. Enabling IP forwarding.**

![systemctl_r2](ex05/ex5.2/r1/sysctl_r1.png)\
*Вызов команды `sysctl -w net.ipv4.ip_forward=1` на r1*

![systemctl_r2](ex05/ex5.2/r2/sysctl_r2.png)\
*Вызов команды `sysctl -w net.ipv4.ip_forward=1` на r2*

![permanent_systemctl_r1](ex05/ex5.2/r1/permanent_sysctl_r1.png)\
*Включение постоянной адресации на r1*

![permanent_systemctl_r2](ex05/ex5.2/r2/permanent_sysctl_r2.png)\
*Включение постоянной адресации на r2*

### **5.3. Default route configuration**

![default_route_ws11](ex05/ex5.3/ws11/default_ws11.png)\
*Шлюз по умолчанию на ws11*

![default_route_ws21](ex05/ex5.3/ws21/default_ws21.png)\
*Шлюз по умолчанию на ws21*

![default_route_ws22](ex05/ex5.3/ws22/default_ws22.png)\
*Шлюз по умолчанию на ws22*

![ip_r_ws11](ex05/ex5.3/ws11/ip_r_ws11.png)\
*Вывод команды `ip r` на ws11*

![ip_r_ws21](ex05/ex5.3/ws21/ip_r_ws21.png)\
*Вывод команды `ip r` на ws21*

![ip_r_ws22](ex05/ex5.3/ws22/ip_r_ws22.png)\
*Вывод команды `ip r` на ws22*

![tcpdump_r2](ex05/ex5.3/r2/tcpdump_r2.png)\
*Вывод команды `tcpdump -tn -i enp0s9` на r2*

### **5.4. Adding static routes**

![config_file_r1](ex05/ex5.4/r1/config_file_r1.png)\
*Изменённый файл конфигурации ip на r1*

![config_file_r2](ex05/ex5.4/r2/config_file_r2.png)\
*Изменённый файл конфигурации ip на r2*

![ip_r_r2](ex05/ex5.4/r2/ip_r_r2.png)\
*Вывод команды `ip r` на r2*

![ip_r_r1](ex05/ex5.4/r1/ip_r_r1.png)\
*Вывод команды `ip r` на r1*

![ip_r_list_ws11](ex05/ex5.4/ws11/ip_r_list_ws11.png)\
*Вывод команд `ip r list 10.10.0.0/18` и `ip r list 0.0.0.0/0` на ws11*

Вызов команды `ip r list 10.10.0.0/18` выведет информацию о маршруте, связанном с конкретной подсетью.

Вызов команды `ip r list 0.0.0.0/0` используется для вывода информации о маршруте по умолчанию. Подсеть `0.0.0.0/0` представляет собой маршрут по умолчанию, который охватывает все возможные IP-адреса. Он указывает, как отправлять сетевой трафик, который не имеет явно заданного маршрута, или для которого не существует более конкретных маршрутов.

Для адреса 10.10.0.0/18 был выбран маршрут, отличный от 0.0.0.0/0, так как машина ws11 соединена с сетью 10.10.0.0/18 по своему IP-адресу 10.10.0.2, для других адресов используется маршрут по умолчанию, который указан в файле - 10.10.0.1.

### **5.5. Making a router list**

![tcpdump_r1](ex05/ex5.5/r1/tcpdump_r1.png)\
*Вывод команды `tcpdump -tnv -i enp0s8` на r1*

![traceroute_ws11](ex05/ex5.5/ws11/traceroute_ws11.png)\
*Вывод команды `traceroute 10.20.0.10` на ws11*

Принцип работы утилиты `traceroute` основан на отправке сетевых **пакетов с TTL** и анализе ответов от промежуточных узлов сети. 
**Пакет данных с TTL**  означает сетевой пакет, в котором задано значение TTL, которое определяет количество промежуточных узлов, через которые пакет может проходить, прежде чем быть отброшенным. TTL является частью заголовка IP-пакета и используется для предотвращения зацикливания или бесконечного циркулирования пакетов в сети.
Вот как происходит построение пути при помощи `traceroute`:

1. Когда запускается `traceroute` к какому-либо адресу (IP-адресу или доменному имени), он начинает отправлять пакеты данных с TTL (Time To Live), установленным на 1, к указанному адресу. 
2. Первый узел (роутер) в сети, через который проходит пакет, уменьшает значение TTL на 1. Если после уменьшения значение TTL становится равным 0, узел отбрасывает пакет и отправляет обратно сообщение "Time Exceeded" обратно отправителю.
3. Отправитель `traceroute` записывает информацию о первом узле, через который прошел пакет, а затем увеличивает значение TTL на 1 и отправляет следующий пакет.
4. Процесс повторяется: каждый промежуточный узел уменьшает TTL, и если TTL достигает 0, он отправляет обратно сообщение "Time Exceeded". Отправитель записывает информацию об этом узле и переходит к следующему шагу.
5. Когда пакет наконец достигает финального пункта назначения (конечного IP-адреса), пункт назначения отправляет ответ "ICMP Echo Reply" (если протокол ICMP используется для пакетов), который достигает отправителя `traceroute`.
6. `traceroute` завершает свою работу, предоставляя список всех узлов (роутеров), через которые проходили пакеты, и информацию о времени, которое требовалось для прохождения каждого узла.

Таким образом, `traceroute` позволяет отследить маршрут, который пакеты данных проходят от отправителя к получателю через сеть, а также измерить задержки (пинг) на каждом промежуточном узле.

### **5.6. Using ICMP protocol in routing**

![tcpdump_r1](ex05/ex5.6/r1/tcpdump_r1.png)\
*Вывод команды `tcpdump -n -i enp0s8` на r1*

![ping_nonexist_from_ws11](ex05/ex5.6/ws11/ping_ws11.png)\
*Вывод команды `ping -c 1 10.30.0.111` на ws11*

![save_dumps](ex05/ex5.6/machine_dumps.png)\
*Сохранени dump'ов*

## **Part 6. Dynamic IP configuration using DHCP**

![DHCP_conf_r2](ex06/r2/dhcpd_file_r2.png)\
*Изменённый файл конфигурации DHCP на r2*

![resolv_conf_r2](ex06/r2/resolv_file_r2.png)\
*Изменённый файл конфигурации resolv на r2*

![reboot_dhcp_r2](ex06/r2/systemctl_restart_r2.png)\
*Вывод команды `systemctl restart isc-dhcp-server` на r2*

![new_ip_ws21](ex06/ws21/get_ip_from_dhcp/old_ip_ws21.png)\
*Новый ip на ws21*

![ping_ws22_from_ws21](ex06/ws21/ping_ws22_ws21.png)\
*Пинг ws22 из ws21*

Повторим ввод аналогичных команд для r1, добавив выдачу ip адреса ws11 по mac адресу. Для того, чтобы выдача по mac-адресу работала, необходимо предварительно его задать:

![change_mac_in_vb_ws11](ex06/ws11/change_settings_ws11.png)\
*Смена mac-адреса в настройках VB*

![change_mac_in_config_file_ws11](ex06/ws11/config_file_ws11.png)\
*Изменённый файл конфигурации на ws11*

![DHCP_conf_r1](ex06/r1/dhcpd_file_r1.png)\
*Изменённый файл конфигурации dhcpd.conf на r1*

![resolv_conf_r1](ex06/r1/resolv_file_r1.png)\
*Изменённый файл конфигурации resolv.conf на r1*

![systemctl_r1](ex06/r1/systemctl_restart_r1.png)\
*Вывод команды `systemctl restart isc-dhcp-server` на r1*

![new_ip_ws11](screens/get_ip_ws11.png)\
*Получение нового ip на ws11*

![new_ip_ws21](screens/new_ip_ws21.png)\
*Получение нового ip на ws21 от DCHP*

Для настройки DHCP использовался конфигурационный файл `/etc/dhcp/dhcpd.conf`.
Сервис *systemctl* для перезапуска и просмотра статуса службы DHCP
Конфигурационный файл `/etc/resolve.conf` для настройки DNS.

![save_dumps](ex06/dumps.png)\
*Сохранени dump'ов*

## **Part 7. NAT**

![ports_conf_r1](ex07/r1/change_ports_conf_r1.png)\
*Изменённый файл конфигурации ports.conf на r1*

![ports_conf_ws22](ex07/ws22/change_ports_conf_ws22.png)\
*Изменённый файл конфигурации ports.conf на ws22*

![start_apache2_r1](ex07/r1/start_apache2_r1.png)\
*Вывод команды `service apache2 start` на r1*

![start_apache2_ws22](ex07/ws22/start_apache2_ws22.png)\
*Вывод команды `service apache2 start` на ws22*

![firewall_r2](ex07/r2/firewall_r2.png)\
*Изменённый файл firewall.sh на r2*

![run_firewall_r2](ex07/r2/chmod_r2.png)\
*Запустим файл firewall.sh на r2*

![ping_ws22_from_r1](ex07/r1/ping_ws22_from_r1.png)\
*Пинг ws22 из r1*

![firewall_with_icmp_r2](ex07/r2/new_firewall_r2.png)\
*Изменённый файл firewall.sh на r2 с icmp*

![run_firewall_r2](ex07/r2/chmod_r2.png)\
*Запустим файл firewall.sh на r2*

![ping_ws22_from_r1](ex07/r1/ping_ws22_after_icmp_r1.png)\
*Пинг ws22 из r1 с icmp*

![SNAT_and_DNAT](ex07/r2/snat_dnat_r2.png)\
*Включение SNAT и DNAT*

![telnet_to_r1_from_ws22](ex07/ws22/telnet_connect_to_r1_ws22.png)\
*Вызов команды `telnet 10.10.0.1 80` на ws22*

![save_dumps](ex07/save_dumps.png)\
*Сохранени dump'ов*

## **Part 8. Bonus. Introduction to SSH Tunnels**

![ports_conf_ws22](ex08/ws22/ports_conf_ws22.png)\
*Изменённый файл конфигурации ports.conf на ws22*

Подключаемся к виртуальной машине ws22 с помощью команды\
`ssh -R 9999:localhost:80 rig@10.20.0.20`

![ssh_to_ws22_from_ws21](ex08/ws21/ssh_to_ws22_ws21.png)\
*Подключение к web серверу ws22 через ws21*

Подключаемся к виртуальной машине ws22 с помощью команды\
`ssh -R 9999:localhost:80 rig@10.20.0.20`

![ssh_to_ws22_from_ws11](ex08/ws11/ssh_to_ws22_ws11.png)\
*Подключение к web серверу ws22 через ws11*

Проверяем доступность порта локального ip: 

![telnet_to_r1_from_ws21](ex08/ws21/telnet_to_ws22_ws21.png)\
*Вызов команды `telnet 10.10.0.1 333` на ws22*

![save_dumps](ex08/dumps.png)\
*Сохранени dump'ов*