From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: EXYNOS will support only DT from v3.10
Date: Mon, 25 Mar 2013 13:09:52 +0000
Message-ID: <20130325130951.GQ18316@opensource.wolfsonmicro.com>
References: <17a501ce2948$17037610$450a6230$%kim@samsung.com>
 <20130325120256.GM18316@opensource.wolfsonmicro.com>
 <201303251237.38782.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tcb1KvpfnM4LxW2s"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34814 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757277Ab3CYNKE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 09:10:04 -0400
Content-Disposition: inline
In-Reply-To: <201303251237.38782.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas P Abraham' <thomas.ab@samsung.com>, heiko@sntech.de, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>


--Tcb1KvpfnM4LxW2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2013 at 12:37:38PM +0000, Arnd Bergmann wrote:

> We don't have any DT support for S3C and S5P upstream yet, so I would
> certainly agree on that. I think we should plan at least one release of
> supporting both simultaneously in order to find bugs with the DT
> implementation before we can consider removing ATAGS support for any
> major platform.

We really ought to look into fixing the bootloader protocol to allow
ATAGS and DT simultaneously BTW, the current situation is a pain
especially if you need uImage.

> However, I also really want to see all ARMv6 and ARMv7 platforms
> get moved over to use ARCH_MULTIPLATFORM, and it probably makes sense
> to eventually move over all platforms that support ARCH_MULTIPLATFORM
> to be DT-only. I hope we do both for EXYNOS in 3.10, and then do at
> least MULTIPLATFORM support for S5P* in 3.11, possibly also for S3C64xx,
> in order to convert all ARMv6 and ARMv7 platforms to MULTIPLATFORM.

The pluggable modules on Cragganmore are going to be a problem for that,
I have some ideas for a subsystem to handle the remapping generically
but not had the time to actually do it yet.  The stuff the BeagleBone
guys were pushing wasn't suitable as it seemed like it was basically
just a wrapper around DT which excludes non-DT platofrms.

--Tcb1KvpfnM4LxW2s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUEyYAAoJELSic+t+oim9c6QQAJZmu35aO7Ik3X3DMS7yRV9I
VHnMCvnXEGgAGt322DBfd7RcnW946GfTjoc8CerrN+3cbmH8vMmLO+vsIx5bHVj/
eQ6SM90aC17m48rdpOcce0ycWI0ZC7stmnjcMX96ZM5WfoxJ6L8bE3PFMLfGkzgJ
G1iOuOgyK4veaIS/xUWaCYzrkI/XThmGetBpgVNsGX6zcRxDFF1VWn8VKIJWCKsO
Q5dCHG0v/Qe241mcxuf0pkH2mirV/gruD9ou8yLUDIf1l+4ci0OaiDroxRQXTkag
9bWScnVL8DpyEajtTZQLitxwrIakLqO4meG45pmIEMjSL/jBhAWT2ZCvsybv5ae3
/N4jQmlGUomVlIjX8a9VKqGY1dUNSPRKBCU2fPh0jBlxkHWfS09Tv6YUoQQW4Yj5
Pe/kWxRs558jiTDJGo6JZ8Mk2alV8cmxukFTSvcQ95/P8TGPu9ZhBO6DkJFyUNXe
AsEvorSqi5TOqLrSV1HMLurFQisHJf3/R+svZOB0Qhb0cqykiFJ5o0NRgwWAO2yg
tG3JiWAqVPdYAtRdSev5jHsLBLU1OEWBDJDTGRZcDu2qJK6Cqt5YoMHXW3AzV6Rj
VJJ1BPBz079J8rh3vVedg7fk3QvXQx38ue/ULpbUUsiewlwIvLDcXkTmoHv6jnbK
E6Ig5Q+uIgud9t3a38xd
=CRaX
-----END PGP SIGNATURE-----

--Tcb1KvpfnM4LxW2s--
