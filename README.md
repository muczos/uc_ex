## Configure environment
- Requirements: 
    ```
      python >= 3.8
      pip
      virtualenv
    ```
- Setup virtualenv
    ```
    python -m venv venv
    source py-venv/bin/activate
    pip3 install -r requirements.txt
    ```

## Simple app
- Directory ```apps/simple-app``` contains very simple python app which can be converted to static files with frozen flask package.
  Run with flask:
  ```
  MAIN_COLOR=green NGINX1_COLOR=blue NGINX2_COLOR=red python app.py
  ```
  Build static pages:
  ```
  MAIN_COLOR=green NGINX1_COLOR=blue NGINX2_COLOR=red python app.py
  ```

## Provision infrastructure
- Terraform  (latest version) is required to provision infrastructure, also hetzner account with api key exported to ```TF_VAR_hcloud_token``` variable. Provisioning:
```
cd terraform/hetzner_dev
terraform init
terraform plan
terraform apply
```
Terraform will produce inventory file for ansible: ```ansible/inventory/hetzner_dev```

## Configuration and app deployment
- Following command will configure haproxy, nginx, ssl and will build and deploy simple app:
```
cd ansible
ansible-playbook setup-all.yml -i inventory/hetzner_dev -e env=hetzner_dev -e app_name=simple-app
```

- Roles are organized, so in example only build and deployment of an simple app is possible:
```
ansible-playbook setup-all.yml -i inventory/hetzner_dev -e env=hetzner_dev -e app_name=simple-app -t app_build,app_deployment
```

- Simple app is available under dynamically assigned address:
```
https://{ simple-app }.{{ app_url_suffix }}
https://simple-app.49.13.123.255.sslip.io

```
