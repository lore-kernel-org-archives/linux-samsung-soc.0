From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 9/9] drm/exynos: Add ps8622 lvds bridge discovery to
 DP driver
Date: Tue, 22 Apr 2014 11:27:44 +0200
Message-ID: <20140422092743.GB22133@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-10-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:37748 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755749AbaDVJ3C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 05:29:02 -0400
Received: by mail-ee0-f45.google.com with SMTP id d17so4316129eek.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 02:29:01 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1398119958-32005-10-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:18AM +0530, Ajay Kumar wrote:
> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>=20
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	Pushing V1 for this as V2 because this patch holds good in this series.
>=20
>  drivers/gpu/drm/exynos/exynos_dp_core.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
> index 4853f31..0006412 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_panel.h>
>  #include <drm/bridge/ptn3460.h>
> +#include <drm/bridge/ps8622.h>
> =20
>  #include "exynos_drm_drv.h"
>  #include "exynos_dp_core.h"
> @@ -999,7 +1000,15 @@ static int exynos_drm_attach_lcd_bridge(struct drm_=
device *dev,
>  				panel);
>  		if (!ret)
>  			return 1;
> +	} else if (find_bridge("parade,ps8625", &bridge)) {

So this is where the inspiration for the of_find_compatible_node() in
the earlier patch came from.

> +		ret =3D ps8622_init(dev, encoder, bridge.client, bridge.node,
> +				panel);

Long-term I don't think this is going to scale very well. In my opinion
it would be much more useful to have the bridge driver initialize what
it can and then have the DRM driver call a generic initialization
function to bind it to the DRM device or encoder. Otherwise we have to
keep knowledge about the type of bridge in each driver that uses it,
whereas the goal (I think) would be to create a proper abstraction so
that the DRM driver doesn't have to know that kind of detail.

Thierry

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVjYOAAoJEN0jrNd/PrOhAKAQAJdhInyUUyeRgDP8YyfEm7DJ
Adcuqz8gFPWlIPxsjfKEKJ8IqVYl218r758+QOByexn6PEqmX+3skGqYjAj8T/uX
zOKZ54vn/RGLLpv695s0X7fGdEf5LrhNpKpNITe1uWfoDfx9b5XnBI3pkFTJ9VaF
GEWZzezxJ24Zny5io2ngZhllXsw7A+k00RwsM6o+2ZBI2LpySqv6JuCrwi0F9SuW
Dzv+eMx1IcijJMDoUB89HbWcG8h3+/SYJmf8qrdJZl8MJH3gp/dhMrWpCIOE044H
UlcTCMgdoKRTaav78l9ur3TGNbu5b1iwBF+BYUNz4yHuC3lXQ/8oqwmJM46XaiYi
4KuyOdYjgHwvVp5cv7XeeRzeTpd3o68uTgpEdC3owQ6qgcd8Jq/aAxMmcgItLNu7
D6is/NmHPTM2rTcsQ7iOrXXzZNYQiSM21uKp8oUqa3nXUgMclrGPR+f8fiqwLgd1
VR068IezXKe84Ioo966alergtrz05K9UDkc43zZuQ9GOKfXCUTz09KpoAxA7oP57
Q2hNdHWsCtirO7J8yjAiO4KO/l6iUKj+L94iHxDAwC25v8TLXG92XP+mVBfkaZR5
Z9JdgoOpjkSPUuAfDgyCKOEuQqkgy9ZgPB+R2Y65D9fItujQcgyGWagLDkR1vFQT
u/VjFj5rtGWTylMlKrh9
=E6kh
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
