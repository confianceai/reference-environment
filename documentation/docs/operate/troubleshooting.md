---
sidebar_position: 3
---

# Troubleshooting

## Debugging a Kubernetes Application

1. **Check Pod Logs:**

   - Use `kubectl logs <pod-name>` to view the logs of a specific pod.
   - Example:

     ```sh
     kubectl logs my-app-pod
     ```

2. **Describe the Pod:**

   - Use `kubectl describe pod <pod-name>` to get detailed information about the pod.
   - Example:

     ```sh
     kubectl describe pod my-app-pod
     ```

3. **Check Pod Events:**

   - Events can provide insights into issues like scheduling problems or container crashes.
   - Example:

     ```sh
     kubectl get events --sort-by='.metadata.creationTimestamp'
     ```

4. **Exec into the Pod:**

   - Use `kubectl exec -it <pod-name> -- /bin/sh` to get a shell inside the pod for further investigation.
   - Example:

     ```sh
     kubectl exec -it my-app-pod -- /bin/sh
     ```

## Debugging a GitLab CI Script

1. **Validate `.gitlab-ci.yml`:**

   - Use the CI Lint tool in GitLab to validate your `.gitlab-ci.yml` file.
   - Example:

     ```sh
     # In GitLab UI, go to CI/CD > Pipelines > CI Lint
     ```

2. **Check Pipeline Logs:**

   - Review the logs of each job in the pipeline to identify errors.
   - Example:

     ```sh
     # In GitLab UI, go to CI/CD > Pipelines > Jobs > [Job Name]
     ```

3. **Use Debug Tracing:**

   - Enable debug tracing by setting the `CI_DEBUG_TRACE` variable to `true`.
   - Example:

     ```yaml
     variables:
       CI_DEBUG_TRACE: "true"
     ```

4. **Run Jobs Locally:**

- Use the GitLab Runner to run jobs locally for debugging.
- Example:

  ```sh
  gitlab-runner exec docker <job-name>
  ```

## Debugging an ArgoCD Application

To debug an ArgoCD application using the UI, follow these steps:

1. **Select the Application:**

   - Once logged in, you will see a list of applications. Click on the application you want to debug.

2. **Check Application Status:**

   - The application details page will show the current status of the application, including whether it is `Synced` or `OutOfSync`, and any health status like `Healthy` or `Degraded`.

3. **Sync the Application:**

   - If the application is out of sync, you can manually sync it by clicking the `Sync` button. This will synchronize the application's state with the desired state defined in the Git repository.

   :::info Tip
   Sometimes, giving the Application an `Hard Refresh` might be useful. The button can be found by clicking the little arrow pointing downwards next to the `Refresh` button.
   :::

4. **View Application Logs:**

   - To view logs, navigate to the `Pods` section under the `Resources` tab. Click on the specific pod you are interested in, and then click on the `Logs` tab to see the logs for that pod.

5. **Check Events and Conditions:**

   - Under the `Events` tab, you can see events related to the application. This can help identify issues such as failed deployments or resource constraints.

6. **Check Events and Conditions in the cluster:**

   - Use `kubectl get events` and `kubectl describe <resource>` to check for events and conditions affecting the application.
   - Example:

     ```sh
     kubectl get events
     kubectl describe application my-app-deployment
     ```
