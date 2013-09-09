From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/6] spi: spi-s3c64xx: Add coherent buffers for DMA
 transfers
Date: Mon, 9 Sep 2013 15:45:09 +0100
Message-ID: <20130909144509.GB29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bixl4pq/MaomSJT0"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44653 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751548Ab3IIOpd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:45:33 -0400
Content-Disposition: inline
In-Reply-To: <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Czerwinski <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--Bixl4pq/MaomSJT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 04:09:23PM +0200, Lukasz Czerwinski wrote:
> The spi-s3c64xx currently doesn't support transfers from non-contiguous
> client buffers.
>=20
> This patch adds two coherent buffers which allow transfers from
> non-contiguous client buffers without extra coherent memory allocation
> in the client driver.
>=20
> Buffer size is hardcoded to 16kB for Tx/Rx. Client drivers shouldn't
> exceed that value.

This seems like a very low limit to have, consider things like firmware
downloads for example.  It seems reasonable to have a preallocated small
buffer but there should be some fallback for larger transfer sizes.

I also didn't notice any checks in the code for the length of transfers
so this will corrupt memory if a client driver tries to transfer more
than the preallocated buffer as things stand.

--Bixl4pq/MaomSJT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLd7yAAoJELSic+t+oim9mokP/iq6T4CbsMJPjhBoxNj/xDMv
jjeLXP40vZ1elWKu9nFZCO1FV/Ggg7WE2XQgEEzZJNWFseJwzDZmZkR1znJOUEdC
FDeBI4BsiPnman9XNfHLfKVdT3u4OuxsCDweHazdBzacxcOUPyGIOduKdGGiDiKI
F/mYmmtwl/QIo7+B3z3vMM21ecn1Cf7gQghxM63UGDgKfc1xLMiXjY8HN/P+jRyQ
EiKrRLi96Ko9zbFNBnRDFThb5ohcc8hAUxTc2NL+E3r2fuWBRLpgfDpsg9EjKDGZ
FPnlPIn+BZJNrwpXC2kEDIE38rxWrCxdrjuUAlTSdy17TDywy2TxEzeEmbScfK92
Ni8r4ET1MUP56DCkpGeDPlbz/zdudZXJ82HUFR2FetYeD87hSqUJDX6uNvf/z0Hc
XTykl2qzMvVpr+bHBBj+T8GwyBr0Pq/XP4+U7nk8xBsAEUKis40tf1wSSeRzCWQ+
zfHepUhFLlYbuezISNpnX7TytKBAolIc4mLBLllzgPBOtCD75TnlM/5j5IjGUNua
R6/MhgZHbPROKpZr59i9xwW+AD5Nkqb93REnaNlWcrqZFvSOC2NY2V635zH40603
o+oZvOcoZOJST2nwC0N4dWt2w2biyiZj5AvA52AM0STskq2cZe9NCFA8i6bU1Oiy
2f0VeUOLst9Iyq+tqPup
=pqtc
-----END PGP SIGNATURE-----

--Bixl4pq/MaomSJT0--
