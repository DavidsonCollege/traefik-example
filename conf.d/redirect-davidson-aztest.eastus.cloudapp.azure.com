# Parameters ##################################################################

{{ $domain := "davidson-aztest.eastus.cloudapp.azure.com" }} # domain-name here
{{ $target := "https://github.com/possiblyMikeB" }} # url to redirect to here

# Template ####################################################################

http:
  {{ $name := $domain | replace "." "-" | printf "REDIRECT-%s" }}
  routers:
    {{ $name }}:
      rule: "Host(`{{ $domain }}`)"
      service: redirect
      middlewares:
      - {{ $name }}
      entrypoints:
      - websecure
  middlewares:
    {{ $name }}:
      redirectregex:
        replacement: "{{ $target }}"
        permanent: true 
        regex: "(.*)"

