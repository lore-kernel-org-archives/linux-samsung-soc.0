From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 04/35] spi: use dev_get_platdata()
Date: Thu, 29 Aug 2013 13:56:43 +0100
Message-ID: <20130829125643.GG10783@sirena.org.uk>
References: <003601ce8cfa$a63ab120$f2b01360$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BbvjD0mU+7XPw0yH"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35642 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844Ab3H2M4s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 08:56:48 -0400
Content-Disposition: inline
In-Reply-To: <003601ce8cfa$a63ab120$f2b01360$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org


--BbvjD0mU+7XPw0yH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2013 at 04:58:59PM +0900, Jingoo Han wrote:
> Use the wrapper function for retrieving the platform data instead of
> accessing dev->platform_data directly.

Applied, thanks.

--BbvjD0mU+7XPw0yH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSH0UIAAoJELSic+t+oim9iPIP/3cx/SKEAJyqOiguHKXZwf6X
W7/XKUOqmDHnfM0sVWS81gGiHCVYL8LL75QD8d7qmzJI3X5AdyfkCXonCRb/fNwA
cHHv4MLphn1OxyBpm28fK/L1YiKzVV3SuAZj0I8ce/Zk/BOXAJ0y4ZN2IR+yeR/H
pBgkNCGChUXfzXKJ/VXHjxeUfKpADf7d5NAwvtZLYnfub7eIEEio7O+OZ6/9llOQ
ao9J9UaS/5qEx35hMAhbyJyyt1eMR13gT076qTsQS0HSdWRZO1ChU5f/2MbXkAvh
ANElABEvRexhKhk5v9vHNLgvIfCak1732zhqhDrkWjSXwa5POMazzYU5hRyjVHC6
KApbtFnzNYt8ZCvDrQJdtbzZRuMmkiYW8j9hCXX1/X0dgbfoI+BxbPf+KuMmYc4F
DGoS7WmOyvFc6Q7VLIsNgWBdItFsDi9ZMpoe0TykHtVbt7PmFGxKRF5jKeRNRw9U
HUszc8gR5MkzbpUg7X8o1Nx5NNvSAGi67emWZDyR3aQxHglK+m7oNrbpe6lfh+Bs
Na6ggAql4sstgqNvnTiMnaVJTyzOrKLhYi+sKA5bu0NXqtDfDr2MJFW08+YzQyM7
vxGBhMXedApihc5dJL4daKdxQxB6T6YNYw6LS+suwW6mSxLXSUd3NkaKRpcUSRbs
4kZt4ajDpBmsGq54E/nL
=i+W/
-----END PGP SIGNATURE-----

--BbvjD0mU+7XPw0yH--
