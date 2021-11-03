Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADA5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 17:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 019EE61108
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 17:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhKCRIV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 13:08:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233173AbhKCRIP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 13:08:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB3E961053;
        Wed,  3 Nov 2021 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635959138;
        bh=uUW1VnfLgjDqDIhZ0NgP7HxvtNYo0Vc+mGyEKPaxnIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pB5t55nzCfrr/jNa0u98bZg1odd03Qmtu5jUVotCClDv2De+btSfANwN85PXYdCyj
         8fTqGBGzj5QWjEFuuUoeesZhXrfUDoSeMzKXLPUZRm2ccHH2z4xmH1ftihR050s/YL
         QeyGp63CRp2F4RZpTYLHN62mkIjMnuDjbMtKZradbcaofE0G3yzLcMDQx4mxzVH1/Z
         c9AUhxrOhRbm1pAbSITXz3BWlNsjoZqWupufno4UaiAy6/8cFa0F5RoEP+dahIpWpY
         7JUag0SNe5n/zOkgjDJ5zj640sg6t8DF1W3+sxQzRfUGOhaYWFw1I3NXubKVujik+L
         BmsL0l6OFooPA==
Date:   Wed, 3 Nov 2021 17:05:31 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
Message-ID: <YYLBWy1M1XbMv17F@sirena.org.uk>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <YYFpZ9zh5++xl6nr@sirena.org.uk>
 <217cc985-9c82-f9ad-78ee-4d9d82a894d7@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9DmxR3VJqHVZPhSi"
Content-Disposition: inline
In-Reply-To: <217cc985-9c82-f9ad-78ee-4d9d82a894d7@canonical.com>
X-Cookie: Thank God I'm an atheist.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--9DmxR3VJqHVZPhSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2021 at 09:27:46AM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2021 17:37, Mark Brown wrote:

> > The Speyside system is s3c64xx based, I'm in the middle of reorganising
> > my hardware setup so it's not usable right now but it's quite useful.

> Thanks Mark for the feedback! If we keep the s3c64xx, are you able to
> provide some tests from time to time?

Hopefully, yes.

--9DmxR3VJqHVZPhSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGCwVoACgkQJNaLcl1U
h9B6uAf/fIB/bTFpQFeNKNzm3C82r9eEUlmGt1EY+bt6qNrOIK77EBZHglZYGwQT
GD7MlU2a3dsZGVAM78Z843rsETMSmkOW7z/nXJnNJNiSAnWQL6scQR177gHkckwp
ocI2/AKFAnNUorsNGODifhgMH1EWGU6J8UIUkDVufA32ZFpnP7xph0s1Q4rIakEE
x8WT+IW+/+ImwSP+M6GeUyA5VcJbvJrSY66gJGrbdsu2mVUJLOKBE0Fz63I4wJ/t
RJZR0C21w7XOvKbBAWcBN3q12D5jwM0KN/TyOM6JKymyqZLJXe6MaYOYCstAF00Y
Qx0nirHFiIDppZIpxz3xhrx+D01IZw==
=QDgj
-----END PGP SIGNATURE-----

--9DmxR3VJqHVZPhSi--
