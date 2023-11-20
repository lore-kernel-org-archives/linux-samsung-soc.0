Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B48C54E76
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Nov 2023 12:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbjKTMGo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Nov 2023 07:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbjKTMGn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 07:06:43 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3830BF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 04:06:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5329-0000qA-BQ; Mon, 20 Nov 2023 13:05:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5322-00AL9N-2Y; Mon, 20 Nov 2023 13:05:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5321-004MKG-NA; Mon, 20 Nov 2023 13:05:37 +0100
Date:   Mon, 20 Nov 2023 13:05:37 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Zhu Wang <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steven Price <steven.price@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Thierry Reding <treding@nvidia.com>,
        Dan Carpenter <error27@gmail.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Deepak R Varma <drv@mailo.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 00/16] drm: Convert to platform remove callback
 returning void
Message-ID: <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ufcnet56kc2kty3a"
Content-Disposition: inline
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--ufcnet56kc2kty3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped a few people from To that resulted in bounces before.]

On Thu, Nov 02, 2023 at 05:56:41PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series converts all platform drivers below drivers/gpu/drm to use
> .remove_new(). It starts with a fix for a problem that potentially might
> crash the kernel that I stumbled over while implementing the conversion.
>=20
> Some of the conversion patches following this fix were already send in
> earlier series:
>=20
> 	https://lore.kernel.org/dri-devel/20230801110239.831099-1-u.kleine-koeni=
g@pengutronix.de
> 	https://lore.kernel.org/dri-devel/20230318190804.234610-1-u.kleine-koeni=
g@pengutronix.de
>=20
> and three patches (bridge/tpd12s015, exynos + tilcdc) are new. Parts of
> the above series were picked up, the patches resend here are not.

Apart from a Reviewed-by: by Toni Valkeinen for patch #16 and Inki Dae
who wrote to have taken patch #8 (but that didn't appear in neither next
nor drm-misc-next yet).

Also in v2 they didn't result in euphoric replies.

Can someone who cares about drm as a whole please care for this series
apply it?

Best regards
Uwe
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ufcnet56kc2kty3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVbS5AACgkQj4D7WH0S
/k5ljwf/fbUqzZ6qYDVQTFo8CLF29RFHPtXKCYzB3ACPuZW1XDZ0nqpyOaOYlJTM
m/UywEGAcpJBi6xYedgzANfhEeHClU7sVWTu3FtErEmvMEdL6cRv3iGUUYJMJKaz
jaJgPT2edHjnQagw6EQVf35DRBHzIDAb+bAnGi35nLYit5bXGOUblE3/t/91GW0b
v7scQQKZizofPiQxmwS1ifbOZ0SrXDF6qQXCswjS21FAo0P96L1jUpoCIwiv6Cgk
0yQ8QkqHSbesIkzwtMwiAGA2iyF0CbMQziBwuCZEZqQHfinJK7BqJF+94UBXDaDj
DPQvaMnGHvaZZyw7O3SbZx8wAfxaLQ==
=KndO
-----END PGP SIGNATURE-----

--ufcnet56kc2kty3a--
