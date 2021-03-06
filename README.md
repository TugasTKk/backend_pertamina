Dokumentasi Deploy Server :

1. Pada app/config/database : silahkan diganti settingan menjadi settingan database
```php
    public $default = [
        'DSN'      => '',
        'hostname' => 'xxx',
        'username' => 'xxx',
        'password' => 'xxx',
        'database' => 'xxx',
        'DBDriver' => 'MySQLi',
        'DBPrefix' => '',
        'pConnect' => false,
        'DBDebug'  => (ENVIRONMENT !== 'production'),
        'charset'  => 'utf8',
        'DBCollat' => 'utf8_general_ci',
        'swapPre'  => '',
        'encrypt'  => false,
        'compress' => false,
        'strictOn' => false,
        'failover' => [],
        'port'     => 3306,
    ];
```

2. Pada halaman .env : silahkan diganti settingan menjadi settingan database
```php
database.default.hostname = xxx
database.default.database = xxx
database.default.username = xxx
database.default.password = xxx
database.default.DBDriver = MySQLi
database.default.DBPrefix =
```

3. Untuk mendaftarkan akun silahkan akses endpoint : https://namadomain.com/app/public/register. pada bagian body kirimkan json dengan format sebagai berikut
```json
    "email" :  "email User",
    "password" => "passwordUser",
    "confpassword" => "reinputPasswordUser" 
```

### Untuk melakukan deploy
Pada cpanel hostingan, pilih filemanger. Setelah itu langsung letakkan saja pada halaman publichtml. Jika ingin dimasukkan kedalam folder juga bisa. 
![image](https://user-images.githubusercontent.com/50267676/140585693-f0abaf17-c762-455f-a611-a87e0203199e.png)
dapat dilihat pada halaman public_html, saya memasukkan file backend tersebut pada folder pertamina. sehingga untuk mengakses file nya, dapat melalui `https://namadomain/pertamina/app/public/endpoint`

# CodeIgniter 4 Application Starter

## What is CodeIgniter?

CodeIgniter is a PHP full-stack web framework that is light, fast, flexible and secure.
More information can be found at the [official site](http://codeigniter.com).

This repository holds a composer-installable app starter.
It has been built from the
[development repository](https://github.com/codeigniter4/CodeIgniter4).

More information about the plans for version 4 can be found in [the announcement](http://forum.codeigniter.com/thread-62615.html) on the forums.

The user guide corresponding to this version of the framework can be found
[here](https://codeigniter4.github.io/userguide/).

## Installation & updates

`composer create-project codeigniter4/appstarter` then `composer update` whenever
there is a new release of the framework.

When updating, check the release notes to see if there are any changes you might need to apply
to your `app` folder. The affected files can be copied or merged from
`vendor/codeigniter4/framework/app`.

## Setup

Copy `env` to `.env` and tailor for your app, specifically the baseURL
and any database settings.

## Important Change with index.php

`index.php` is no longer in the root of the project! It has been moved inside the *public* folder,
for better security and separation of components.

This means that you should configure your web server to "point" to your project's *public* folder, and
not to the project root. A better practice would be to configure a virtual host to point there. A poor practice would be to point your web server to the project root and expect to enter *public/...*, as the rest of your logic and the
framework are exposed.

**Please** read the user guide for a better explanation of how CI4 works!

## Repository Management

We use Github issues, in our main repository, to track **BUGS** and to track approved **DEVELOPMENT** work packages.
We use our [forum](http://forum.codeigniter.com) to provide SUPPORT and to discuss
FEATURE REQUESTS.

This repository is a "distribution" one, built by our release preparation script.
Problems with it can be raised on our forum, or as issues in the main repository.

## Server Requirements

PHP version 7.3 or higher is required, with the following extensions installed:

- [intl](http://php.net/manual/en/intl.requirements.php)
- [libcurl](http://php.net/manual/en/curl.requirements.php) if you plan to use the HTTP\CURLRequest library

Additionally, make sure that the following extensions are enabled in your PHP:

- json (enabled by default - don't turn it off)
- [mbstring](http://php.net/manual/en/mbstring.installation.php)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php)
- xml (enabled by default - don't turn it off)
#   b a c k e n d _ p e r t a m i n a 
 
 
