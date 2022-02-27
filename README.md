# DDoS auto-scale group based on terraform 1.1.6

Працює лише на Amazon EC2. Використовуйте лише t2.micro машинки для зменшення плати (безкоштовно у кожного аккаунту є 720 годин у місяць)

# Дісклеймер
ЦЕ ПРОГРАМНЕ ЗАБЕЗПЕЧЕННЯ НАДАЄТЬСЯ ЛИШЕ ДЛЯ НАВЧАЛЬНОГО ВИКОРИСТАННЯ! ЯКЩО ВИ ЗАЙМАЄТЕСЬ БУДЬ-ЯКОЮ ПРОТИЗАКОННОЮ ДІЯЛЬНІСТЮ, АВТОР НЕ НЕСЕ ЗА ЦЕ ВІДПОВІДАЛЬНОСТІ. ВИКОРИСТОВУЮЧИ ЦЕ ПРОГРАМНЕ ЗАБЕЗПЕЧЕННЯ, ВИ ПОГОДЖУЄТЕСЯ З ЦІМИ УМОВМИ.

# Як це працює?
Створюється EC2 auto-scale, де кожна машинка має IP регіону на вибір (поки Ireland).

Автоскейл має 4 сервери, які працюють 10 хвилин, після чого створюються знову на базі існуючого AMI. Максимум можливих машинок - 32. Максимум докер контейнерів - поки перевіряю.

Команди для DDoS атак прописані у файлі *user_data*. Там можна змінити IP адресу жертви.

Скрипт автоматичний, і не потребує перезапуску.

# Розгорнутий гайд знаходиться тут https://docs.google.com/document/d/14HZdBgPrOUtd7nWVrukxpRtu4QIx1Lzg0uKPum_98oU/edit?usp=sharing
# Що для цього потрібно?
1. Аккаунт на Amazon AWS
2. Встановлений terraform (працює на Windows/Linux/MacOS)
3. Встановлений AWS CLI (необхідно виконати команду aws configure та вставити свій Access Key з аккаунту)
4. Створити SSH ключ, та вставити його назву у key_name (Створюється ось тут https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:)
5. Глянути тут  https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#subnets: Subnets і замінити на свої у файлі ireland.tfvars, поле vpc_zone

# Як запустити?
1. terraform init
2. terraform plan -var-file=ireland.tfvars
3. terraform apply -var-file=ireland.tfvars

# Що у планах?
1. Більше регіонів
2. Запуск DDoS reaper паралельно з bombardier докер контейнером
3. Інтеграція з OpenVPN