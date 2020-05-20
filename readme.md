# theITHollow Warden

This project is for setting up a basic Kubernetes validating Admission
Controller using python.

Steps to build your own admission controller.

1. Create your custom logic. There is an example admission controller shown in
   the /app directory that looks for a "billing" label to be applied to pods and
   deployments.

2. Update certgen.sh to match your admission controller. You may need to update
   the service and namespace where the controller lives.

3. Run the certgen.sh script to create the self-signed certificates for the
   admission controller.

4. Get the base64 value of the ca.crt file created by the certgen.sh script. 
`cat certs/ca.crt | base64`

5. Paste the base64 value into the caBundle location in the webhook.yaml file.

6. Build the container using the Dockerfile within the directory. Push the image
   to your image repository

7. Update the warden-k8s.yaml file to point to your new image.

8. apply the warden-k8s.yaml file to deploy your admission controller within the
   cluster.

9. Apply the webhook.yaml file to deploy the validation configuration to the
   Kubernetes API server.

10. Test your app. If using the default warden.py included with this repository,
    there are three test manifests in the [test-pods](/test-pods) folder.