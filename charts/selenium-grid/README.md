# Selenium-Grid Helm Chart

This chart enables the creation of a Selenium grid server in Kubernetes.

## Installing the chart

To install the selenium-grid helm chart, you can run:

```bash
# Clone the project
git clone https://github.com/seleniumhq/docker-selenium.git

# Install basic grid
helm install selenium-grid docker-selenium/chart/selenium-grid/.

# Or install full grid (Router, Distributor, EventBus, SessionMap and SessionQueue components separated)
helm install selenium-grid --set isolateComponents=true docker-selenium/chart/selenium-grid/.
```

## Updating Selenium-Grid release

Once you have a new chart version, you can update your selenium-grid running:

```bash
helm upgrade selenium-grid docker-selenium/chart/selenium-grid/.
```

## Uninstalling Selenium Grid release

To uninstall:

```bash
helm uninstall selenium-grid
```

## Configuration

For now, global configuration supported is:

| Parameter                           | Default                            | Description                           |
| ----------------------------------- | ---------------------------------- | ------------------------------------- |
| `global.seleniumGrid.imageTag`      | `4.1.4-20220427`                   | Image tag for all selenium components |
| `global.seleniumGrid.nodesImageTag` | `4.1.4-20220427`                   | Image tag for browser's nodes         |

This table contains the configuration parameters of the chart and their default values:

| Parameter                               | Default                            | Description                                                                                                                |
| --------------------------------------- | ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `isolateComponents`                     | `false`                            | Deploy Router, Distributor, EventBus, SessionMap and Nodes separately                                                      |
| `busConfigMap.name`                     | `selenium-event-bus-config`        | Name of the configmap that contains SE_EVENT_BUS_HOST, SE_EVENT_BUS_PUBLISH_PORT and SE_EVENT_BUS_SUBSCRIBE_PORT variables |
| `busConfigMap.annotations`              | `{}`                               | Custom annotations for configmap                                                                                           |
| `chromeNode.enabled`                    | `true`                             | Enable chrome nodes                                                                                                        |
| `chromeNode.replicas`                   | `1`                                | Number of chrome nodes                                                                                                     |
| `chromeNode.imageName`                  | `selenium/node-chrome`             | Image of chrome nodes                                                                                                      |
| `chromeNode.imageTag`                   | `4.1.4-20220427`                   | Image of chrome nodes                                                                                                      |
| `chromeNode.imagePullPolicy`            | `IfNotPresent`                     | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                             |
| `chromeNode.ports`                      | `[5553]`                           | Port list to enable on container                                                                                           |
| `chromeNode.seleniumPort`               | `5900`                             | Selenium port (spec.ports[0].targetPort in kubernetes service)                                                             |
| `chromeNode.seleniumServicePort`        | `6900`                             | Selenium port exposed in service (spec.ports[0].port in kubernetes service)                                                |
| `chromeNode.annotations`                | `{}`                               | Annotations for chrome-node pods                                                                                           |
| `chromeNode.labels`                     | `{}`                               | Labels for chrome-node pods                                                                                                |
| `chromeNode.resources`                  | `See values.yaml`                  | Resources for chrome-node container                                                                                        |
| `chromeNode.tolerations`                | `[]`                               | Tolerations for chrome-node container                                                                                      |
| `chromeNode.nodeSelector`               | `{}`                               | Node Selector for chrome-node container                                                                                    |
| `chromeNode.extraEnvironmentVariables`  | `nil`                              | Custom environment variables for chrome nodes                                                                              |
| `chromeNode.extraEnvFrom`               | `nil`                              | Custom environment taken from `configMap` or `secret` variables for chrome nodes                                           |
| `chromeNode.service.enabled`            | `true`                             | Create a service for node                                                                                                  |
| `chromeNode.service.type`               | `ClusterIP`                        | Service type                                                                                                               |
| `chromeNode.service.annotations`        | `{}`                               | Custom annotations for service                                                                                             |
| `chromeNode.dshmVolumeSizeLimit`        | `1Gi`                              | Size limit for DSH volume mounted in container (if not set, default is "1Gi")                                              |
| `firefoxNode.enabled`                   | `true`                             | Enable firefox nodes                                                                                                       |
| `firefoxNode.replicas`                  | `1`                                | Number of firefox nodes                                                                                                    |
| `firefoxNode.imageName`                 | `selenium/node-firefox`            | Image of firefox nodes                                                                                                     |
| `firefoxNode.imageTag`                  | `4.1.4-20220427`                   | Image of firefox nodes                                                                                                     |
| `firefoxNode.imagePullPolicy`           | `IfNotPresent`                     | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                             |
| `firefoxNode.ports`                     | `[5553]`                           | Port list to enable on container                                                                                           |
| `firefoxNode.seleniumPort`              | `5900`                             | Selenium port (spec.ports[0].targetPort in kubernetes service)                                                             |
| `firefoxNode.seleniumServicePort`       | `6900`                             | Selenium port exposed in service (spec.ports[0].port in kubernetes service)                                                |
| `firefoxNode.annotations`               | `{}`                               | Annotations for firefox-node pods                                                                                          |
| `firefoxNode.labels`                    | `{}`                               | Labels for firefox-node pods                                                                                               |
| `firefoxNode.resources`                 | `See values.yaml`                  | Resources for firefox-node container                                                                                       |
| `firefoxNode.tolerations`               | `[]`                               | Tolerations for firefox-node container                                                                                     |
| `firefoxNode.nodeSelector`              | `{}`                               | Node Selector for firefox-node container                                                                                   |
| `firefoxNode.extraEnvironmentVariables` | `nil`                              | Custom environment variables for firefox nodes                                                                             |
| `firefoxNode.extraEnvFrom`              | `nil`                              | Custom environment variables taken from `configMap` or `secret` for firefox nodes                                          |
| `firefoxNode.service.enabled`           | `true`                             | Create a service for node                                                                                                  |
| `firefoxNode.service.type`              | `ClusterIP`                        | Service type                                                                                                               |
| `firefoxNode.service.annotations`       | `{}`                               | Custom annotations for service                                                                                             |
| `firefoxNode.dshmVolumeSizeLimit`       | `1Gi`                              | Size limit for DSH volume mounted in container (if not set, default is "1Gi")                                              |
| `edgeNode.enabled`                      | `true`                             | Enable edge nodes                                                                                                          |
| `edgeNode.replicas`                     | `1`                                | Number of edge nodes                                                                                                       |
| `edgeNode.imageName`                    | `selenium/node-edge`               | Image of edge nodes                                                                                                        |
| `edgeNode.imageTag`                     | `4.1.4-20220427`                   | Image of edge nodes                                                                                                        |
| `edgeNode.imagePullPolicy`              | `IfNotPresent`                     | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                             |
| `edgeNode.ports`                        | `[5553]`                           | Port list to enable on container                                                                                           |
| `edgeNode.seleniumPort`                 | `5900`                             | Selenium port (spec.ports[0].targetPort in kubernetes service)                                                             |
| `edgeNode.seleniumServicePort`          | `6900`                             | Selenium port exposed in service (spec.ports[0].port in kubernetes service)                                                |
| `edgeNode.annotations`                  | `{}`                               | Annotations for edge-node pods                                                                                             |
| `edgeNode.labels`                       | `{}`                               | Labels for edge-node pods                                                                                                  |
| `edgeNode.resources`                    | `See values.yaml`                  | Resources for edge-node container                                                                                          |
| `edgeNode.tolerations`                  | `[]`                               | Tolerations for edge-node container                                                                                        |
| `edgeNode.nodeSelector`                 | `{}`                               | Node Selector for edge-node container                                                                                      |
| `edgeNode.extraEnvironmentVariables`    | `nil`                              | Custom environment variables for firefox nodes                                                                             |
| `edgeNode.extraEnvFrom`                 | `nil`                              | Custom environment taken from `configMap` or `secret` variables for firefox nodes                                          |
| `edgeNode.service.enabled`              | `true`                             | Create a service for node                                                                                                  |
| `edgeNode.service.type`                 | `ClusterIP`                        | Service type                                                                                                               |
| `edgeNode.service.annotations`          | `{}`                               | Custom annotations for service                                                                                             |
| `edgeNode.dshmVolumeSizeLimit`          | `1Gi`                              | Size limit for DSH volume mounted in container (if not set, default is "1Gi")                                              |
| `customLabels`                          | `{}`                               | Custom labels for k8s resources                                                                                            |


