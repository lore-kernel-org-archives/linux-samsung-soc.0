From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/8] spi: s3c64xx: Do not require legacy DMA API in
 case of S3C64XX
Date: Thu, 17 Oct 2013 11:33:43 +0100
Message-ID: <20131017103343.GL2443@sirena.org.uk>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
 <1381950659-12703-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yUJ/QPh5Cdrmy6jV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:55734 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527Ab3JQKds (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 06:33:48 -0400
Content-Disposition: inline
In-Reply-To: <1381950659-12703-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>


--yUJ/QPh5Cdrmy6jV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 09:10:52PM +0200, Tomasz Figa wrote:
> With support for amba-pl08x driver, on S3C64xx the generic DMA engine
> API can be used instead of the private s3c-dma interface.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Mark Brown <broonie@linaro.org>

in case we can get this into v3.13.

--yUJ/QPh5Cdrmy6jV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSX70EAAoJELSic+t+oim9/d0P/20K4so9KGWaIq4727FQMCac
WaRkv0sMBo/oPDta0T3UWiIE1m5t7/5SnqBFniWUPFQpyxiCd/PZcmLustJlKsBf
RjKOCvIItMYqPCrMCN11K/magpZEOjq9t+eJssO6IvO4zOKLJ03rPpV7VX9Lq5Bu
KxQuqJSsU8iYcMzoO611TY4O96vOMvwjwGlEVDUbIO0wTI9gYEOkDBYJi9ERcjx1
FWkPIW6COrxd+H4GGbllZNRkriCl71UyuCzuzOsLIKOD0IxGUFPo2OUG7zc4EiCh
BBmn/ipqAwlV9inM26VroFPaob6OrTBJMwnk0YoumTP5E+yuc5WRhR+yFL5TMq2c
TfphsllxzBHQaf2ntKBtUFNuuYMEonUcKNbquRcmol68IqAkxYJeOVYS5pvDyuwJ
NcmRujwsDJZyBOuzkK3yKf67ys9D6kWCVGqHNawMC3pSfWBFgpO7eB6087Hndx6A
Q3Ru3Hb8NKGM0au5BiPSSXVsNVIFgRtxBv8ShXBtoyKV7joLYuq8DdxZnUEfOnVv
ViFPf69EOOPG3Qzwe98V53QP4nLJfE5Z6TKKiUjAp7qEkW7UxQxiBVYxrABz7xS0
8bjRZ4NFfglMTF+vfVPZ2uBWafQJ/ucakGfcFODv4MRK3dQf9ERdpwIcdYowcBHE
D5EK+8Lz0G5WOdZ49JF1
=Mu24
-----END PGP SIGNATURE-----

--yUJ/QPh5Cdrmy6jV--
