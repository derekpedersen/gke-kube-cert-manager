deploy:
	kubectl apply -f ./kube-cert-manager/deployment.yaml

delete:
	kubectl delete deployment kube-cert-manager-deployment

secret:
	kubectl create -f ./kube-cert-manager/secret.yaml

certificate:
	kubectl create -f ./kube-cert-manager/certificate.yaml

certificate-example:
	kubectl create -f ./kube-cert-manager/certificate-example.yaml

rbac:
	kubectl apply -f ./kube-cert-manager/rbac.yaml

service:
	kubectl apply -f ./kube-cert-manager/service.yaml

kubernetes: certificate deploy

