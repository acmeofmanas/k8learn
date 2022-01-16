[root@node1 ~]# kubeadm token list

[root@node1 ~]#  kubeadm token generate
94m52y.3mkefbqwrstn6klr

[root@node1 ~]# kubeadm token create 94m52y.3mkefbqwrstn6klr --print-join-command

[root@node1 ~]# kubeadm join node1:6443 --token 94m52y.3mkefbqwrstn6klr --discovery-token-ca-cert-hash sha256:a195c037027011652572581b476aac83b79144bd921961c1310ca96eccd271d1

