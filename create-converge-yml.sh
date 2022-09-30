#!/bin/bash

cat <<EOF >~/.ansible/collections/ansible_collections/confluent/platform/molecule/scram-rhel/converge.yml
---
- name: Converge
  import_playbook: confluent.platform.all
EOF
