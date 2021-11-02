Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4776C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 16:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD1D860E90
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 16:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhKBQlW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 12:41:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234716AbhKBQkl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 12:40:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D272560C51;
        Tue,  2 Nov 2021 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635871086;
        bh=UdQt9PK3L8XB/dN3LAsfIcM0QcNxMg3DkJ0OQnI5fG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DEb56UfEg9IWKBW8oV9jWecxQGIHR1f10Sg50fMdCH8bmEeM8TgQF9HurX5VaJ/+r
         L6Ee7KhX8U4+PiIqcRVQKZSzYoYstShzzBYF3C++QfDipTzE2ZeL9sygFkCMubMa0j
         4bZ7KcHApsvwvo9CB2AN0kqA6gcI1vS9xnWnEK6cLe6bR2ucmsY9Iqa9Aoh0KIBHET
         5pta+OrHgwPUGjRLCRlHgsjacAQhrYyNB0jnyugU/ObCv681JXB8tkonQU4EwywGyf
         hX2AjYDAdEDSuS/kXbZyX1a3njkpTp9rJF7BYkFTddko8lzBLC5deTFVGANb3hGqdr
         ykMK3YF4V92ig==
Date:   Tue, 2 Nov 2021 16:37:59 +0000
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
Message-ID: <YYFpZ9zh5++xl6nr@sirena.org.uk>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TE5r+IQ6TnxUK8oQ"
Content-Disposition: inline
In-Reply-To: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
X-Cookie: Love America -- or give it back.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--TE5r+IQ6TnxUK8oQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 12:05:19PM +0100, Krzysztof Kozlowski wrote:

> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
> possible removal in one year (after 2022).  The deprecation message will
> be as text in Kconfig, build message (not a warning though) and runtime
> print error.
>=20
> If there are any users, they might respond and postpone the removal.

The Speyside system is s3c64xx based, I'm in the middle of reorganising
my hardware setup so it's not usable right now but it's quite useful.

--TE5r+IQ6TnxUK8oQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGBaWcACgkQJNaLcl1U
h9CrjQf+PnesumCFL1DvgflH3XWUMUM2ZzcJtAuKSNq2macjpsBkZJ+YSktw5/5y
Y7hQJxlW9Xm8qjE+/XluPkmPoaep7HiNXE2Olukgw48JnYXUH35qZakj2IVUkocC
I0sm6pprgZjTkEltZY5Z2s8gh4CdnqrLyxmBIE6KKdbAOwyfkNxFcr+O63jAX7C6
nUDffSGpAT02Eey9dOL2tz9qyvOULlFoY43Ne9E0VddtUN7V/abVczLNPKx1A1KS
RPpGnmx8tveXm1Rb+9YrnEvSvRSwdZMx+2pPTtZymHKkQ7uSlNEWKnChgR/jUh7N
2vbtlXucIwBUxIKgi5bKQ0uYl/dQ3Q==
=63V7
-----END PGP SIGNATURE-----

--TE5r+IQ6TnxUK8oQ--
