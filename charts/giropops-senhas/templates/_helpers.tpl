{{/*
Dessa forma e feito um comentario
*/}}
{{- define "qualquernome" -}}
app: {{ .labels.app | quote }}
{{- end }}

{{/*
Definir limites de recursos
*/}}
{{- define "app.resources" -}}
requests:
  memory: {{ .resources.requests.memory }}
  cpu: {{ .resources.requests.cpu }}
limits:
  memory: {{ .resources.requests.memory }}
  cpu: {{ .resources.requests.cpu }}
{{- end }}

{{/*
Definir limites de recursos
*/}}
{{- define "app.ports" -}}
{{- range .ports }}
- containerPort: {{ .port }}
{{- end }}
{{- end }}

{{/*
Definir configmaps
*/}}
{{- define "database.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-db-config
data:
  app-config.yaml: |
    {{- toYaml .config | nindent 4 }}
{{- end}}

{{/*
Definir configmaps
*/}}
{{- define "observability.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-observability-config
data:
  app-config.json: |
    {{ toJson .config }}
{{- end}}

{{/*
Definir database
*/}}
{{- define "databases.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-db-config
data:
  app-config.yaml: |
    {{ toYaml .config | nindent 4 }}
{{- end}}