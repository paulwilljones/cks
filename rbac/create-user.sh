openssl genrsa -out jane.key 2048
openssl req -new -key jane.key -out jane.csr # only set Common Name = jane


# create CertificateSigningRequest with base64 jane.csr
https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests
cat jane.csr | base64 -w 0


# add new KUBECONFIG
k config set-credentials jane --client-key=jane.key --client-certificate=jane.crt
k config set-context jane --cluster=kubernetes --user=jane
k config view
k config get-contexts
k config use-context jane
