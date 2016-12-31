From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: samsung: i2s: Remove virtual device for
 secondary DAI
Date: Sat, 31 Dec 2016 18:31:07 +0000
Message-ID: <20161231183107.vvywtmaqegubpkyx@sirena.org.uk>
References: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161229113425eucas1p2600ba7e4337e90f65c0bc60bb4a9c2ec@eucas1p2.samsung.com>
 <1483011247-21613-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ckzaa56r5v7ipqqr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51332 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754731AbcLaSbO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 13:31:14 -0500
Content-Disposition: inline
In-Reply-To: <1483011247-21613-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>


--ckzaa56r5v7ipqqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 29, 2016 at 12:34:03PM +0100, Marek Szyprowski wrote:
> For some unknown (maybe historical?) reasons support for secondary I2S DAI
> was implemented by adding additional virtual platform device, which was
> then probed again with the main I2S driver. This pattern is really hard
> to follow and provides no benefits, so lets remove this hack and register
> both DAIs during linear probe of Exynos I2S controller driver.

It's historical, there used to be limitations that made it impossible to
register multiple devices to one DAI IIRC.

--ckzaa56r5v7ipqqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhn+WoACgkQJNaLcl1U
h9Cu8wf9EWYWbtjefWHP66ifd9YgDuSdY8D7lgrJF1xKru4U1QPX/MeuJwX/8UZB
BTcCEVOvMUU47fE0ei38TsoOgruxE1YB+zCsBaNRkHWtkWd8sXTMLTgyQjKJMkP2
qbTWppCVfq/wYDTOoAoex1Tkq++dv1gRqKTGpOPe6+lc80f86zOmRudV6JdUMTsg
5zNsgcal0oOwXEYPU5uhQZznS6Skh4MVhJNgeico+TBPqOxs51Cugwftzk8xlggO
fr/O9sadmAybWAmb/B01J0KJNPJLhh7xcZOJb1DXOgQbY0lBQbUUtWuU3qlEQKKK
Jwb3j9EKgSS0AlbVK+y+CZO1z5C3pQ==
=BeRR
-----END PGP SIGNATURE-----

--ckzaa56r5v7ipqqr--
