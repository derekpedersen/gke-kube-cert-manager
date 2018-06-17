deploy:
	kubectl apply -f ./kube-cert-manager/deployment.yaml

delete:
	kubectl delete deployment kube-cert-manager-deployment

secret:
	kubectl create -f ./kube-cert-manager/secret.yaml

certificate:
	kubectl create -f ./kube-cert-manager/certificate.yaml

rbac:
	kubectl apply -f ./kube-cert-manager/rbac.yaml

kubernetes: certificate deploy

