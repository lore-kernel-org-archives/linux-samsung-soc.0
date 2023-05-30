Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69057C7EE23
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 May 2023 12:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjE3MOZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 May 2023 08:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjE3MOY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2023 08:14:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478849D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2023 05:14:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3yF3-0002nP-KM; Tue, 30 May 2023 14:14:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3yF0-003s3C-IG; Tue, 30 May 2023 14:14:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3yEz-009UQV-Qm; Tue, 30 May 2023 14:14:17 +0200
Date:   Tue, 30 May 2023 14:14:17 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
        patches@opensource.cirrus.com,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: s3c: Switch i2c drivers back to use .probe()
Message-ID: <20230530121417.dmow3dhajwv5wo3o@pengutronix.de>
References: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
 <168543271188.12093.7915373684614866148.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dhbsszq3h2drxvgm"
Content-Disposition: inline
In-Reply-To: <168543271188.12093.7915373684614866148.b4-ty@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--dhbsszq3h2drxvgm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:45:48AM +0200, Krzysztof Kozlowski wrote:
>=20
> On Fri, 26 May 2023 23:40:03 +0200, Uwe Kleine-K=F6nig wrote:
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> > convert back to (the new) .probe() to be able to eventually drop
> > .probe_new() from struct i2c_driver.
> >=20
> >=20
> > [...]
>=20
>=20
> Fixed checkpatch issue in commit and applied. Please don't skip checkpatc=
h on
> your submissions.
>=20
> Applied, thanks!
>=20
> [1/1] ARM: s3c: Switch i2c drivers back to use .probe()
>       https://git.kernel.org/krzk/linux/c/ca027ae58eaab3632966158ce440a7f=
50da52bef

I'm aware checkpatch wanted another "commit" but I didn't add it
consciously because it sounds strange in my (German) ear. *shrug*

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dhbsszq3h2drxvgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR16JgACgkQj4D7WH0S
/k7Dowf+NzChdEN1xHLrRexUX5BP7aVbq7d7P17DCXlCkwCcNrRH15Q3iq+83EG1
gyybZZBErRsVytw0+eVVPgfUGe6A8AVFpET8hWC5AMfSKosYXVIYfATFq1KjJUOT
UFbqH8y/esStCHEIdbfADiQjG8Mxs1UNUVNvgGNZSDv5kizQeMtdc4ZlmTH9Z3DJ
CIt9UOTOQ1iCG8MxHggkArC4sywTNUvv/spyoTcwpxSxCLZc3QHAjatOCivphdS2
X+jVU66Wnlr+h05+SJRfaq1HW94q2PnCAPqOlYY71P5xA7FAPHPw8d2UBiAJp68I
R7m36IW2zWLQXCvTgSboozXmps/++g==
=Z40u
-----END PGP SIGNATURE-----

--dhbsszq3h2drxvgm--
