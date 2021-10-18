NAME_PROJECT = kind-helm-kubernetes-default
KIND_DIR = kind
KIND_CLUSTER = kind.yml

all:
	echo -e "Execute from kind local" 	\
		  	"UP -> Create Cluster"		\
			"Down -> Delete Cluster"

generate:
	kind create cluster --name $(NAME_PROJECT) --config=$(KIND_DIR)/$(KIND_CLUSTER)

up: generate install

down:
	kind delete cluster --name $(NAME_PROJECT)

install:
	timeout 60
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml