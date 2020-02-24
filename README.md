# gke-kube-cert-manager #

This has been replaced by the use of [nginx ingress controller](https://github.com/derekpedersen/gke-nginx-proxy/blob/master/production_issuer.yaml) and [https://cert-manager.io](https://github.com/derekpedersen/gke-nginx-proxy/blob/master/ingress.yaml#L7).

```yaml

apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # Email address used for ACME registration
    email: derek@not_an_email.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      # Name of a secret used to store the ACME account private key
      name: letsencrypt-prod
    # Add a single challenge solver, HTTP01 using nginx
    solvers:
    - http01:
        ingress:
          class: nginx
```
