From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 5/8] drm/exynos: dp: Modify driver to support drm_panel
Date: Wed, 30 Jul 2014 12:58:58 +0200
Message-ID: <20140730105857.GH29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:46382 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934AbaG3K7D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 06:59:03 -0400
Content-Disposition: inline
In-Reply-To: <1406316130-4744-6-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:07AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
[...]
> @@ -887,6 +885,12 @@ static void exynos_dp_commit(struct exynos_drm_displ=
ay *display)
>  	struct exynos_dp_device *dp =3D display->ctx;
>  	int ret;
> =20
> +	/* Keep backlight disabled while we configure video */
> +	if (dp->panel) {
> +		if (drm_panel_disable(dp->panel))
> +			DRM_ERROR("failed to disable panel backlight\n");
> +	}

drm_panel_disable() already gracefully handles the dp->panel =3D=3D NULL
case, so no need to check for it explicitly. But perhaps you do that
only because panel support is optional and you want to avoid the
error message if it isn't set up. In that case it's probably fine to
leave this as-is.

But you should change the comment and error message, since you don't
know what exactly drm_panel_disable() does.

And it might be useful to print the error code while at it, it might
help save some debugging time in the future.

The same comments apply to most of the remainder of the file, but it
looks good to me otherwise.

Thierry

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2M/xAAoJEN0jrNd/PrOh11wP/3lu/aFS5bWkrzvzEYIfurbh
GZM0vMdII8koRgd/POwwvL9+Av3GQv4xWIq+VhTUzDkgp2DCRNxUGoITvrdYLqbt
Y0He2VrK5HNUC8eZIlZQSTQMAFLTWnpLGuVwFzM7a5IsVrlXKMhAj18rX6zhOznj
eSEwuG4ibaI2O/oyn0VUBEAGCW083axsc0Q3bpbdd0RmZMjvMNiTjbI0dRTcRU39
lc7KnUmQoI8zWnlwYgVsZWKdFbVQ50AVTcjLLaz25DvmIxTJzuBq6+mhzk8k+4TC
yUHpQ6QQ6zpDevBhNwXGDzYzLdwepUS11mnZklYHnQALdobxZ5cAxv8Q8l1nBA5Q
kmibcGG0DrOOYETcGQT9rqr2sroSO86INqtrwYQ5+Olo6lvMpgP1RdfStfobOIkR
CNCMbNHhTbax5iI33ygYhh6Tz6uZvZM5qkIYTCZKyFB3lAHj5kSSnfuke6tQs3nE
3BEDySUqjv8QwX1D10HHPMzgXrYw2Vx3FqFUkGKpVZWDNGYSXxnuXdN2kYpoYKc6
XayDA9xGEvbY2aTH/cf0FIpR6Qv1kkEwswMTFPSRJluLO9s4/U24QU6KdJBbNLaS
EQnsup0cNt7a2fUXyUxbAibPPPRAxh7KdRhzZ6GDCweHM2KKtsTSo6Y+z5NIp1f/
FkrgVPmmuzFwTJZOotZb
=/Yv5
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
