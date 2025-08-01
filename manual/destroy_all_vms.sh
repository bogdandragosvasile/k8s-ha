#!/bin/bash
vms=$(virsh list --all | awk 'NR>2 {print $2}')
for vm in $vms; do
  virsh destroy $vm 2>/dev/null
  virsh undefine $vm --remove-all-storage
done
echo "All VMs and their storage volumes have been destroyed and removed."

