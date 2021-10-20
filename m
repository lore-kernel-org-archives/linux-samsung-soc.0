Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D90EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 086E860E76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhJTLOS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 07:14:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhJTLOS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 07:14:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B0076139F;
        Wed, 20 Oct 2021 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634727889;
        bh=sMNqIiJjcwrM/kpzKPJkufx9T9IAXcb0wsTgtzG1xm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SF+pbDEb5LUWi1FIobUSa9latykvOw8D/Rjn5udnGrIKSbxOOJ6lkudyC6Bu2sada
         wlV4IFiYddC9gBwhc/xSciIzwTot31Ckbj88C6ADvDGZFRKGmiflGOg3KiAFoKu42j
         gaP4otG5FQmsvCqpGKqRiHe0au5EIbyQ1s0XLZ2zSgiqOfHZ80ieAVf6Xm/AvYI9Lp
         3+fqA5/6igarlf8LaEL3XLOMcQyBgxK6Jxry4gJWk3pI2olcQGfYOo7NFtvnDgoHNf
         ydSvMHhfbuRHNun3yFpBhxr/cyx+e31rlFChBvuFYS0ll78rSUQEkhLpL0vwyITHYt
         XoIINZvWBbaOg==
Date:   Wed, 20 Oct 2021 12:04:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 21/23] regulator: dt-bindings: update
 samsung,s2mpa01.yaml reference
Message-ID: <YW/3z1HBU3+WwsZu@sirena.org.uk>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
 <YW60a8z0JNDnTLV/@sirena.org.uk>
 <20211020073013.6d144c0d@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZAEkjZ1m1ca4kKva"
Content-Disposition: inline
In-Reply-To: <20211020073013.6d144c0d@sal.lan>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--ZAEkjZ1m1ca4kKva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 07:30:13AM +0100, Mauro Carvalho Chehab wrote:
> Mark Brown <broonie@kernel.org> escreveu:

> > For a case like this where there's no
> > dependencies or real relationship between the patches it's probably
> > better to just not thread everything and send the patches separately to
> > everyone, the threading is just adding noise and confusion.

> It is not that easy, unfortunately. On some cases (specially due to
> DT binding renames) some patches change the context of a hunk, affecting
> a subsequent patch.

If that's the case then the cover letter really needs work to make this
clear, I couldn't tell that there was any risk of dependencies nor would
I expect any for such trivial changes.

> I tried a couple of times in the past to send the patches individually,
> but that was messier, as there was harder for people to apply them,
> as, instead of running b4 just once to get everything, maintainers
> would need to apply each patch individually. Also, there were cases
> where the patch order would be relevant, due to context changes.

You could also send a per subsystem series if there's a concern about it
being hard to pick up individual patches.

--ZAEkjZ1m1ca4kKva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFv984ACgkQJNaLcl1U
h9C02Af/QqIIdFgUqHCd9imzBH3Vi5+Z+3/0On7vsl4IbE20RXNk5eZFnv8f5Ved
2PlH3h6rteKeQFjUiXyFBM2GVhAtb7/PW/JslNVEVv9XatCiRDIwa5la4Eivdrw6
7n1zkGTV6kk6SQKiE8m9ECRx6JrPEWpGRIk0wdTgqAwhUPZbADYmBB8CyCGnJWw8
hj04Xhz+Ud1I63Eyv052BBD7OoVGC1JnQhwr8VfQWvg3WPolzBY/eIGp825rg0Ov
XwEOMSYyWFi7QvHi0HC/xBMK51xg6wlfhliRzX5nnrVKt6u6Etb7TNchakCXQ3/F
6JqMMaEsGO3D7AXzjR4QLo22YpvAMA==
=tTrb
-----END PGP SIGNATURE-----

--ZAEkjZ1m1ca4kKva--
