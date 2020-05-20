keydir="certs"
cd "$keydir"

# CA cert and private key
openssl req -nodes -new -x509 -keyout ca.key -out ca.crt -subj "/CN=Warden Controller Webook"
# private key for the webhook server
openssl genrsa -out warden.key 2048
# Generate and sign the key
openssl req -new -key warden.key -subj "/CN=warden.validation.svc." \
    | openssl x509 -req -CA ca.crt -CAkey ca.key -CAcreateserial -out warden.crt 
# Create .pem versions
cp warden.crt wardencrt.pem \
    | cp warden.key wardenkey.pem