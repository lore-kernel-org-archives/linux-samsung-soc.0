From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/exynos: Make exynos_drm_init() call late during the
 bootup
Date: Wed, 21 May 2014 17:46:23 +0200
Message-ID: <20140521154622.GO2014@ulmo>
References: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOh8F6DNH/RZBSFD"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:61302 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450AbaEUPsl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:48:41 -0400
Received: by mail-ee0-f53.google.com with SMTP id c13so1714674eek.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 08:48:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com


--hOh8F6DNH/RZBSFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2014 at 05:09:45PM +0530, Naveen Krishna Chatradhi wrote:
> exynos_drm_init() does probing of various drivers like dp_panel,
> hdmi, fimd, mixer, etc in an order and finally binds them together.
>=20
> Some of the drm devices (Eg: dp_panel) try to do regulator_get()
> and enable few supplies during their probe.
> Chances are that, these devices may get probed before the respective
> supply/PMIC is hooked.  In such cases, dp_panel would continue with
> "dummy regulator". Which is not what the system wants.
>=20
> Lets give the core connectivity and regulators modules some time
> to hookup the supplies before Exynos DRM devices comes into picture.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> This change is proposed after
> 1. Discussing with I2C/SPI & DMA subsystem maintainers and Others
>    @ https://lkml.org/lkml/2014/5/9/333
>    Trying to change the I2C, SPI and DMA drivers as subsys_initcall()
>    Which was strictly opposed, as a flaw was found in DRM subsystem.
>=20
> 2. -EPROBE_DEFER won't work well with the current sequency of
>     platform_driver_register()s in exynos_drm_init()

Then this is the problem that you need to fix. If the driver doesn't
handle -EPROBE_DEFER properly then that means the driver is broken. No
amount of initcall ordering can fix this for you.

Thierry

--hOh8F6DNH/RZBSFD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfMpOAAoJEN0jrNd/PrOh62cP/jn11L6lN8e5GmoSTJxltu9D
hi/bvOp8CdlAwJVfxP2gNT/sa0jeLB0eV3SaTeGzq72q2tBZ44EiRP9TJsMnX56c
nHZ2HF6xj9ACWtroLFHU3FbciBbMwxEV2Vv1XgHcJrpUzv2hFlGurEK6eMK/9cWO
aRQC4IzA/JxRXbwCAy0V6guzPrnuilHqNi6PpUoZJVb1F+ZLAKpqU8HVCoI3mwrs
dwqUhbtGkiu04uNHGqRxleex1hQ47LHKkhdeMFKjkejdw8FwSRrD1IG7RjAZmX9m
LIkLINCiB1DLS8rODN1zdf9P/jQ7Nu/VlXZIqoDAz24WRO+NyqRpaS6shhEixEit
ZNnWgYodKt/BFUY6D1JE6GJslTUoTGL8BALgyM2N92VuYvQF+Jd+j/3mtewzi5DV
Dp5W9FLc/t8vIZ/iiTW4dLvVQPOlJ7ydIPikYiSz2GSQq92PjHq4v42jJCYWrrvs
3jJ/y0a8VsH2jh0azzr3BSQEwwzPsD47waW7pzN3uYAF9KfV4QE9xdQBNjoSEAvO
VOBPfMNFd7VYIJ5+mTtAvg2TahnOb+qcI8Enyj30R4oaL5jqtug1yQa+BosCDhrj
2z4OPCoIEw+ux1pj0NWazrwW/G2n3gKRAH0kC4TiUbvO4n0ROJ8yMhPu4qq22Wei
7olmZB4GSaSBrhB2niTn
=lons
-----END PGP SIGNATURE-----

--hOh8F6DNH/RZBSFD--
