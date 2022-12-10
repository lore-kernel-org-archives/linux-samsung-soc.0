Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350A2C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Dec 2022 09:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLJJWT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Dec 2022 04:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLJJWS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 04:22:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF7EC33
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 01:22:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3w3Y-0003nU-Gl; Sat, 10 Dec 2022 10:22:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3w3T-003YC4-IF; Sat, 10 Dec 2022 10:22:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3w3T-003yUw-Ba; Sat, 10 Dec 2022 10:21:59 +0100
Date:   Sat, 10 Dec 2022 10:21:55 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
Message-ID: <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lx3uyybbmyqkxs4g"
Content-Disposition: inline
In-Reply-To: <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--lx3uyybbmyqkxs4g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Fri, Dec 09, 2022 at 11:53:49PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 9, 2022, at 23:05, Uwe Kleine-K=F6nig wrote:
> > Some of these dependencies used to be sensible when only a small part of
> > the platforms supported by ARCH=3Darm could be compiled together in a
> > single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
> > for kernel options incompatible with a multiplatform image. See commit
> > 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
> > details.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Makes sense,
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks. (But honestly I'm not surprised you agree to this patch after
our conversation on irc :-)
=20
> > diff --git a/drivers/gpu/drm/omapdrm/Kconfig=20
> > b/drivers/gpu/drm/omapdrm/Kconfig
> > index 455e1a91f0e5..76ded1568bd0 100644
> > --- a/drivers/gpu/drm/omapdrm/Kconfig
> > +++ b/drivers/gpu/drm/omapdrm/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_OMAP
> >  	tristate "OMAP DRM"
> >  	depends on DRM && OF
> > -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> > +	depends on ARCH_OMAP2PLUS
> >  	select DRM_KMS_HELPER
> >  	select VIDEOMODE_HELPERS
> >  	select HDMI
>=20
> Since the original purpose of the ||ARCH_MULTIPLATFORM was to allow
> building the driver on more targets, I wonder if we should instead
> make that ||COMPILE_TEST, which would also allow building it on
> x86 and others.

I wondered about that, too, but thought that would be a new patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lx3uyybbmyqkxs4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOUT7AACgkQwfwUeK3K
7Amcbgf9FjDJ3Y/G6MIauV6V2InYndp8uCxtZzkthWGB+KJwzC9s9h5qnAAmOmpE
qN/t2/cHhGqjOrbdBWvHZbXZVRkp9b3O8YhTSXGaavSOPGo2hdRofAJ77nnwXbzn
V56RWaNtHq115LwxdWUnj2Gj8J2vl69XCUCawcT8sjT7QA7fP9/WA/tyrFS+Qkiz
kwxBgJsyNtpy9K/0bMdvOy/E5FI4CkRy2U6h7Lq0SxZIwM3hx22elrLbrjgdaiZC
lKJSyfB2mELNGEYzmhyXXI49cbfcwjMw3i6z8+/jXTSFGHhta2ARzHlPGl945VFn
Vtlv+RShs/Yf3gqhsSYCL6q8o0zehA==
=ZXhE
-----END PGP SIGNATURE-----

--lx3uyybbmyqkxs4g--
