# 0. Download
Get helm chart

Download dependencies
`helm dependencies update waves-data-service`

# 1. Configure
You can configure chart using `values.yaml` or using `set` argument on start

# 2. Start 
`helm install --name your_release_name --namespace your_namespace waves-data-service`

# 3. Test
`helm test your_release_name`