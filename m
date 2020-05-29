Return-Path: <SRS0=3jfO=7L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB89C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 May 2020 16:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A024820814
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 May 2020 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590771513;
	bh=X9EtO+jSwn5ip0cASm/U3/ohqZtcK6GSwCt+9vC2cy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WQM/wIZBu8MU4uQY0n+1oGMbqyJM5UsCaIhxATSFnOYEyIXc67wP6cM+oMVpVS/bN
	 uHlvS/2uQeFpDscsNhrk4xzJ+1kxxs0/cP6x5yZf9hCaEUAW6Dxw8yRwQQU6IsrEp8
	 9gZQaFMbWBEIYEiAitMWYwn+7dCK+OBhAiBvnJCM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgE2Q6d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 May 2020 12:58:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgE2Q6c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 May 2020 12:58:32 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E96B2075A;
        Fri, 29 May 2020 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590771512;
        bh=X9EtO+jSwn5ip0cASm/U3/ohqZtcK6GSwCt+9vC2cy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iISym5Us2DAtonwuWFKLN6dS9M6ONYc4yp3aKXrxPzDiktjhNHbynxkFhd+RWU3pB
         hTFNRiF6ag5jKMab1KMU4zEPbplsYHvYQVN+giBaEJJ4hDQHlvM8DN7L5K398w7FdS
         KaqeZ6r4oF8cFOlxamMQBjN6EcBhS9GqgtcuHSXU=
Date:   Fri, 29 May 2020 17:58:27 +0100
From:   Mark Brown <broonie@kernel.org>
To:     linux-pm@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>, peron.clem@gmail.com,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 0/2] Fix regulators coupling for Exynos5800
Message-ID: <20200529165827.GP4610@sirena.org.uk>
References: <CGME20200529124948eucas1p175379ead8afd1932f7b7ae61e35cf632@eucas1p1.samsung.com>
 <20200529124940.10675-1-m.szyprowski@samsung.com>
 <159077112408.28818.15178843458792850223.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+W7ryvxEk4RRyt+P"
Content-Disposition: inline
In-Reply-To: <159077112408.28818.15178843458792850223.b4-ty@kernel.org>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--+W7ryvxEk4RRyt+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 05:52:15PM +0100, Mark Brown wrote:

> [1/1] regulator: extract voltage balancing code to the separate function
>       commit: 752db83a5dfd4fd3a0624b9ab440ed947fa003ca

Let me know if you need a pull request for this - I figured it was too
late to apply the second patch before the merge window with the cross
tree stuff.

--+W7ryvxEk4RRyt+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RPzMACgkQJNaLcl1U
h9B9jAf+MIaqrDJTZLjVTFB7PyoS1HONgnNh1HIsRXUgSMtlUU6SRDfmoo/KriEP
QkiKgNLCc4QGuSA7ttP6FbmbWZRwbodiRfoXfC/fNpP2YOmde6657uOkkHgLRzUg
gQtw3QVUfF3wIkYznk/n69PIutoQI22mvv1fq2unHolcVH6xNAh90yOV3pRl63jY
J2AWs/iRn4l1fUUDXhpHf7er4sQr9boX/V5ak1Ab6GzC98y6KuAEurarGcwWW1PB
KhD+yQQ1I4jJu4Ecr+mQTT3tX0jaUo3QBucaRbeQz6kRDF1siiOe5/mseEggXadT
BJ/bSFFJl8wLDViz9zx/97IDlTZLZQ==
=oyxQ
-----END PGP SIGNATURE-----

--+W7ryvxEk4RRyt+P--
