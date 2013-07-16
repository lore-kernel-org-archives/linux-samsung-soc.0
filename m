From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/2] spi: s3c64xx: fix printk warnings
Date: Tue, 16 Jul 2013 11:36:45 +0100
Message-ID: <20130716103645.GJ22506@sirena.org.uk>
References: <003301ce81b6$83b19f50$8b14ddf0$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLfjTIIQuAzj8yil"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58971 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177Ab3GPKgs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 06:36:48 -0400
Content-Disposition: inline
In-Reply-To: <003301ce81b6$83b19f50$8b14ddf0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--SLfjTIIQuAzj8yil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2013 at 08:53:33AM +0900, Jingoo Han wrote:
> Fix the following build warnings when LPAE is enabled:
>=20
> drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument o=
f type 'unsigned int', but argument 4 has type
> 'resource_size_t' [-Wformat]
> drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument o=
f type 'unsigned int', but argument 5 has type
> 'resource_size_t' [-Wformat]

Applied, thanks.

--SLfjTIIQuAzj8yil
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5SI6AAoJELSic+t+oim9XPUP+wfxiqybc5qgbP/aHg0vkBxw
xbC+hkfDyM1jCKhX71XL6pX+t2Q9GluF3tgeRJ9cRafTSOL3pftD34Uv4ScW/SW/
nc4MH32v+fHQDPQMOetf7pC1GiwrBTc4FWkE2063CgqkeqwzqQKUX19Ts6VKV3OU
29MVC7ERi9MIpqTROx0CQdc0+OkTb4yeGNuIu/95sefS5YEyVvjXWP0VzdsyA1P4
4HryqDyLm6kDInJN9D72jHcAZZ+uC+ePMXf3tZcelfm94tR047YiXYy/STG8E39r
ddwqPSbLRd/Fs2M/iGis9vM5ck8hJm8K+E+rlwrqwaEW7KAZNX3dixqPMTWCfTkK
NHrjD1iQGuNhUUkbNhbxO14ZFjG3yQ3VWAK+MsKs/AZkHngdf0qwU54865NFQvE3
t7sYtCkLTT72tpe+pSuge3MytSjAO2BtxtmL3m3BnyrXMjjI3vmdG9OBKyOws4/R
/kDn9q8WTApNtBRricZwcdkd5UuR8rQmuVtXEW0025A97MDKr2VewVu/amoMtR6g
MWzHMJB16fQVEiL27+3guW1mxzLxK48s8RRHvY2iRvnQ29bIrbW9Vj4ZR4hEg4wz
tikEDDQK/Le3WzTQj57Rcc60PA77h7HUaen7G5dqwHw+TTpDYjav2bBBI+oxRRRr
vZlKi3E1brwdW9xVlZ+B
=+IWM
-----END PGP SIGNATURE-----

--SLfjTIIQuAzj8yil--
