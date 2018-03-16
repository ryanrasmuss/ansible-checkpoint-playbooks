#!/bin/bash

play=ansible-playbook

$play 1-gateway1-playbook.yml
$play 2-internal-objects-playbook.yml
$play 3-internal-policy-playbook.yml --skip-tags install
$play 4-setup-routes-playbook.yml
$play 5-webserver-playbook.yml
