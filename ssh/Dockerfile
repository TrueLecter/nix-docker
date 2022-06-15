FROM truelecter86/nix:base-2022-06-13

RUN nix-env -f '<nixpkgs>' -iA \
    gnused \
    openssh \
 && nix-store --gc

RUN mkdir -p /etc/ssh \
 && echo "sshd:x:498:65534::/var/empty:/run/current-system/sw/bin/nologin" >> /etc/passwd \
 && cp /root/.nix-profile/etc/ssh/sshd_config /etc/ssh \
 && sed -i '/^PermitRootLogin/d' /etc/ssh/sshd_config \
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
 && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N "" -t rsa \
 && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N "" -t dsa \
 && echo "export NIX_PATH=$NIX_PATH" >> /etc/bashrc \
 && echo "export NIX_SSL_CERT_FILE=$NIX_SSL_CERT_FILE" >> /etc/bashrc \
 && echo "export PATH=$PATH" >> /etc/bashrc \
 && echo "source /etc/bashrc" >> /etc/profile

ADD insecure_rsa /root/.ssh/id_rsa
ADD insecure_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22

# /nix/store/9yxa3k5hpb86p33w27anphnc79jzx9jz-openssh-9.0p1

CMD ["nix-shell", "-p", "openssh", "--run ", "sshd -D -e"]
