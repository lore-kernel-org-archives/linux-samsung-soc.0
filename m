Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DEED5D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 08:55:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r81MZ-0005dd-Cf; Tue, 28 Nov 2023 17:55:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r81MX-00CDfs-Jc; Tue, 28 Nov 2023 17:55:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r81MX-00AHeQ-9x; Tue, 28 Nov 2023 17:55:05 +0100
Date: Tue, 28 Nov 2023 17:55:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <daeinki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	DRI mailing list <dri-devel@lists.freedesktop.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@pengutronix.de, Alim Akhtar <alim.akhtar@samsung.com>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
Message-ID: <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7fs5cwk3flthf5w"
Content-Disposition: inline
In-Reply-To: <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org


--i7fs5cwk3flthf5w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Inki,

On Wed, Nov 08, 2023 at 08:54:54AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Inki,
>=20
> On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
> > Sorry for late. There was a merge conflict so I fixed it manually and
> > merged. And seems your patch description is duplicated so dropped
> > duplicated one.
>=20
> Ah. I have a template that generates one patch per driver. I guess this
> is the result of using squash instead of fixup while putting all exynos
> changes into a single patch.

This patch didn't make it into next yet even though it's included in
your exynos-drm-next branch at
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git.

Is this on purpose?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--i7fs5cwk3flthf5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVmG2gACgkQj4D7WH0S
/k7MnAf6AnARez3r/1IAvscO7iMOqvBKQZuLiFE8JSnzPAmMWKrnhFjxR31rGKZX
m0OhJ/I5X0zf/mFOmRJa9aZM24HzEqhp9YGpqdNBOSe7lpYvUO6IN9apdQcTYxDX
kfjWLlSrKmibDaaotp1f2CCe94GvMK7H2ItI2kogAmmrNJ+jxFPJjTNCJyMxlseE
svuKSn9gu8QvCXKKVvBFP6KUwb8OoBH1rtMktmQpycA46MMGPMK6KSd0/GOpRnD4
9DjjIrYpMgETIbZlIgeOv4/qU7aNnaAwoXqTZzTcAiJn9sJ8PuvDA8BblFZPdFyU
gmKefy0lpwaBGgEx8hz3tPKfQDn8Sw==
=hQwW
-----END PGP SIGNATURE-----

--i7fs5cwk3flthf5w--
