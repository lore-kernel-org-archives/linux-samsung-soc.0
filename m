From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Wed, 11 Sep 2013 11:03:01 +0100
Message-ID: <20130911100301.GJ29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk>
 <522F0151.50905@samsung.com>
 <20130910120358.GG29403@sirena.org.uk>
 <522F1BCB.1000400@samsung.com>
 <20130910163248.GO29403@sirena.org.uk>
 <52301FB6.6060601@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uiiN9S+hbdGfjoch"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60572 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab3IKKDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 06:03:05 -0400
Content-Disposition: inline
In-Reply-To: <52301FB6.6060601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz_Czerwi=C5=84ski?= <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--uiiN9S+hbdGfjoch
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 09:45:58AM +0200, =C5=81ukasz Czerwi=C5=84ski wrote:

> I based my patch on the spi-tegra114.c driver. 	There is
> dma_chanel_request at the beginning in the probe function.
> I really should correct S5C73M3 firmware upload function.

Yes, that can be the best idea in cases where the DMA channel is tied to
the hardware block it's controlling so there's no possibility that
something else could make use of it when idle.  It does also avoid the
possibility of getting the DMA controller busy when you try to use it
but it depends how oversubscribed the DMA controller is.

> When I added small modification into S5C73M3 driver I achieved the
> same effect.

> Sorry for wasting your time.

No problem.

--uiiN9S+hbdGfjoch
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMD/RAAoJELSic+t+oim9dWwQAJXa98iwGMNOXyu/a7oE/4LQ
3d+Ydcy8BS24RNPuWHuNWVa3hGrdkzP9YUE1h9JwqntAvPSv2Ve8miUohRfQDtX6
4sg4WiD7cUzvlf1mtjsHDeeSgJYgMaXG0mGRZTcjkB01t20MKPtok/n2BCbuWMWI
Cgbh1MlsEVfPnyzeNOz/n18RC2AIiOz11eB9bk49jt4Ziq6E5ogcpLn1TY4PkTjA
cCpf8o3RTKMClIFAEWnKZXYakBVd1O6UVkRW/F+1MxRHCZILcS5eXMPjLWzQgYh2
bW+E6RWRl1eJYtQH1aw+qguUAfLMP0brWZO4BPUA1cc7Wqre1TYja+6RlzQR+N5Y
MhLCkIuO0bWHHCKY7pVP8X/E8rJJpi+0YNhEpvnEbF31j64W4rGwjxEfApxSjq3b
qUvg75RFzXssOsB31QKwJEHWC0n6u0+/wdSLT3VTyOp5Klw27MbBnG2lwet2NHPT
t7D27Ypa1e4errSc19eNdqY2Bl6R3mNnha4gVx+stfDFbyUitaenlPMMmK4taZsH
SK+aZR3yb1V8l0rUVbDRV7XqxELumx2rNjjrITvvH73f3+gUd0pmwNV7TfLnKgji
QQh+tSOE0Aczqzdn1Gq7pT/QQg23OYCOE7buDLXjQViWQwJvhSBb9sp5Z7oEJwEh
ZHNB/0YFjFVUt6qQxxlu
=YdIv
-----END PGP SIGNATURE-----

--uiiN9S+hbdGfjoch--
