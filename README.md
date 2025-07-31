base/ – Skeletal Deployment & Service (no namespace, no sidecars, no env vars).

common/ – Adds things every customer needs (namespace, resource limits, a logging sidecar, etc.).

overlays/clientX/ – Client-specific patches (image tag, CLIENT_ID env vars, replica count).


kubectl apply -k kustomize/overlays/clienta