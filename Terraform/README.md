# Dokumentácia Terraform Projektu

## Úvod

Tento repozitár obsahuje Terraform konfiguračné súbory pre správu IaaC. Terraform je open-source nástroj pre infraštruktúru ako kód, ktorý poskytuje konzistentné rozhranie príkazového riadku (CLI) na správu stoviek cloudových služieb. Terraform kóduje cloudové API do deklaratívnych konfiguračných súborov.

## Základné príkazy Terraform

### Inicializácia Terraform

- `terraform init`

  Tento príkaz sa používa na inicializáciu pracovného adresára obsahujúceho Terraform konfiguračné súbory. Je to prvý príkaz, ktorý by mal byť spustený po napísaní novej Terraform konfigurácie alebo klonovaní existujúcej z verziónovacieho systému. Bezpečne nainštaluje a nakonfiguruje Terraform backend a pluginy.

### Terraform Plan, Apply a Destroy

- `terraform plan`

  Príkaz `plan` vytvára plán vykonania. Určuje, aké akcie sú potrebné na dosiahnutie požadovaného stavu uvedeného v konfiguračných súboroch.

- `terraform apply`

  Tento príkaz sa používa na aplikovanie zmien potrebných na dosiahnutie požadovaného stavu konfigurácie, alebo predurčeného súboru akcií vytvoreného plánom vykonania `terraform plan`.

- `terraform destroy`

  Tento príkaz sa používa na zničenie infraštruktúry spravovanej Terraform. Tento príkaz je opakom `terraform apply`. Zruší resourcy spravované vaším Terraform projektom.

  - `--auto-approve`: Preskočí interaktívne schválenie plánu pred jeho aplikáciou.

### Terraform Plan, Apply a Destroy pre konkrétny resource

Použitie parametra `target` umožňuje zamerať sa na špecifický resource v Terraform konfigurácii:

- **Plan pre konkrétny resource**: 
  ```sh
  terraform <plan/apply/destroy> -target='<názov_targetu>'
  terraform apply -target='openstack_compute_instance_v2.minikube_instance'

- `--auto-approve`: Preskočí interaktívne schválenie plánu pred jeho aplikáciou.

### Formátovanie Terraform

- `terraform fmt`

  Automaticky aktualizuje konfigurácie v aktuálnom adresári pre čitateľnosť a konzistentnosť. Môže sa tiež použiť na zabezpečenie, že všetky vaše konfiguračné súbory dodržiavajú konzistentný štýl.

  - `-recursive`: Spracuje aj súbory v podadresároch. Predvolene `fmt` skenuje len aktuálny adresár.

## Práca s týmto repozitárom

- **Inicializácia**: Spustite `terraform init` na inicializáciu projektu.
- **Aplikovanie zmien**: Po vykonaní zmien spustite `terraform plan`, aby ste videli, aké zmeny budú aplikované, a `terraform apply` na aplikáciu týchto zmien.
- **Formátovanie kódu**: Použite `terraform fmt -recursive` na formátovanie kódu.
- **Zničenie infraštruktúry**: Použite `terraform destroy` na odstránenie všetkých zdrojov spravovaných týmto

## Dodatočné informácie

- **Dokumentácia Terraform**: Pre komplexnú dokumentáciu Terraform [Terraform Docs](https://www.terraform.io/docs).
- **Best Practices***: Odporúča sa oboznámiť sa s [Najlepšími postupmi Terraform](https://www.terraform-best-practices.com/).
