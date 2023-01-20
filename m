Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F3CC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 12:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjATMHo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 07:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjATMHn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 07:07:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1637DF99;
        Fri, 20 Jan 2023 04:07:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E4CC61F42;
        Fri, 20 Jan 2023 12:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE9DC433EF;
        Fri, 20 Jan 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674216460;
        bh=59rSi/VRPu6xeT5pr3e5nabXo3izJ7s9J6YeNyStd2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tPAmeqmt2csu9VnCd1sjLPw+uhI+ttnEjDiNSoQEKBWdSiJncvZbUAdbXrm6FmLWV
         u3a4B59YF7EW03Gn7+KA6UrjUM7am35gpX6LndaIfZTC9PHiKbJ0JMBpeGg4l4e3Lc
         KTbf5qLgoZx9ETajRwnFWTCcCkZmvn+GbEDVjndQTVfwqEdrEGQpnufB6cAyCoTc7v
         gDfi2aHSU3lJP2o1Qp/0Opln/LsGkbRhdbp3b/xBVv4mU2Nmyz+S6XJyuEfElOJDt5
         y0F+/AFa/z9MjcZ97912liNTqh+XwHdOrIHxMe9OQ1jIEUU3r5xX/Is8ji8EhdjRvf
         4KSDxnrLqrxsA==
Date:   Fri, 20 Jan 2023 12:07:37 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/5] ASoC: samsung: remove DMA filter function and data
Message-ID: <Y8qECf4CgsNkLNho@sirena.org.uk>
References: <20230118161110.521504-1-arnd@kernel.org>
 <Y8l21Kb42l2ZcIC+@sirena.org.uk>
 <99519eb0-399d-4972-ae09-955a34830b55@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hWy1TWofl5oPHiyo"
Content-Disposition: inline
In-Reply-To: <99519eb0-399d-4972-ae09-955a34830b55@app.fastmail.com>
X-Cookie: Serving suggestion.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--hWy1TWofl5oPHiyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 10:05:59AM +0100, Arnd Bergmann wrote:

> I see, this patch still depends on the s3c24xx removal, which
> is in soc/for-next and I used for testing. I see a similar
> problem with the MMP platform in patch 2/5. The series here
> is mostly older patches I did a while ago and rebased on top
> of the boardfile removal, but it breaks when it gets applied
> first.

> Unless there is anything in here that you really want to apply
> for 6.3, lets drop all five for now, and I'll resend it
> after the dust has settled on the boardfile removal.

I'd left the ux500 stuff running through my testing, no
particular urgency just it saves rereviewing anything.  Assuming
it's fine (seems so thus far) I'll push it out.

--hWy1TWofl5oPHiyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPKhAgACgkQJNaLcl1U
h9BUrAf/UMkGgrt0kpEybfiAhWigEbFnU1JOMdv5V+73qzx1D4vcLNB0qcRCKRsJ
avfFIgqgKKlMewmj0Ndy3JtNpza7jn7Rkfewtu+V51hTVDasZOBfZIuxsloY+gZK
aR+x0tuZIZcbDavJtchai3QD6PxZIZWP4efyNvlZMd4dokFwX4lom4rMycVsF4Mp
nS3TSfg3Zf6++dW59iduEZMG4XESx6TtS86AjIRqc6pBt1Y3YSEneV4klfQX2BzO
tOHAO9pWPxSq3DElsgnRPmfkixguKapT3+lvaseqZZw9V1AZLIbNBXjq2ujiLEYK
jBNJdGuNqVv3dfSknaSd6eB/APHYkw==
=s2qN
-----END PGP SIGNATURE-----

--hWy1TWofl5oPHiyo--
