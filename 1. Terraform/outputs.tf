output "BH_public_IP" {
  value = module.network.BH_public_IP
}

output "BH_private_IP" {
  value = module.compute.BH_private_IP
}

output "minikube_instance_IP" {
  value = module.compute.minikube_instance_IP
}
