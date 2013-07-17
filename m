From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] spi: s3c64xx: fix casting warning
Date: Wed, 17 Jul 2013 11:08:16 +0100
Message-ID: <20130717100816.GK22506@sirena.org.uk>
References: <008101ce82cb$34f0eea0$9ed2cbe0$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sV6E+871crhbObqU"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58517 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753601Ab3GQKIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 06:08:40 -0400
Content-Disposition: inline
In-Reply-To: <008101ce82cb$34f0eea0$9ed2cbe0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--sV6E+871crhbObqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 05:54:11PM +0900, Jingoo Han wrote:
> sdd->ops->request is unsigned int, not unsigned long.
> Also, sdd->rx_dma.ch is a 'struct dma_chan *'.
> Thus, (void *) is converted to (struct dma_chan *)(unsigned long),
> in order to fix possible sparse warnings.

Applied, though only the cast to unsigned long should actually be needed
- casting to void * should be good for any pointer so changing to the
specific struct shouldn't be essential (might catch issues due to
future API changes though).

--sV6E+871crhbObqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5m0NAAoJELSic+t+oim9y+sP/jsHN1EP0ea7n57YFOELySia
lRzlIFVH7nxoyVm+F5xiFkSHToEbJ02kjhMVYGC2Zqh6tuVdNGHDJkQ2AosQeTGy
ouNv/oDGqEmqU+Oqp8ZVcUmMprDCrXijdJi5uelH8Dik4k4QwnQtIEeNM5MOTP3O
9uJGJSSy1B6e3W2bc6z3T9SwPoLpfWIgA+DVECFegepi0Baga/wIa/ZQRO2gPJZY
kIjY0q1oF+0qeYAhAXAE83eeCn41hqaFxqlBYlBhidWWN83VM44aNFL6SqMmE9jn
VoYYaZ0D47331MrjyR7APcpQ12/8WwHvQW+gruWTG0AFrPRY1erPuB6ZEAmbuGZ3
LluQdb2bTxzvKjDCIfB+vboDp0pedHjVHezfiYSzOiCVv6He07rZsMfRviavPKfQ
Nps75BK8D1l0dv/jsmmwiep0BxYW1xXXeYK51GkwI4EanNJ15Ey7GTGDvmCfRlwO
Ovoj+dv/cm+RvNr3ntO9NkduYLCpG/2H7s8h0CYL1tox8kU3oVz8O1JPwAzT6qEo
S0uvP5vIpibtB7Z4YYZqnwyhOm0ZI/NqWyj4m+gpnPiu2qFQfaDttTq982p+1srJ
QoRwj0u5bKawk4kmOpvQHiBO1SXhqW969cUzoPLuRA9mZc2MI1to57HTUTwy+sPg
/8/HKNSsnUbf5MiW0lbz
=vUlI
-----END PGP SIGNATURE-----

--sV6E+871crhbObqU--
