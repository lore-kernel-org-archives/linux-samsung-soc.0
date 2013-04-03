From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ASoC: Samsung: return error if drvdata
	is not set
Date: Wed, 3 Apr 2013 17:57:02 +0100
Message-ID: <20130403165702.GB11305@opensource.wolfsonmicro.com>
References: <1364901782-16619-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7363932495793427481=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1364901782-16619-1-git-send-email-padma.v@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Prathyush K <prathyush.k@samsung.com>, sbkim73@samsung.com, kgene.kim@samsung.com, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============7363932495793427481==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2013 at 04:53:01PM +0530, Padmavathi Venna wrote:
> From: Prathyush K <prathyush.k@samsung.com>
>=20
> This patch fixes a possible crash in case drvdata for the secondary
> device is not set.

Applied both, thanks.

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRXF9WAAoJELSic+t+oim9JF4QAILGq86Pcmzn84cEmm0Ha+Eq
z7IsM7dAgJeXJplp41qTpJMG7hm8pwHWuT7J+KIw/XnSRchlgcDvyMdC1Vt9iXsU
scRaIpNVNGaHwYUi6pGxYVT+OPVFd3zb2McsQ3Fqr/hhFX0cdybwm/j9C+docQ+B
b7FXA0uJt+l0j+rjoJlGo4q1mRQjFTFozVvvki6rH12kwFIEKBIESG3asgGMy7dq
Kt0j8VouBuJiOAsV1kkeXAd6FtpxR3ACkLmCBL0RcJoG1k/ewZ5mAm3jzOeKOgZS
+h7O0+NEGbqdNAE2dJDXJniXrBUE8M3FXGI8Ioqi5IKVavwSu93X1ujW7bNFr8ps
lN1KaVf1R4TCXdclx5aGcOh2kreO3oZGYZVsbOP/YskbdVYB0HqjVURuWf3rxawP
YYHwA+h9Iicx2/tvZcPoLN0SrDAbnDUPRFsETEHMlInHAOLcOYPeVmr6IV9OleNw
zGC1JJGTSFyOwapdbdRUtM9CDZa5VBDBek9FCUqqBclEhJGPSkvAkfUMk6KaiXyJ
wi/K5OE51LKtZasACLvGWQWFEl8+2DlZ7Sy3yEpEpNXAPL+v6n3ZNMwL3npZ7+Xu
UwlFyf44Uzn2pOVTMS9z8Q2Jp5HDkGKNW4bLbyVci4OlcY4+NRDNGtll8Bqw3Dp6
u3cTiyIpvRpLcPZVikDe
=eLl3
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--

--===============7363932495793427481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7363932495793427481==--
