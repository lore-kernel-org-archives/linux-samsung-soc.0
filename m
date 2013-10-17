From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/8] ASoC: Samsung: Do not require legacy DMA API in
 case of S3C64XX
Date: Thu, 17 Oct 2013 11:34:09 +0100
Message-ID: <20131017103409.GM2443@sirena.org.uk>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
 <1381950659-12703-3-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l8yoENEkJUIoCzE7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:55756 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab3JQKe2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 06:34:28 -0400
Content-Disposition: inline
In-Reply-To: <1381950659-12703-3-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>


--l8yoENEkJUIoCzE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 09:10:53PM +0200, Tomasz Figa wrote:
> With support for amba-pl08x driver, on S3C64xx the generic DMA engine
> API can be used instead of the private s3c-dma interface.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Mark Brown <broonie@linaro.org>

in case we can get this into v3.13.

--l8yoENEkJUIoCzE7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSX70eAAoJELSic+t+oim9AswP/RXLYLCjNzuQhjC7kqrxV/iM
YLb9UfUaA0AGjeguru6VDxLUCZufSPB+7fmMV7H9z9PDpQaPXY5TArLD70Pcehkn
H+zN6NSwCqzOk7uMclpVgaakogN4e4rK7IYAirEuKNKYcY1RszCA9yUBbKw5yic2
78porNpNxT6Bd2WEtY+AjtJhrG0eKmyGPUcXgA0BexGYl5Mdg3qaXQmFxo52askT
H61U2777s3mpluHnYoJJEM6UyJIAN+GAo4mtQTIyg57WqW5deoxTvnZJhB2sABjR
dKuj+W35GLSVjggxbiY1RsAsKQpSjiJkjbAlIGJ9lI6Q6ayy1yoD+pVUV88XWQ0d
JXuWErzNhcnq9H4hQQZax5S8AaxFrX3R11YRAR27BCAjtgDfqwJ+Ryg1W0fwJz3L
C1tLCo1++EMzaGmnSVDY6013VCPD8V2K3G+ugSjABTjiS7QbLswcof9LFRwqEAQV
WycqhGcY5Fldb9BBJ7rVe+smrfk5OS+Ngo49BjuF7xatc+2hh8jrFgmIzn4QZ2N2
QIfep8dFVEPN/XkcVqwvV+JKg7V74UErx4s34TXK8pI5StPw31wsoQRcZelaQDck
aD9IvYVwnzYKaS0g5NtKbmiDIOYOztAKhzu1Gk9Op20nxScqKCUMSN4mxTaE9HF/
Bwx0JD0g/NVE1l3Kbmub
=0zrV
-----END PGP SIGNATURE-----

--l8yoENEkJUIoCzE7--
