From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [3/3] i2c: exynos5: do not check TRANS_STATUS in case of Exynos7
 variant
Date: Fri, 26 Jan 2018 10:30:31 +0100
Message-ID: <20180126093030.4uhpnpyzz3hccptz@katana>
References: <20171130143007.30258-4-a.hajda@samsung.com>
 <CGME20180115205339epcas1p24810c38f964d43cc1b8589d3c3cc3c73@epcas1p2.samsung.com>
 <20180115205334.6ciwq5pouthtj3kx@ninjato>
 <bddb6ff4-22cd-9f01-7a63-295b19eaef90@samsung.com>
 <20180117232307.aigvkl564p4jzms3@ninjato>
 <5e27b754-17fa-3a98-0a99-ba93c16e5c0e@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="474z2ib753a27p5g"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e27b754-17fa-3a98-0a99-ba93c16e5c0e@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--474z2ib753a27p5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrzej,

> Forgive me delayed response - holiday.

No worries!

> The code removed was something extra, so I am not sure if it is
> necessary to add comment to the code, git log should be enough.

If somebody later discovers this "new bit" and implements support for
it, I am not sure this person will check git log to see if there has
ever been support added and later removed. Also, it helps me reviewing
when gory details are explicitly mentioned in the code.

> Anyway I will post patches dealing with HSI2C_MASTER_ST_LOSE on
> transaction start very soon, so I can add relevant comment there.

Please do.

Kind regards,

   Wolfram


--474z2ib753a27p5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpq9TEACgkQFA3kzBSg
KbY2/w//ZMZgTwzU0oWuUTGHHC2qyXPwutKa/0HOfizEnPFeE8dfyA0C21d1jv4N
MHMLVBZvfI9UpmtggbhJYLxV8JhENuFeeascQxqZLIeq3v1zuL1yJEbuvhzrclBC
Voq9m2HQ8nvt+MeW/jfDB2sB/F/eK4FKoSSAqXoWubl4dCLHbQ00oVZ4JGJ9uRob
r+v6WUmGlhBIemnuW45ymQdxFHL6nU+YKWHOsKPo81HI7yjBQAT+ZlngtMu42uas
S1HNDjMpmaSTZxaSIUG7ikE+9hpBCoqZGddp2gKfAs/e2wyM9R9J1rgJPFQIBJ5+
10amyIYQymrBLrKkzXZThR3aVxsH9r8t/eU/r8XLIXSMjZ9fA46e7vMeAZX6YNMs
jQqoJTIdmkgQH/1IEs1fghecBGaxXtV5voTyDz7VZ48lYSZ3pg6B8rKlh0JLXLo2
no+7UZQqE1rZs9nYP4iM4Gqp5AC2lLLwoE6F3eZEm2LhmCYXlcPgAA0B9nKuqBZx
KyfRr3F2XWgdHrxjrcwAOSsD/9/mBkc69yPzv+6KMPtCFDM+3e7l0KnRG0b+MoYw
9EB8DzityqimBL1wso59aeRvDNlNYMbiV5JVQFNSxYl8uSU41aFy/i26i+EbFhma
4C4/dkFq+8oMijnJe8Y5dcXjG6s68d7WFoo8N/LF0Fv4ApdqKdI=
=2GQX
-----END PGP SIGNATURE-----

--474z2ib753a27p5g--
