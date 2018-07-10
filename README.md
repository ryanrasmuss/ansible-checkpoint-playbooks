# Check Point API Playbooks for Ansible

by **Ryan Rasmuss**

Quick Ansible playbooks using Check Point API.

### Overview

``ansible-cp-test.yml`` should be used to test Ansible and Check Point Management server connection.

1. ``1-gateway1-playbook.yml`` simple gateway deployment.
2. ``2-internal-objects-playbook.yml`` create simple network objects
3. ``3-internal-policy-playbook.yml`` simple policy creation with policy install on gateway created at step 1
4. ``4-setup-routes-playbook.yml`` example loading and running scripts on gateways
5. ``5-webserver-playbook.yml`` example adding new policies/objects to existing policy package and object groups

Use ``get_fingerprint.sh`` on your management server to easily copy the fingerprint to your ``ansible.cfg``.

### Links & Misc

[Check Point Github](https://github.com/CheckPointSW)

[Check Point Management API Reference](https://sc1.checkpoint.com/documents/latest/APIs/index.html#introduction~v1.2%20)

Install and setup guide for Check Point & Ansible [here](https://docs.google.com/document/d/1HfuLJl6J13w55gdvC2j7mlZMWadZ8ybHcRUg_qSwFsc/edit?usp=sharing)


