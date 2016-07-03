# Infrastructure for Devpost Infra Hackathon  

Guidelines on how to use:

 * Contents: , Debian jessie, Scala, Spark, Ruby
 * Clone the repository
 * Execute the following scripts

```ruby
vagrant up
```

```ruby
vagrant ssh
```

```ruby
cd /vagrant && sh puppetSetUp.sh
```
 * jdk 1.8.x is not included in the scritps
 * if required get jdk and change the paths in /home/vagrant/.bashrc 