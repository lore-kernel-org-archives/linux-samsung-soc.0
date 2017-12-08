From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 270 boots: 35 failed, 213 passed with 20
 offline, 2 untried/unknown (next-20171207)
Date: Fri, 8 Dec 2017 12:27:03 +0000
Message-ID: <20171208122703.GC7606@sirena.org.uk>
References: <5a29d4c7.4fabdf0a.716d7.8485@mx.google.com>
 <20171208122007.GB7606@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55288 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752468AbdLHM1I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 07:27:08 -0500
Content-Disposition: inline
In-Reply-To: <20171208122007.GB7606@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <groeck@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2017 at 12:20:07PM +0000, Mark Brown wrote:
> On Thu, Dec 07, 2017 at 03:54:47PM -0800, kernelci.org bot wrote:
>=20
> Today's -next failed to boot on peach-pi:
>=20
> >     exynos_defconfig:
> >         exynos5800-peach-pi:
> >             lab-collabora: new failure (last pass: next-20171205)
>=20
> with details at https://kernelci.org/boot/id/5a2a2e7859b5141bc2afa17c/
> (including logs and comparisons with other boots, the last good boot was
> Wednesday).  It looks like it hangs somewhere late on in boot, the last
> output on the console is:
>=20
> [    4.827139] smsc95xx 3-1.1:1.0 eth0: register 'smsc95xx' at usb-xhci-h=
cd.3.auto-1.1, smsc95xx USB 2.0 Ethernet, 94:eb:2c:00:03:c0
> [    5.781037] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-241330
> [    5.786247] dma-pl330 3880000.adma: 	DBUFF-4x8bytes Num_Chans-6 Num_Pe=
ri-16 Num_Events-6
> [    5.819200] dma-pl330 3880000.adma: PM domain MAU will not be powered =
off
> [   64.529228] random: crng init done
>=20
> and there's failures earlier to instantiate the display.

I just noticed that further up the log there's a lockdep splat with a
conflict between the genpd and clock API locking - an ABBA issue with
genpd->mlock and the clock API prepare_lock.

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloqhRYACgkQJNaLcl1U
h9BXkAf+JiBBSJE7jt3ETImR80hxpOiHsozPQ+yhFKaYke6zWNEfLruZBlajkB4b
LK7bw5RbwjbWq9gqZeuKRpU7FA+NCUXt564sN+ZHeHwCqrHKmkgUUhf4pQJgZCDD
dbnoIG5ubGCHIxgQqY/uKb7cgT8cElyQELZtF/VU29uqTQ4M3ghCpPnXH8I/vGbC
kFT+5W58mBuzph1xh+5bvcj6hhZaR70qi/vMwSkfbXPPu82PDXN6PASQzUKk2nCD
dKzuzYwhgLy4DrOK8Za/Yu+BLiYoXwPuREIhagWo7UGmym5tlL3IamaXsWi5EcQK
90RHE0RS+c7/3rhSh24gidnXc87jqg==
=ar1a
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
