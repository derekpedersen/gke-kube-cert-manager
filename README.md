# gke-kube-cert-manager #

This is my deployment of the [kube cert manager for gcloud k8s cluster](https://github.com/PalmStoneGames/kube-cert-manager).

## deployment guide ##

1. Create cluster - disable legacy authentication

2. kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=derek-pedersen@derekpedersen.com

3. gcloud --project derekpedersen-195304 iam service-accounts create kube-cert-manager --display-name "kube-cert-manager"

4. gcloud --project derekpedersen-195304 iam service-accounts keys create ~/.config/kube-cert-manager.json --iam-account kube-cert-manager@derekpedersen-195304.iam.gserviceaccount.com

5. gcloud --project derekpedersen-195304 projects add-iam-policy-binding derekpedersen-195304 --member serviceAccount:kube-cert-manager@derekpedersen-195304.iam.gserviceaccount.com --role roles/dns.admin

6. echo `cat ~/.config/kube-cert-manager.json` | base64

7. Update secret.yaml with the new base64 string

8. kubectl create clusterrolebinding owner-cluster-admin-binding --clusterrole cluster-admin --user derek-pedersen@derekpedersen.com

9. make certificate

10. make secret

11. make rbac

12. make deploy

13. Create certificates in gke-nginx-proxy project