Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB351C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Nov 2023 07:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjKHHzC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Nov 2023 02:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjKHHzB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 02:55:01 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5581710
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Nov 2023 23:54:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0dOq-000726-LT; Wed, 08 Nov 2023 08:54:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0dOp-007U6c-CI; Wed, 08 Nov 2023 08:54:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0dOp-00F3G8-2a; Wed, 08 Nov 2023 08:54:55 +0100
Date:   Wed, 8 Nov 2023 08:54:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Inki Dae <daeinki@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        David Airlie <airlied@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
Message-ID: <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4ee525joepidqzyr"
Content-Disposition: inline
In-Reply-To: <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--4ee525joepidqzyr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Inki,

On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
> Sorry for late. There was a merge conflict so I fixed it manually and
> merged. And seems your patch description is duplicated so dropped
> duplicated one.

Ah. I have a template that generates one patch per driver. I guess this
is the result of using squash instead of fixup while putting all exynos
changes into a single patch.

Thanks for your attention to these details
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4ee525joepidqzyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVLPs4ACgkQj4D7WH0S
/k7L9QgAolS60R7msFY5OqY64n8qhXTXnJCQP+QBKwjm3PQATWGOhZTWakUzrAa5
cHQIFwrr4ZMPMhoTwpiki2g4AFZp4gK1dNXfQcaNEqqFlMYSHUy46kIm+6T2A0DA
FH1H82GDT3KUxcQ62vt1wSLMRvE3sb8uErGpt/SVkejPaDrhuvTZxWq+eqc2QvJf
s9zM55SqKMIvm7z21ErEBFsQ5pTa9j6ptEJ9JUZD2YQ/jxbCGQUFTaUDN0aD6rNb
KJMxyCML5fuMUNMAsnykhbn0UYJHr7PSOIcZOik2VBzOKTP8BmxKtGryVyvefIqB
HQKXQ3KyuLHUY05MphUqwcDXGW6zBw==
=XPUe
-----END PGP SIGNATURE-----

--4ee525joepidqzyr--
