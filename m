From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 270 boots: 35 failed, 213 passed with 20
 offline, 2 untried/unknown (next-20171207)
Date: Fri, 8 Dec 2017 12:20:07 +0000
Message-ID: <20171208122007.GB7606@sirena.org.uk>
References: <5a29d4c7.4fabdf0a.716d7.8485@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43678 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751800AbdLHMUN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 07:20:13 -0500
Content-Disposition: inline
In-Reply-To: <5a29d4c7.4fabdf0a.716d7.8485@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <groeck@google.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2017 at 03:54:47PM -0800, kernelci.org bot wrote:

Today's -next failed to boot on peach-pi:

>     exynos_defconfig:
>         exynos5800-peach-pi:
>             lab-collabora: new failure (last pass: next-20171205)

with details at https://kernelci.org/boot/id/5a2a2e7859b5141bc2afa17c/
(including logs and comparisons with other boots, the last good boot was
Wednesday).  It looks like it hangs somewhere late on in boot, the last
output on the console is:

[    4.827139] smsc95xx 3-1.1:1.0 eth0: register 'smsc95xx' at usb-xhci-hcd.3.auto-1.1, smsc95xx USB 2.0 Ethernet, 94:eb:2c:00:03:c0
[    5.781037] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-241330
[    5.786247] dma-pl330 3880000.adma: 	DBUFF-4x8bytes Num_Chans-6 Num_Peri-16 Num_Events-6
[    5.819200] dma-pl330 3880000.adma: PM domain MAU will not be powered off
[   64.529228] random: crng init done

and there's failures earlier to instantiate the display.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloqg3YACgkQJNaLcl1U
h9AICQf+MfUWSJeOo7PVJt3b6gU9FEwduxFkCSplJmPFOb3hKtAPGPvqty0NE5Hw
15OGV3BmRe8xaxSpFp6e3HiCJFQR1WAvlLEX+RQVzU0LpUATHMZVGFeljddPoNLl
eOwdgUfCwJIP/a8hCbFywU+QbBs1Af+tnF1Wg+LDu8qWmPAbmKQgm7sq7IhonAz4
5vhpzvEnh/Wh0MrCrjrlwmEBa63tGlltJec2zrZMseHaN6MPiQ7mgmGHjg+I566O
A1cDvyXgjumD23/5/VttPVXiN8fUDUU3LWQjYsEvCHoebRk0hM96HSmcO9z0iquS
cYDbNG9geOlmbYxHrJ5nio7OVRtNYQ==
=KiVf
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
