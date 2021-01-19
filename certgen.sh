keydir="certs"
cd "$keydir"

# CA cert and private key
openssl req -nodes -new -x509 -keyout ca.key -sha256 -days 365 -out ca.crt -subj "/CN=Warden Controller Webhook"

# private key for the webhook server
  
openssl req -out warden.csr -newkey rsa:2048 -nodes -keyout warden.key -config ../ext.cnf

#verify the csr
openssl req -in warden.csr -noout -text

#Create certificate using CSR and Root CA

openssl x509 -req -days 365 -in warden.csr -signkey ca.key -out warden.crt -extfile ../ext.cnf -extensions req_ext
 
#cp warden.crt wardencrt.pem \
cp warden.crt wardencrt.pem \
    | openssl rsa -in warden.key -text > wardenkey.pem