### Configuration for Selenium-Hub

You can configure the Selenium Hub with this values:

| Parameter                       | Default           | Description                                                                                                                      |
| ------------------------------- | ----------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `hub.imageName`                 | `selenium/hub`    | Selenium Hub image name                                                                                                          |
| `hub.imageTag`                  | `nil`             | Selenium Hub image tag (this overwrites `.global.seleniumGrid.imageTag` value)                                                   |
| `hub.imagePullPolicy`           | `IfNotPresent`    | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `hub.annotations`               | `{}`              | Custom annotations for Selenium Hub pod                                                                                          |
| `hub.labels`                    | `{}`              | Custom labels for Selenium Hub pod                                                                                               |
| `hub.publishPort`               | `4442`            | Port where events are published                                                                                                  |
| `hub.subscribePort`             | `4443`            | Port where to subscribe for events                                                                                               |
| `hub.port`                      | `4444`            | Selenium Hub port                                                                                                                |
| `hub.livenessProbe`             | `See values.yaml` | Liveness probe settings                                                                                                          |
| `hub.readinessProbe`            | `See values.yaml` | Readiness probe settings                                                                                                         |
| `hub.tolerations`               | `[]`              | Tolerations for selenium-hub container                                                                                           |
| `hub.nodeSelector`              | `{}`              | Node Selector for selenium-hub container                                                                                         |
| `hub.extraEnvironmentVariables` | `nil`             | Custom environment variables for selenium-hub                                                                                    |
| `hub.extraEnvFrom`              | `nil`             | Custom environment variables for selenium taken from `configMap` or `secret`-hub                                                 |
| `hub.resources`                 | `{}`              | Resources for selenium-hub container                                                                                             |
| `hub.serviceType`               | `NodePort`        | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `hub.serviceAnnotations`        | `{}`              | Custom annotations for Selenium Hub service                                                                                      |


