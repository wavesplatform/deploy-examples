# 0. Download
Get helm chart

```
git clone git@github.com:wavesplatform/deploy-examples.git
cd deploy-examples/kubernetes/helm
```

# 1. Configure
You can configure chart using `values.yaml` or using `set` argument on start

Essential parameters

| Parameter | Type | Default value | Description |
| -- | -- | -- | -- |
| `postgresql.enabled` | `boolean` | `true` | Whether to use local PostgreSQL |
| `postgresql.host` | `string` | | Database host, only for case with remote PostgreSQL instance (`postgresql.enabled=false`) |
| `postgresql.service.port` | `number` | 5432 | Database port, only for case with remote PostgreSQL instance (`postgresql.enabled=false`) |
| `postgresql.postgresqlDatabase` | `string` | `mainnet` | Database name |
| `postgresql.postgresqlPassword` | `string` | `mypass` | Password for superuser `postgres` |
| `postgresql.writer.username` | `string` | `writer` | Username for user with write permissions (used by crawler, candles and pairs) |
| `postgresql.writer.password` | `string` | `writer` | Password for writer user |
| `postgresql.reader.username` | `string` | `reader` | Username for user with read permissions (used by data-service) |
| `postgresql.reader.password` | `string` | `reader` | Password for reader user |
| `crawler.nodeUrl` | `string` | `http://nodes.wavesnodes.com` | Url for your Waves node with enabled REST API |
| `dataService.enabled` | `boolean` | `true` | Whether to run DataService API |
| `dataService.service.type` | `string` | `NodePort` | K8s service type for DataService API (ref: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `dataService.service.nodePort` | `number` | 30000 | K8s NodePort-typed service port for DataService API. After starting release, use can access API by `${cluster-host}:${dataService.service.nodePort}` |
| `dataService.candles.enabled` | `boolean` | `true` | Whether to run Candles-calculation daemon |
| `dataService.pairs.enabled` | `boolean` | `true` | Whether to run Pairs-calculation daemon |
| `dataService.docs.enabled` | `boolean` | `true` | Whether to run DataService Docs |
| `dataService.docs.service.type` | `string` | `NodePort` | K8s service type for DataService Docs (ref: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `dataService.docs.service.nodePort` | `number` | 30001 | K8s NodePort-typed service port for DataService Docs. After starting release, use can access Docs by `${cluster-host}:${dataService.docs.service.nodePort}` |

# 2. Start 

```
helm dependencies update waves-data-service
helm install --name your_helm_release_name --namespace your_k8s_namespace waves-data-service
```

# 3. Test
```
helm test your_helm_release_name
```

# 4. Uninstall
```
helm delete --purge your_helm_release_name
```