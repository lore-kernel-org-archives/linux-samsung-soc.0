From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Tue, 29 Jul 2014 13:36:46 +0200
Message-ID: <20140729113645.GB21732@ulmo.nvidia.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:64011 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753148AbaG2Lgy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 07:36:54 -0400
Content-Disposition: inline
In-Reply-To: <53D783CC.2080108@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wrote:
> Hi Ajay,
>=20
> Am 28.07.2014 08:13, schrieb Ajay kumar:
> > On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> >> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> >>> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> >>>
> >>> I have tested this after adding few DT changes for exynos5250-snow,
> >>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> >>
> >> I'm trying to test this with a modified exynos5250-spring DT based off
> >> kgene's for-next branch due to DT, and I run into the following:
> >>
> >>   CC      drivers/gpu/drm/bridge/ptn3460.o
> >> drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_post_en=
coder_init=E2=80=99:
> >> drivers/gpu/drm/bridge/ptn3460.c:275:2: error: implicit declaration of
> >> function =E2=80=98drm_connector_register=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
> >>   drm_connector_register(&ptn_bridge->connector);
> >>   ^
> > Hope this might help:
> > http://www.spinics.net/lists/dri-devel/msg60578.html
>=20
> That fixed my build, thanks.
>=20
> Unfortunately the most I got on Spring with attached DT was a blank
> screen with a white horizontal line in the middle.
>=20
> Do I need to specify a specific panel model for Spring?
>=20
> For testing I re-applied your iommu patches (which btw fail now for 5420
> due to disp_pd) but didn't know what to do about your panel-lvds
> regulator patch now that it's gone.
>=20
> If I don't apply this series, then commenting out the dp-controller node
> gets me a working display with simplefb as before.
>=20
> Regards,
> Andreas
>=20
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
> Date: Sun, 27 Jul 2014 21:58:06 +0200
> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> [AF: Redone for v6]
> Signed-off-by: Andreas F??rber <afaerber@suse.de>
> ---
>  arch/arm/boot/dts/exynos5250-spring.dts | 32 +++++++++++++++++++++++++++=
++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/=
exynos5250-spring.dts
> index 687dfab86bc8..517b1ff2bfdf 100644
> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -64,10 +64,14 @@
>  		vdd_pll-supply =3D <&s5m_ldo8_reg>;
>  	};
> =20
> +	panel: panel {
> +		compatible =3D "simple-panel";
> +	};

You can't do this. "simple-panel" isn't a valid panel model. It should
probably be removed from the platform_of_match table in the driver.

Thierry

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT14dNAAoJEN0jrNd/PrOhepoP/02Wtsv/fDLO0k5lj+qdN7sd
ECvLGkZ+6pqhH+5lH9efnDwpcxPZ4JY9HOK0LSY3eIgCBeFcbrN9tos889API9lx
eSS2yQIcCDeJunLg/JQhco6/vKK+rFyYP5lXE5UEnZWtBu5WRSGCp60eEYhxRnxG
DCtDQPwPwtFrYFCd1w8vIOJdmfHFoeyfVV0CvciQ+oekiOYb/9y8obSBb2UhqX4R
K+lnlOxk5JC1NF8jBo6xH0JpIE8GWuYa9FazelS4GgfDsFJvBpmdcGPEGvgIk6N4
wdK8O6IQFIBFcpoBNRRU85OpkQRQ2All0nNhALT+TtQlnMJMyw9fpbYXawvvzfZF
hrnVTawfDGNpdvb1uEl4qWP4f811zP3ulDVs7t8tolWd/qfTIJsGsYnR0w+4KtX/
IlbdDhTn4pmmEdZDEU5IWZ9bZMELta0rU9enusNBS2xe6llmiQCptGC50W21oqq4
KGbINHcx9CJUYu7DVM67T2VMj+2CZAQSpHCH1HARol3sCJ1qRtt698QQQCZtYYLw
0QKZpKK6eGtmECn/hDUZ3u2jkySjAlYmVYqMqCuVZUyLd+vWNKgMQeA0OcLktYmg
NuV/Bt2fc3XgKX+6bXprXFIKLzaDyiern72sjv3KftineiJGSYIK/m2YeHWfJ3qk
1aCkZPxjM0nclF22NyV5
=GgRv
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
