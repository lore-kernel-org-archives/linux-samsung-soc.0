From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/2] spi: s3c64xx: fix checkpatch error and warnings
Date: Mon, 15 Jul 2013 13:00:17 +0100
Message-ID: <20130715120017.GH11538@sirena.org.uk>
References: <000101ce8122$3621f7b0$a265e710$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37752 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755900Ab3GOMAU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 08:00:20 -0400
Content-Disposition: inline
In-Reply-To: <000101ce8122$3621f7b0$a265e710$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2013 at 03:11:57PM +0900, Jingoo Han wrote:
> Fix the following checkpatch error and warnings:
>=20
>   ERROR: "(foo*)" should be "(foo *)"
>   WARNING: line over 80 characters
>   WARNING: quoted string split across lines

Applied, thanks.

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR4+RNAAoJELSic+t+oim9uz0QAJjtqGatjohVzvyKzCpOJ3o9
IzmLOUSJ2xo521xrrGxINSZdjk6im+4bjeFfswKzdgbAKvXItL7gUG10JhFlhqS6
jQCOFeKChl3IUGGNh3VegQhkezGTq4TchBTIMICFL2v67QNyzdtvhQyHz6e9xRT3
7rGgu4C9r3UE/HIFpTYiwRMuYxgIde12dwFIOwvC4zfofs+P8mIq+GDaZMZ7Wqq7
mhPsJzrfDoL2p4LpJB6lk+zwjQLUkWf/lg4Y2W9+c0jstx7HWcSq0REAfJEgNtrH
T8BT2baNZFhjSzhTNNkX6sgIoC2sRewSazZMcVKvUJX4HXHMwwkmpr/GgOM3CbDb
lDYROXFERlVxPuReKGf1qGZXfq2kowmp/6ynvulag9tBtPBYMWAiMaEOwhEcVxjr
B0TAQ+WFJk244PG50PdWewBbHd5+s3iQYFXeu1EVOgFVRcdhZiaNg8FQstNnBJg5
K1DZhfUtYuhiECKjb977JvOMuISf/TRARA2N8vbEy5NPdNzccyRAE/awEKn+SFqR
FIAktiYfAMuH/MXq9yhKbDprlLz8rG/IE9O44D+P9AC7yGaWR6lZkRdCApPfM9z6
6unrZDVDjleSuOmJDaAeQ4qLT2iBOU37JiSiWQop9Oa0ylv45FzZY0gED1hL1qHu
Dpv8h+cRv8TtusUu7EIh
=CxhL
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
