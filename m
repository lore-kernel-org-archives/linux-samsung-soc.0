From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/8] ARM: s3c64xx: Let amba-pl08x driver handle DMA
Date: Thu, 17 Oct 2013 11:22:01 +0100
Message-ID: <20131017102201.GK2443@sirena.org.uk>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="msurlP/dxjcBujZL"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45964 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592Ab3JQKWF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 06:22:05 -0400
Content-Disposition: inline
In-Reply-To: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>


--msurlP/dxjcBujZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2013 at 09:10:51PM +0200, Tomasz Figa wrote:
> Since the patches extending support of amba-pl08x DMA engine driver to
> PL080S DMA engine (PL080 modified by Samsung) found in Samsung S3C64xx
> SoCs got merged into Linux 3.12, it is a good time to migrate the
> platform to use this driver and drop the legacy DMA code.

Tested-by: Mark Brown <broonie@linaro.org>

--msurlP/dxjcBujZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSX7pFAAoJELSic+t+oim9hioP/38H4f2bdntWMdZC4PoWcWMx
ijznGiykYZgnxlpaLnZRQtag4f26g3duj/2+ICOODsM97lDXgyv8CDhFmafqN0fL
yANX9dWafEQqkuywwpbfeinn+MXOTdbnmMUcnTWppUjw7NH7dBqigslU0IAKneOy
vhojbjUcU7n1ZvBNbnvmrrQzgahhJ4AzYJ0fUzV1/P4g1GEKerOdEz0OJbLbXsdB
iz+vC1gU6l1wwcXzY53cfq7Y/kgTv4Ne3wPMeGI6zYJIoKNvuFpOFtCnlWKVdspi
Cv9oJNGzsEurSNEs9hil21NoSn0tWwnm9CoTSGQvFidl3tokBGkeRjgXH/7ZTg/z
odx+5W3jddKyoiWSSLDuyyxe/gcUPywM8Azkasp4LLrfVPFp+EywEn+Eta1FRUS7
KpGH25u3id43x4XAZ+uKXjMjW73dxTe75weGog5agKJ4B+IKcKWD09rMBvBwnbd5
5NJRbJigyhgJyOQVnDpOYezZkBRH+hmFRJQ0KQJscUkYDOGDUh8rXC0zYSNLsARp
gK9CDUlv9w+DNIavSKVkb4EUw2CLqvhT1hrNyP7rGWadGB0kqYf0djV0CgQ+/Rv8
xiIIlMg6VUFRT9dW5zzpYYxED0GeOWbO9hJFp4zptDYApcayrmHbyL41R3avm2Ro
d0066uQinp3UyE28bffC
=xQFJ
-----END PGP SIGNATURE-----

--msurlP/dxjcBujZL--
