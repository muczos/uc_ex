[nginx]
%{ for s in nginx_servers ~}
${s.name}.${s.ip_pub}.sslip.io private_addr=${s.ip_priv} short_name=${s.name}
%{ endfor ~}

[haproxy]
%{ for s in haproxy_servers ~}
${s.name}.${s.ip_pub}.sslip.io private_addr=${s.ip_priv} short_name=${s.name} app_url_suffix=${s.ip_pub}.sslip.io
%{ endfor ~}