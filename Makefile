NAME_PROJECT = kind-helm-kubernetes-default
KIND_DIR = kind
KIND_CLUSTER = kind.yml

all:
	echo -e "Execute from kind local" 	\
		  	"UP -> Create Cluster"		\
			"Down -> Delete Cluster"

generate:
	kind create cluster --name $(NAME_PROJECT) --config=$(KIND_DIR)/$(KIND_CLUSTER)

up: generate install execute

down:
	kind delete cluster --name $(NAME_PROJECT)

install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

execute:
	timeout 120
	kubectl apply -f ./kubernetes/