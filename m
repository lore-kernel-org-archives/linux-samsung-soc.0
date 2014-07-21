From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Mon, 21 Jul 2014 09:10:29 +0200
Message-ID: <20140721071028.GB8843@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:63775 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbaGUHKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 03:10:33 -0400
Received: by mail-wi0-f178.google.com with SMTP id hi2so3485052wib.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 00:10:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Rahul Sharma <rahul.sharma@samsung.com>


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>=20
> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>=20
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
> index 0ca6256..82e2942 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/bridge/ptn3460.h>
>  #include <drm/bridge/panel_binder.h>
> +#include <drm/bridge/ps8622.h>
> =20
>  #include "exynos_drm_drv.h"
>  #include "exynos_dp_core.h"
> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct exyn=
os_dp_device *dp,
>  	if (find_bridge("nxp,ptn3460", &bridge)) {
>  		bridge_chain =3D ptn3460_init(dp->drm_dev, encoder, bridge.client,
>  								bridge.node);
> +	} else if (find_bridge("parade,ps8622", &bridge) ||
> +				find_bridge("parade,ps8625", &bridge)) {
> +		bridge_chain =3D ps8622_init(dp->drm_dev, encoder, bridge.client,
> +								bridge.node);
>  	}

We really ought to be adding some sort of registry at some point.
Otherwise every driver that wants to use bridges needs to come up with a
similar set of helpers to instantiate them.

Also you're making this driver depend on (now) two bridges, whereas it
really shouldn't matter which exact types it supports. Bridges should be
exposed via a generic interface.

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzLzkAAoJEN0jrNd/PrOhBWgP+wWNuZ9E/jOX+/DLT69LToZl
pxbtYXmNHMq6y5IUOi4wviWphud2EApCStobd1XcHOz9v8Cy+paHMP92buo1GDi4
cArUCB0SgHGx/4ZbLXEgvYfQnsRikoQVdBa1mIIpDOja6nuT1cPILmwBRNyng1rT
gi7kUDB/+VdKZdLs8i/ApCS7lMGslue9Mcr8opkANc9l68NV7cpJTVcqoe3kSL92
pvvps7b2fXlQ1P0FY3vWSF9RYU67+kLAQqwYxxZ7IuNS0acrPR9L5nHgcOkzaZgU
cZMx3gLVB4vH5oGW0kQ+Q5/n31/YsB3ylYseiJt2/lvEqUBzeDGThtIz791TfivT
jt/6JA0Hwohd6WMkRB43jH3oaRUZtK15qEmYxNwGr/V7CgWxP6HY6yOO+OA0Md9o
+zo9bzKtPZPgdhgbDt6Md6AOxIOZ/cNOQ9sZDH1ND8pojoZsbVQL3qYIBRPtZM+Y
7Lj1n/CNnP8EWquH19OgI8pobAHMEGvtb67eX2fAuly3dwO+EWr+993PJiRPly3c
AiPjEqqC3F7rxyZUUlPr/IPCVVCq6WDUeE6gXKOprtF0Y7yn2FIT0pha4/WlNoKw
I3dYq1xWQCQTCSdg3Wy5D+6aU26yOBnr/grSjjhyFfgLzm9zvFtSgDnhLCQNrSsn
2zHuokIiLWM7D39wILsz
=/UpL
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
