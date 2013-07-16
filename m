From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] spi: s3c64xx: fix checkpatch error and warnings
Date: Tue, 16 Jul 2013 11:36:30 +0100
Message-ID: <20130716103630.GI22506@sirena.org.uk>
References: <003401ce81b6$ab70cb10$02526130$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X0cz4bGbQuRbxrVl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58963 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754328Ab3GPKgz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 06:36:55 -0400
Content-Disposition: inline
In-Reply-To: <003401ce81b6$ab70cb10$02526130$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--X0cz4bGbQuRbxrVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2013 at 08:54:39AM +0900, Jingoo Han wrote:
> Fix the following checkpatch error and warnings:
>=20
>   ERROR: "(foo*)" should be "(foo *)"
>   WARNING: line over 80 characters
>   WARNING: quoted string split across lines
>=20
> Also, it converts (void *) to (unsigned long *)(unsigned long)
> to fix sparse error.

This doesn't apply to current code (and should really be split up a bit
for ease of review).  Can you please check and resend?

--X0cz4bGbQuRbxrVl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5SIrAAoJELSic+t+oim9PhEQAI7tnkeNk6ATwFbc7WaIKPy/
099Hp+Po0W5nweXs3mea/xUR43NHGKfm4RmvQvBlEfcux9F+lzv4oBRsmja4TxrY
wP3QWmVDTbEsQ2yeMPR/57So6iMDkE1Rhm+Yz+O1XOn/oKeoWky7G1YAKHXkribR
53rZK/8FGxNIhd37XYE7vSw/8kkCCqSywacbahmb2P5lshKe4NwU8AVBZ5KhNoWz
hvBgBlAk9NU4CepZIy+p4pEi9B6x0o0uMB9Zkkb/aWVlD6B9d8L677rK3CjQHFQl
ehn6hvbNLk2S0CHDngloUBwFQyY12FdpQYkz2/6j4kBwHnQg+cLfQ3+mvhgOw0Bk
IhpSz0gQo6sI5GBKiFnjojWdZS+T1+/nhWsWBRMHLCYQk3/pXf8msNq2MsIgNLuz
TJiR16zoWZG5Uz7O6KrCBQT6WUMZXiWkf8NDl78BR8wlb3tpa0VOXQTF+5rrV3/Q
BbJMO1vpTCnC6JRBiKqkKArSbvlM4i1qd36qVtXBhk33JOpXCiAlZGKS5qXTXDru
VHk2yjg8k/SdIPMJz5wFwuOGEN4bSPdX6pmlN9gurijGcEucIcod5kshVU6M3zQN
WI/JZT200w1bJTD85nRBu8k6IPaM+n2nSGneKKgS0eTNwP2hu5UR3kpBBcGbN4qV
VbS4aH6TdTLv9E1Jg1tS
=VW1V
-----END PGP SIGNATURE-----

--X0cz4bGbQuRbxrVl--
