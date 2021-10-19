Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBA2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 12:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A3760F8F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 12:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhJSMHf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 08:07:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhJSMHe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 08:07:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 909486113D;
        Tue, 19 Oct 2021 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634645121;
        bh=Yfzv3JLOoikBX5r0f6NfD+xVedKpz1VXqAirmc35zTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YSVCkvJ4gbqhy5ptebDPhXkK7TvFGUETIaHbESiXy62S/1kmp4B2Nacw3b+in1DuY
         662rjmB+Oxuyr9FpGGzTVO8UPVPZitMZoBAHD5g15s068GRXaAZfw+RdPAx97VzvdH
         XpN6QAWEZuHnhrwILQpU8lp2/DZTo9JWrzRNN94AXGiEWkYjgbU1XaHbodaI9s+/Pj
         s2WIe/vz2huIkSUv9JQ7N0Ufk6P/SWAOwgrcY59C8t3zhoFmvkFJpFKoq7bkILXgpH
         YWXVMwsZ1z112/xiYfx00GJ3K9HFEn+gT37FkhbnIm5gV+QlFtXulENj+diC/CxHOU
         vvQ7FrQ6iOsDA==
Date:   Tue, 19 Oct 2021 13:04:59 +0100
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
Message-ID: <YW60a8z0JNDnTLV/@sirena.org.uk>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EWoxm8P8Rct2LAPY"
Content-Disposition: inline
In-Reply-To: <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--EWoxm8P8Rct2LAPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 09:04:20AM +0100, Mauro Carvalho Chehab wrote:

> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

It'd be a bit easier to put a note in here about what the dependencies
are rather than forcing people to go out to a link to figure out what's
going on unless it's complicated.  For a case like this where there's no
dependencies or real relationship between the patches it's probably
better to just not thread everything and send the patches separately to
everyone, the threading is just adding noise and confusion.

--EWoxm8P8Rct2LAPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFutGsACgkQJNaLcl1U
h9CpcQf/eSHN/SxKNGSizt9rtPBAa8/G/yrOVJanFr1TpMgBqymW7cBkBbXTGEoz
MlvVhYvaOC1OUl2Ov3V/R5vs4HmOXbFkm+uU3Hy0pdmuoR+xp2GXkRykwFp8VOo9
u86bgJzCmE1vMGPs6CU5L/oLaZtgu2fOSkIddls4s2BzCEgj9RXCZVZZDuiwu1p5
En59hCC7xvkrwl+DzR7ELgphtrGbhWP8udWOpispPKOra+L2fvck+d1CNHVWWx0T
hHXnc2o0xvG2TVSXxxD14sYrgOOEPahJN1EFZSMqmo+1KDjK7lyXXsAkMNYAoTT5
mdoz3TDNrINobQeldsheYs7AYnpjQQ==
=OxCs
-----END PGP SIGNATURE-----

--EWoxm8P8Rct2LAPY--
