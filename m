From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] [RFC] ASoC: samsung: move s3c24xx over to dmaengine
Date: Thu, 5 Jun 2014 14:36:06 +0100
Message-ID: <20140605133606.GX2520@sirena.org.uk>
References: <6123933.aGtaUr149J@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLTQE3HqOi3RIrZG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55395 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571AbaFENgy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 09:36:54 -0400
Content-Disposition: inline
In-Reply-To: <6123933.aGtaUr149J@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, lgirdwood@gmail.com


--XLTQE3HqOi3RIrZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 05, 2014 at 03:20:50PM +0200, Arnd Bergmann wrote:
> The s3c24xx sound support keeps giving randconfig build errors, this
> is a new attempt to solve it by moving the driver over to use dmaengine
> exclusively.

We already have a patch pending for this, it's just waiting until after
the merge window to avoid bisection breakage since it depends on
dmaengine changes.

--XLTQE3HqOi3RIrZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTkHI9AAoJELSic+t+oim9TEEQAJYBccGTac80nAUNEzksxrEV
BwNuKsLZ+cN5p0CKmGEDKqxA6kdBhj4t+QslX3lnCkaO4hq0zFAlIdqygAhZvU3g
xosTkEfmoOxNKHESMbtFMV9hnuhpxi4IGHsMRJ8a5/rsO1TbK5kggKoFrrr2YwFb
g4Ksp53aOFv7CHim2I0BT3iGuZ1kyc4NpPM7a5Z9tg8U6z7MiD9XfzmA8RXQPGCv
MFp9pH1u5gU5yJr/fbQjzcAcLJAYARKD/p6ylUMfq3sgq+PIeyZEB7CdVxMakRLI
/E3+tyU51a1Vm5GtAxo58y5nPTIgGblWIwvhKCl0cR5u8DAdVItf9kyvQKaIOoBf
ejuLhKbUr+BZICO7+62FPYILL1UZ+LvLIxrGgONvIpNTqwkmrYBjdVkJPyX3Lu5u
brU10MgBLQ0h5Tj5YhTvNeeZ20dwLwzyEXPgCr2xdWDmdvMy956DoYCKn7jJN11Q
nE2tLq6Ijtwr60IpVRdgLX1hwcuFAEddfGECL4xXpJUzEn9bWPOEVoEco6JxFPyW
hCFv4MB2xL4xH82RqShlxSSo5M8IcEv+9dBhWvHmpTUalNSOU6uhQKS+NqmaSw58
bpxm5JRSJumrhE1al+3ZFOFHg72leCOpAI8UWCVBByzCzSbfEXxSr7BE5JYAS2EO
x+dax9bdeaLoWcFyob/s
=jsc9
-----END PGP SIGNATURE-----

--XLTQE3HqOi3RIrZG--
