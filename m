From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [2/2] i2c: s3c2410: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS instead of
 open-coded
Date: Sun, 24 Apr 2016 23:18:16 +0200
Message-ID: <20160424211816.GA13918@katana>
References: <1460596135.6630.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41019 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753198AbcDXVSY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Apr 2016 17:18:24 -0400
Content-Disposition: inline
In-Reply-To: <1460596135.6630.2.camel@ingics.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2016 at 09:08:55AM +0800, Axel Lin wrote:
> Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied to for-next, thanks!


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHTgYAAoJEBQN5MwUoCm2nTwP/0DQLH2GAE0RR/F4QDLOqUkt
XIKfZI1cL0I/m8dgs9774iW+ddi/3wXMp0n3jShSf7v0yO9UGi/mx4ET1cngzYrK
0W5/GRpLzSo2PRsFnrhbNGiU2QnbamKbHpRsr6zvIysJRktP6NWIVs9f0nfHYFqZ
YbZqxRq32mhUeNfyeuqHWxEMWrvZO2KWbSc78aULoTZmBs4sprkXG9aR61IzAXAD
LE0IxklfDrslv7Yr/d+t8rxPLT+xLhuYVBt5GZCb6XU7X53p2jVHU6pmYk51764p
35ltmjE5TfvPQj70iV3+PEAYWma88d2ZbnsfH5R1Sgd1wPpCBqYZPhZUOLybpXKA
MBqR9BBXVflM02kU1MG186HMpApFLCmAzMaLWN6NuHTvDZ7hkSFJqhrAluwJ/c13
DoD48sIsx00j/cYxMufcAqAzgWXvDMLZkZuhNj4NqjrnvmWFHIPVrxtf1pb8O04O
mJTlsmjKLwwxB12njBRNAurO/40yqU9Ecep06ikps2u6RZ4mblj3SYxvj3u25ulx
NXSlcTKHkg71GNYFBu6nXFxLt1KEJk7wXUaOz39i4QG1bLRpxjBkjLCEtv+WX2CT
cjHQaa7g+bozNeUKM4biD3R9oCYdCq2C01BJYo/ZoRuKiFy9BYRvqle1qLZpEfIJ
ni6BQG8Ul7Jva76HWKCs
=g59a
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
