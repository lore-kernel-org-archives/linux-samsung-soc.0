Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C59C64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 16:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjB0Q1t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 11:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjB0Q1r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 11:27:47 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED240234F8;
        Mon, 27 Feb 2023 08:27:43 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D7C281C0AB2; Mon, 27 Feb 2023 17:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1677515261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s+jqgSTfT/rzh0IYfYeVAyzxRGiS8cL3QOmVV9+dazM=;
        b=NX6uc6LVRR9lrOLPlHjHgqS54lyO9LAbAFZxtccM3izDHUoW2Q+NP7HxcxLABEs4p1EhaB
        +JynfGlgiswa258ISmK0gGBSWR2pfYfb2Eu/WvO2t1bqQ7873cXG+GOb7EkF1didW4h6B4
        5h4joWyV4cwFSy0tfoZIGR31bHYLAVM=
Date:   Mon, 27 Feb 2023 17:27:41 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Markuss Broks <markuss.broks@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 2/3] ARM: dts: exynos: Use Exynos5420
 compatible for the MIPI video phy
Message-ID: <Y/zZ/UcWyT2EWAiL@duo.ucw.cz>
References: <20230226034424.776084-1-sashal@kernel.org>
 <20230226034424.776084-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="srAqSKKHkR1V1SUP"
Content-Disposition: inline
In-Reply-To: <20230226034424.776084-2-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--srAqSKKHkR1V1SUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Markuss Broks <markuss.broks@gmail.com>
>=20
> [ Upstream commit 5d5aa219a790d61cad2c38e1aa32058f16ad2f0b ]
>=20
> For some reason, the driver adding support for Exynos5420 MIPI phy
> back in 2016 wasn't used on Exynos5420, which caused a kernel panic.
> Add the proper compatible for it.

This is likely bad idea for 4.14, as that compatible is still in use:

drivers/phy/samsung/phy-exynos-mipi-video.c:		.compatible =3D "samsung,s5pv=
210-mipi-video-phy",
arch/arm/boot/dts/exynos5420.dtsi:			compatible =3D "samsung,s5pv210-mipi-v=
ideo-phy";
arch/arm/boot/dts/exynos3250.dtsi:			compatible =3D "samsung,s5pv210-mipi-v=
ideo-phy";
arch/arm/boot/dts/exynos4.dtsi:		compatible =3D "samsung,s5pv210-mipi-video=
-phy";

phy-exynos-mipi-video.c lists other compatibles, too, but with
different data.

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--srAqSKKHkR1V1SUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/zZ/QAKCRAw5/Bqldv6
8svAAJ0YV19ILKu22WLtKY0hjzfwk1EFmgCfbOpbyoPvkw0hGSTKexWH7aXMLqE=
=hA1K
-----END PGP SIGNATURE-----

--srAqSKKHkR1V1SUP--
