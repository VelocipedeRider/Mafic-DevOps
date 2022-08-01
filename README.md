# Steps taken to accomplish tech exercise.

```
terraform init
terraform plan
terraform apply --auto-approve
```

# Verify pod is running
```
kubectl get pods -o wide --all-namespaces | grep state 
# mon           state-metrics-69d979d788-fn8rc            1/1     Running     0             7m18s   10.2.86.234   workstation   <none>           <none>
```

# make and move tf files to module
```
mkdir -p modules/metrics
mv *.tf ./modules/metrics
```

# make new main.tf that calls the module
```
cat <<- EOF >./main.tf
module "metrics" {
  source = "./modules/metrics"
}
EOF
```

# init the module
```
terraform init
```

# Move state to module
```
for state in $(terraform state list); do
    terraform state mv "$state" "module.metrics.$state"
done
```

# Plan should result in no changes
```
terraform plan
```

# Create variables.tf file in the module and begin replacing values in the modules/metrics/state-metrics.tf file and put them in the varibles.tf file. Then use locals to set the variables exposed in the module. This will put all of the set-able variables in once place so we do not need to modify long manifests. Then reference those locals in the module block to apply them. Once done run a terraform plan and you should expect no changes in output with the existing deployment if the variables have the same defaults or the same explicit values.

```
terraform plan
No changes. Your infrastructure matches the configuration.
```

# The module variables that need to be considered will depend on needs of the project.
# I included a few simple variables and use locals to aid with the module theme to demonstrate the process in the metrics.tf file.
# I think this is enough to demonstrate the point of this exercise. 
