Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFFD6614C8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhJEMQl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 08:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233808AbhJEMQk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 08:16:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAA5B61166;
        Tue,  5 Oct 2021 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633436090;
        bh=DeaHbSCWFT8NlzFI7wJri1fE1dG3RGKllnRW0mksoIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CUNgIxvsTj9HQ9K9IbRnK/q5KeNl3Eq9UZtsxwYap6OhnKEBUkVz79qVWZIJA9OV0
         IqB9kLaFnP60wlAm0vYZYd2qO5B/pEgLAI0xfqKMM9a9rAJ9HvzzyWorat3pC0a5EJ
         RU80Mk5SupjC+SM+9lN4zx/oblJStStnqNrCbTjhFhKvSEUFGp1CKPGx8deEnKxNIz
         GX4qNwgH9EQHKAB4yRD3nkX4q9HGl5hvluanRCXqM2F1Y8kBwY33MxnAPpzQu/GRm+
         kMg0VaiExald2jB4tap1QTznzfe3UHVJfxC0s80FgZaDMlKgKbrUCaTbO4XqCOLP5o
         hda23Jz+1GW/Q==
Date:   Tue, 5 Oct 2021 13:14:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YVxBuEvHVdyDvaGD@sirena.org.uk>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NHJ+x3vjgC+S2IOr"
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
X-Cookie: A is for Apple.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--NHJ+x3vjgC+S2IOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 11:40:56AM +0200, Krzysztof Kozlowski wrote:

> Merging/dependencies
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Regulator related binding changes depend on first two commits (the
>    fixes), because of context.
> 2. The mfd bindings depend on clock and regulator bindings.
>=20
> The fixes and bindings changes (patches 1-10) should go via the same
> tree.  For example regulator or mfd tree.  I propose the regulator tree,
> since it will have also one driver change (the fix, first commit).

Lee, Stephen, Michael does Krzysztof's plan make sense to you?

--NHJ+x3vjgC+S2IOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFcQbcACgkQJNaLcl1U
h9B78Qf8DbtcL1OFNxmK5o5qziAQ7pj3GzOOi+h25mAQirGBLDoUxNGTTzs57/8f
kSK2LEvstzQMBEUeZtXSOzhHzLjAGRahEWlwNLmYP/8hSAlY+y9VJCEBbYbeWnbl
qm5Zy/rDqH8I9dKMWvTcMA6V2AfcGczQ6UnlObIdsO3+FYYRKvB9qxmQQaro8d8/
s3Eq8je14T6lQ+AITujDiWEoxUzJsrPX8WxZQAiKjmJjl/RB/sjI8bN1i0UImjws
IYvv3DYnFKTcyQzLXeBkstB/mmUaTAgdz9DzChh6j9StHXkI0h83/so2pp3Ys+09
1mV23wOM9a2muVldboi23vvDpWBjSQ==
=E3E1
-----END PGP SIGNATURE-----

--NHJ+x3vjgC+S2IOr--
