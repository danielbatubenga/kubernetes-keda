#!/bin/bash

NAMESPACE="keda"
SERVICE_ACCOUNT="keda-operator"

# Verifica se o ServiceAccount existe
if kubectl get serviceaccount $SERVICE_ACCOUNT -n $NAMESPACE > /dev/null 2>&1; then
    echo "Atualizando o ServiceAccount '$SERVICE_ACCOUNT' no namespace '$NAMESPACE'."

    # Adiciona ou sobrescreve o label
    kubectl label serviceaccount $SERVICE_ACCOUNT -n $NAMESPACE app.kubernetes.io/managed-by=Helm --overwrite

    # Adiciona ou sobrescreve as anotações
    kubectl annotate serviceaccount $SERVICE_ACCOUNT -n $NAMESPACE meta.helm.sh/release-name=keda --overwrite
    kubectl annotate serviceaccount $SERVICE_ACCOUNT -n $NAMESPACE meta.helm.sh/release-namespace=keda --overwrite

    echo "Atualizações concluídas com sucesso."
else
    echo "O ServiceAccount '$SERVICE_ACCOUNT' não existe no namespace '$NAMESPACE'."
fi