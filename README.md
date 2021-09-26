# k8learn
K8 deploy 3 nodes

Last login: Sun Sep 26 11:21:58 on ttys001
manaspradhan@Manass-MBP Downloads % vm1
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"/etc/hosts" 2L, 158B                                         1,1           All
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
Last login: Sun Sep 26 12:58:29 2021 from fe80::d1bf:87c:231d:5713%enp0s5
[root@node1 ~]# cat .ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPNSP6uvlmbRdXRYvL9yvKwiGc5W8FoohR3I8iCfSIb3y9fLGgMOT0JVzmSShwP1haZqU+hUxLC9pbVxaGlP69eGA3Fl0zp3DmKHP0qRai4eIZ0Hy0ohGrm4sxjDVKwsIbuh2CvyXZdC1aq75tTEXDTU7TLDdoy3JoVo1CPGXWsT4ZoN1paCb4EzgQXQSMDG+Z7H2kkaCg5XECbJz16jzdOcICY8tNTst0eivGTxwhU/F3S0EpOlfqmGtTzI6KBoCEvfT8Y7+9aS67TYS/15oTSmoN+eKKAsEUvMrRLhApmqwzGVEZyNDZzOYBoSBjqbzXZszMNqObykEVEDti1HmYg4mOAdnqCMQBg5mJvusriNOzc8HQAmHuJUkr3J4mg38syXyWergPKsfKd1foqVqzmHEd2PbkN2dZEMCrNKCfzNGo3hWHQgB6AlDmaSTcacI8am7j2gApnDQzPD/GYDWTpxzzVyqne4QrWNCAmzcH6q+DGm+v2BIBKUbt242g6fU= root@fedora
[root@node1 ~]# ssh node2
The authenticity of host 'node2 (10.211.55.4)' can't be established.
ED25519 key fingerprint is SHA256:ZRpO+6raZXNuMm9g7UV9snf8XkZgp7+eMw7VO8Rwcz8.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:2: 10.211.55.4
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'node2' (ED25519) to the list of known hosts.
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"/etc/hosts" 2L, 158B                                         1,1           All
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
Last login: Sun Sep 26 12:55:56 2021
[root@node2 ~]#
logout
Connection to node2 closed.
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.211.55.4 node2
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"/etc/hosts" 3L, 176B                                         3,17          All
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
[root@node1 ~]# ssh 10.211.55.5
Last login: Sun Sep 26 18:39:05 2021 from 10.211.55.2
[root@node3 ~]# vim /etc/hosts
[root@node3 ~]#
logout
Connection to 10.211.55.5 closed.
[root@node1 ~]# ssh 10.211.55.5
Last login: Sun Sep 26 18:42:36 2021 from 10.211.55.3
[root@node3 ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.211.55.3 node1
10.211.55.4 node2
10.211.55.5 node3
[root@node3 ~]#
logout
Connection to 10.211.55.5 closed.
[root@node1 ~]# ssh 10.211.55.4
Last login: Sun Sep 26 18:41:33 2021 from 10.211.55.3
[root@node2 ~]# vim /etc/hosts
[root@node2 ~]#
logout
Connection to 10.211.55.4 closed.
[root@node1 ~]# vim /etc/hosts
[root@node1 ~]# for i in node{1..3};do ssh $i "systemctl get-defaults";done
The authenticity of host 'node1 (10.211.55.3)' can't be established.
ED25519 key fingerprint is SHA256:SSwrqA1gEd+4VEiwQXITCkYsaY7Gudad+Fps9aTCyg4.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:1: fedora
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'node1' (ED25519) to the list of known hosts.
Unknown command verb get-defaults.
Unknown command verb get-defaults.
The authenticity of host 'node3 (10.211.55.5)' can't be established.
ED25519 key fingerprint is SHA256:qWo87oPM6ZnkBQ0ZVPRSPD87z9Sf54/Ak5zFChOCrpI.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:5: 10.211.55.5
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'node3' (ED25519) to the list of known hosts.
Unknown command verb get-defaults.
[root@node1 ~]# for i in node{1..3};do echo $i; ssh $i "systemctl get-default";done
node1
multi-user.target
node2
multi-user.target
node3
multi-user.target
[root@node1 ~]# lsm
lsmdev  lsmem   lsmod
[root@node1 ~]# lsmod |grep br_net
[root@node1 ~]#
[root@node1 ~]# cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
[root@node1 ~]# more /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
[root@node1 ~]# for i in node {2..3};do scp /etc/yum.repos.d/kubernetes.repo $i:/etc/yum.repos.d/kubernetes.repo;done
ssh: Could not resolve hostname node: Name or service not known
lost connection
ssh: connect to host 0.0.0.2 port 22: Connection refused
lost connection
ssh: connect to host 0.0.0.3 port 22: Connection refused
lost connection
[root@node1 ~]# for i in node{1..3};do echo $i; ssh $i "ls -ltrh /etc/yum.repos.d/kubernetes.repo";done
node1
-rw-r--r--. 1 root root 298 Sep 26 18:47 /etc/yum.repos.d/kubernetes.repo
node2
ls: cannot access '/etc/yum.repos.d/kubernetes.repo': No such file or directory
node3
ls: cannot access '/etc/yum.repos.d/kubernetes.repo': No such file or directory
[root@node1 ~]# scp /etc/yum.repos.d/kubernetes.repo node2:/etc/yum.repos.d/kubernetes.repo
kubernetes.repo                                                                                   100%  298   733.1KB/s   00:00
[root@node1 ~]# scp /etc/yum.repos.d/kubernetes.repo node3:/etc/yum.repos.d/kubernetes.repo
kubernetes.repo                                                                                   100%  298   855.6KB/s   00:00
[root@node1 ~]# for i in node{1..3};do echo $i; ssh $i "ls -ltrh /etc/yum.repos.d/kubernetes.repo";done
node1
-rw-r--r--. 1 root root 298 Sep 26 18:47 /etc/yum.repos.d/kubernetes.repo
node2
-rw-r--r--. 1 root root 298 Sep 26 18:49 /etc/yum.repos.d/kubernetes.repo
node3
-rw-r--r--. 1 root root 298 Sep 26 18:49 /etc/yum.repos.d/kubernetes.repo
[root@node1 ~]#
[root@node1 ~]#  yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
Kubernetes                                                                                          752  B/s | 844  B     00:01
Kubernetes                                                                                           13 kB/s | 3.4 kB     00:00
Importing GPG key 0x307EA071:
 Userid     : "Rapture Automatic Signing Key (cloud-rapture-signing-key-2021-03-01-08_01_09.pub)"
 Fingerprint: 7F92 E05B 3109 3BEF 5A3C 2D38 FEEA 9169 307E A071
 From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
Importing GPG key 0x836F4BEB:
 Userid     : "gLinux Rapture Automatic Signing Key (//depot/google3/production/borg/cloud-rapture/keys/cloud-rapture-pubkeys/cloud-rapture-signing-key-2020-12-03-16_08_05.pub) <glinux-team@google.com>"
 Fingerprint: 59FE 0256 8272 69DC 8157 8F92 8B57 C5C2 836F 4BEB
 From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
Kubernetes                                                                                           22 kB/s | 975  B     00:00
Importing GPG key 0x3E1BA8D5:
 Userid     : "Google Cloud Packages RPM Signing Key <gc-team@google.com>"
 Fingerprint: 3749 E1BA 95A8 6CE0 5454 6ED2 F09C 394C 3E1B A8D5
 From       : https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
Kubernetes                                                                                           39 kB/s | 124 kB     00:03
Dependencies resolved.
====================================================================================================================================
 Package                                 Architecture             Version                         Repository                   Size
====================================================================================================================================
Installing:
 kubeadm                                 aarch64                  1.22.2-0                        kubernetes                  7.9 M
 kubectl                                 aarch64                  1.22.2-0                        kubernetes                  8.2 M
 kubelet                                 aarch64                  1.22.2-0                        kubernetes                   21 M
Installing dependencies:
 conntrack-tools                         aarch64                  1.4.5-7.fc34                    fedora                      203 k
 cri-tools                               aarch64                  1.13.0-0                        kubernetes                  8.1 M
 libnetfilter_cthelper                   aarch64                  1.0.0-19.fc34                   fedora                       22 k
 libnetfilter_cttimeout                  aarch64                  1.0.0-17.fc34                   fedora                       23 k
 libnetfilter_queue                      aarch64                  1.0.2-17.fc34                   fedora                       26 k
 socat                                   aarch64                  1.7.4.1-2.fc34                  fedora                      303 k

Transaction Summary
====================================================================================================================================
Install  9 Packages

Total download size: 46 M
Installed size: 245 M
Downloading Packages:
(1/9): libnetfilter_cttimeout-1.0.0-17.fc34.aarch64.rpm                                             106 kB/s |  23 kB     00:00
(2/9): libnetfilter_cthelper-1.0.0-19.fc34.aarch64.rpm                                               94 kB/s |  22 kB     00:00
(3/9): libnetfilter_queue-1.0.2-17.fc34.aarch64.rpm                                                 236 kB/s |  26 kB     00:00
(4/9): conntrack-tools-1.4.5-7.fc34.aarch64.rpm                                                     610 kB/s | 203 kB     00:00
(5/9): socat-1.7.4.1-2.fc34.aarch64.rpm                                                             1.1 MB/s | 303 kB     00:00
(6/9): 5bc3b29b485f36daef6b59213a25559c91cf6ba4f205f7e4cb8e5289fad8fbd6-cri-tools-1.13.0-0.aarch64. 827 kB/s | 8.1 MB     00:10
(7/9): 1408229bbf271492acb2a693ce344bc664ec73fdf080cea2358f81c47c010408-kubectl-1.22.2-0.aarch64.rp 787 kB/s | 8.2 MB     00:10
(8/9): cc04cd5072f0c29044229c95b42bd07ee484fd7e7f784b9f6cc69b3c25d1ca8d-kubeadm-1.22.2-0.aarch64.rp 693 kB/s | 7.9 MB     00:11
(9/9): a097430adcf96bcacf46693e4ed96795c44d6587b714260f510ea22e7078dcf9-kubelet-1.22.2-0.aarch64.rp 2.5 MB/s |  21 MB     00:08
------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                               2.3 MB/s |  46 MB     00:19
Kubernetes                                                                                           81 kB/s | 3.4 kB     00:00
Importing GPG key 0x307EA071:
 Userid     : "Rapture Automatic Signing Key (cloud-rapture-signing-key-2021-03-01-08_01_09.pub)"
 Fingerprint: 7F92 E05B 3109 3BEF 5A3C 2D38 FEEA 9169 307E A071
 From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
Key imported successfully
Importing GPG key 0x836F4BEB:
 Userid     : "gLinux Rapture Automatic Signing Key (//depot/google3/production/borg/cloud-rapture/keys/cloud-rapture-pubkeys/cloud-rapture-signing-key-2020-12-03-16_08_05.pub) <glinux-team@google.com>"
 Fingerprint: 59FE 0256 8272 69DC 8157 8F92 8B57 C5C2 836F 4BEB
 From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
Key imported successfully
Kubernetes                                                                                           14 kB/s | 975  B     00:00
Importing GPG key 0x3E1BA8D5:
 Userid     : "Google Cloud Packages RPM Signing Key <gc-team@google.com>"
 Fingerprint: 3749 E1BA 95A8 6CE0 5454 6ED2 F09C 394C 3E1B A8D5
 From       : https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                            1/1
  Installing       : kubectl-1.22.2-0.aarch64                                                                                   1/9
  Installing       : cri-tools-1.13.0-0.aarch64                                                                                 2/9
  Installing       : socat-1.7.4.1-2.fc34.aarch64                                                                               3/9
  Installing       : libnetfilter_queue-1.0.2-17.fc34.aarch64                                                                   4/9
  Installing       : libnetfilter_cttimeout-1.0.0-17.fc34.aarch64                                                               5/9
  Installing       : libnetfilter_cthelper-1.0.0-19.fc34.aarch64                                                                6/9
  Installing       : conntrack-tools-1.4.5-7.fc34.aarch64                                                                       7/9
  Running scriptlet: conntrack-tools-1.4.5-7.fc34.aarch64                                                                       7/9
  Installing       : kubelet-1.22.2-0.aarch64                                                                                   8/9
  Installing       : kubeadm-1.22.2-0.aarch64                                                                                   9/9
  Running scriptlet: kubeadm-1.22.2-0.aarch64                                                                                   9/9
  Verifying        : conntrack-tools-1.4.5-7.fc34.aarch64                                                                       1/9
  Verifying        : libnetfilter_cthelper-1.0.0-19.fc34.aarch64                                                                2/9
  Verifying        : libnetfilter_cttimeout-1.0.0-17.fc34.aarch64                                                               3/9
  Verifying        : libnetfilter_queue-1.0.2-17.fc34.aarch64                                                                   4/9
  Verifying        : socat-1.7.4.1-2.fc34.aarch64                                                                               5/9
  Verifying        : cri-tools-1.13.0-0.aarch64                                                                                 6/9
  Verifying        : kubeadm-1.22.2-0.aarch64                                                                                   7/9
  Verifying        : kubectl-1.22.2-0.aarch64                                                                                   8/9
  Verifying        : kubelet-1.22.2-0.aarch64                                                                                   9/9

Installed:
  conntrack-tools-1.4.5-7.fc34.aarch64         cri-tools-1.13.0-0.aarch64               kubeadm-1.22.2-0.aarch64
  kubectl-1.22.2-0.aarch64                     kubelet-1.22.2-0.aarch64                 libnetfilter_cthelper-1.0.0-19.fc34.aarch64
  libnetfilter_cttimeout-1.0.0-17.fc34.aarch64 libnetfilter_queue-1.0.2-17.fc34.aarch64 socat-1.7.4.1-2.fc34.aarch64

Complete!
[root@node1 ~]#
Repeat. install on both node2 n node3
