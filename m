Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E74C3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 16:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF57F246AC
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582906343;
	bh=pxD46haJcaA6QS3w+Cb8Q6cio3wO8f8mOzJb+lvVvF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1xf4YtRSQevdzLnxLg2IK2aS81cfkygJf0cajMC1GGdKCCLbGU8l6rPXhbcNemw80
	 w6snkWcf80UYf+O7Uc+aXheboaqmfSXK6LPDz3zOPK3cr+xVct6xuL1ZoTFg+Owsti
	 pj6IT1Cj+g/lvB7H0K/tzHxh+W/rGjGa4kxqTGBU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgB1QMX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 11:12:23 -0500
Received: from foss.arm.com ([217.140.110.172]:40834 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgB1QMX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 11:12:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E1AF31B;
        Fri, 28 Feb 2020 08:12:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F85C3F73B;
        Fri, 28 Feb 2020 08:12:22 -0800 (PST)
Date:   Fri, 28 Feb 2020 16:12:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228161220.GB4956@sirena.org.uk>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20200228101120.28819-1-m.szyprowski@samsung.com>
X-Cookie: There Is No Cabal.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:

> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.

>  	if (ret) {
> -		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"snd_soc_register_card() failed: %d\n", ret);

This is completely removing the diagnostics so if things do get stuck
the user will generally not have any hint as to what's going wrong -
it's better with this sort of change to lower to dev_dbg() for deferral
rather than completely removing the error message so the user has some
ability to figure out what was missing.  However in this case it's also
the case that snd_soc_register_card() is fairly noisy.

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ZO+QACgkQJNaLcl1U
h9B5fgf/S13C+As9tfpnYGFNZjiPn/6K9QTR2M0U36HTwFtV64VWQDhIUJT8JAB7
GGcy3Tvpotahf0rdgkdwULZqR7rQlxEWDBm5oGYvVkUtPcThDWAn20ykhBTaEuqX
1aYxEB+xmwtEyS0YE+aXfTIKERWRvUThvihaSFEdSlCBFYUlpH1uuw1XjNjeS1iT
7ovjutAtzvU+E+g3Sro6mVRUigLpcl0SXLemtpICohjZna53vbUqnOQOIUm1mCBa
sWBo89lsYED8fPkNlSeQHSj01XdzR+RI8bLZqOc/cUTamMuZfEtU1oAosrdjf6Q/
L5iDpjMP+yeCLQ7XdaXZ6uK0dWaMwA==
=x5Pa
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