### Configuration for isolated components

If you implement selenium-grid with separate components (`isolateComponents: true`), you can configure all components via the following values:

| Parameter                                     | Default                   | Description                                                                                                                      |
| --------------------------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `components.router.imageName`                 | `selenium/router`         | Router image name                                                                                                                |
| `components.router.imageTag`                  | `nil`                     | Router image tag (this overwrites `.global.seleniumGrid.imageTag` value)                                                         |
| `components.router.imagePullPolicy`           | `IfNotPresent`            | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `components.router.annotations`               | `{}`                      | Custom annotations for router pod                                                                                                |
| `components.router.port`                      | `4444`                    | Router port                                                                                                                      |
| `components.router.livenessProbe`             | `See values.yaml`         | Liveness probe settings                                                                                                          |
| `components.router.readinessProbe`            | `See values.yaml`         | Readiness probe settings                                                                                                         |
| `components.router.resources`                 | `{}`                      | Resources for router container                                                                                                   |
| `components.router.serviceType`               | `NodePort`                | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `components.router.serviceAnnotations`        | `{}`                      | Custom annotations for router service                                                                                            |
| `components.distributor.imageName`            | `selenium/distributor`    | Distributor image name                                                                                                           |
| `components.distributor.imageTag`             | `nil`                     | Distributor image tag  (this overwrites `.global.seleniumGrid.imageTag` value)                                                   |
| `components.distributor.imagePullPolicy`      | `IfNotPresent`            | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `components.distributor.annotations`          | `{}`                      | Custom annotations for Distributor pod                                                                                           |
| `components.distributor.port`                 | `5553`                    | Distributor port                                                                                                                 |
| `components.distributor.resources`            | `{}`                      | Resources for Distributor container                                                                                              |
| `components.distributor.serviceType`          | `ClusterIP`               | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `components.distributor.serviceAnnotations`   | `{}`                      | Custom annotations for Distributor service                                                                                       |
| `components.eventBus.imageName`               | `selenium/event-bus`      | Event Bus image name                                                                                                             |
| `components.eventBus.imageTag`                | `nil`                     | Event Bus image tag  (this overwrites `.global.seleniumGrid.imageTag` value)                                                     |
| `components.eventBus.imagePullPolicy`         | `IfNotPresent`            | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `components.eventBus.annotations`             | `{}`                      | Custom annotations for Event Bus pod                                                                                             |
| `components.eventBus.port`                    | `5557`                    | Event Bus port                                                                                                                   |
| `components.eventBus.publishPort`             | `4442`                    | Port where events are published                                                                                                  |
| `components.eventBus.subscribePort`           | `4443`                    | Port where to subscribe for events                                                                                               |
| `components.eventBus.resources`               | `{}`                      | Resources for event-bus container                                                                                                |
| `components.eventBus.serviceType`             | `ClusterIP`               | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `components.eventBus.serviceAnnotations`      | `{}`                      | Custom annotations for Event Bus service                                                                                         |
| `components.sessionMap.imageName`             | `selenium/sessions`       | Session Map image name                                                                                                           |
| `components.sessionMap.imageTag`              | `nil`                     | Session Map image tag  (this overwrites `.global.seleniumGrid.imageTag` value)                                                   |
| `components.sessionMap.imagePullPolicy`       | `IfNotPresent`            | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `components.sessionMap.annotations`           | `{}`                      | Custom annotations for Session Map pod                                                                                           |
| `components.sessionMap.resources`             | `{}`                      | Resources for event-bus container                                                                                                |
| `components.sessionMap.serviceType`           | `ClusterIP`               | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `components.sessionMap.serviceAnnotations`    | `{}`                      | Custom annotations for Session Map service                                                                                       |
| `components.sessionQueue.imageName`           | `selenium/session-queue`  | Session Queue image name                                                                                                         |
| `components.sessionQueue.imageTag`            | `nil`                     | Session Queue image tag  (this overwrites `.global.seleniumGrid.imageTag` value)                                                 |
| `components.sessionQueue.imagePullPolicy`     | `IfNotPresent`            | Image pull policy (see https://kubernetes.io/docs/concepts/containers/images/#updating-images)                                   |
| `components.sessionQueue.annotations`         | `{}`                      | Custom annotations for Session Queue pod                                                                                         |
| `components.sessionQueue.resources`           | `{}`                      | Resources for event-bus container                                                                                                |
| `components.sessionQueue.serviceType`         | `ClusterIP`               | Kubernetes service type (see https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| `components.sessionQueue.serviceAnnotations`  | `{}`                      | Custom annotations for Session Queue service                                                                                     |
| `components.extraEnvironmentVariables`        | `nil`                     | Custom environment variables for all components                                                                                  |
| `components.extraEnvFrom`                     | `nil`                     | Custom environment variables taken from `configMap` or `secret` for all components                                               |

See how to customize a helm chart installation in the [Helm Docs](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing) for more information.
