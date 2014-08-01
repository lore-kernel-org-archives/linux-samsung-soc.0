From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/15] drm/panel: Add prepare and unprepare routines
Date: Fri, 1 Aug 2014 12:59:21 +0200
Message-ID: <20140801105919.GI21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:40182 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515AbaHAK70 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 06:59:26 -0400
Content-Disposition: inline
In-Reply-To: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com


--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 11:11:59PM +0530, Ajay Kumar wrote:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>=20
> This is originally a part of the bridge chip series:
> http://www.spinics.net/lists/linux-samsung-soc/msg34826.html
>=20
> But, since we can handle panel and bridge chips seperately,
> I thought of seperating them.
>=20
> This patchset basically extends the drm panel framework
> to accomodate wider range of panels with strict timing
> sequence for enabling panel power, backlight enable, etc.
>=20
> I have tested this patchset on exynos5800-peach-pi board.
>=20
> Thierry:
> 	As discussed, I have seperated patches such that they
> 	won't break the compilation in between. Also, I have
> 	incorporated all the comments given by you for panel patches.
> 	I assume you have already taken [PATCH 01/15] and hence
> 	it can be dropped from this patchset.
>=20
> Ajay Kumar (15):
>   [PATCH 01/15] drm/panel: add prepare and unprepare routines
>   [PATCH 02/15] drm/panel: Add get_modes helper
>   [PATCH 03/15] drm/panel: ld9040: Add dummy prepare and unprepare routin=
es
>   [PATCH 04/15] drm/panel: s6e8aa0: Add dummy prepare and unprepare routi=
nes
>   [PATCH 05/15] drm/panel: simple: Add dummy prepare and unprepare routin=
es
>   [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and unprep=
are routines
>   [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and unprep=
are routines
>   [PATCH 08/15] drm/tegra: Add support for panel prepare and unprepare ro=
utines
>   [PATCH 09/15] drm/panel: ld9040: Add proper definition for prepare and =
unprepare
>   [PATCH 10/15] drm/panel: s6e8aa0: Add proper definition for prepare and=
 unprepare
>   [PATCH 11/15] drm/panel: simple: Add proper definition for prepare and =
unprepare
>   [PATCH 12/15] drm/panel: simple: Support usage of delays in panel funct=
ions
>   [PATCH 13/15] drm/panel: simple: Add support for auo_b133htn01 panel
>   [PATCH 14/15] drm/exynos: Move DP setup into commit()
>   [PATCH 15/15] drm/exynos: dp: Modify driver to support drm_panel

I already had patches 01/15 and 02/15, but I've applied the rest of the
series. I went out on a limb and applied Inki's Acked-by to all Exynos-
related patches, assuming that was the intention.

Thierry

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT23MHAAoJEN0jrNd/PrOhYaEQAKPYVDCX5iT9bppXkRWwpHcn
sKjk6FkTAy6lFtTPx4D2jkcEZSkzDM6IljQU0PB4PyyoGcYOgJmcyC+DVhf8sxwK
+Mv6oYKl9xEfSM3Z5bMIHzV9jx81JivoID0G938nrZomoCq3Mb/dXueXgUA44u7P
lmQAKVQ+tftJHduB/fP1a5Dm6HqMpEA6pslQ4vCh9MzAv6XToALOpJCi8F3n3r+f
reWHPEJ8SQbrw1uK45q+PEhCVVv8SsMZ5f2hdMshEJJy+5VJ24CXxIdlPbss0Zdt
VdR8lRCY8UtIcFSeDiSq9OmZVRl4GGiAR7y6CJaTuToAlw/tp+TMHE288HdYvGAZ
RrBcJwWzjWLJqYvaJ920TUnpV6zB+aGgP12INKZBGN4DJuPrfPfYhr4h4PqQqrsY
pNAAjs3jpQADcoTA0JfSySPz96oL9ZqFPOWnT2vqP/uvfOUWsgRiwL9AsiXbsBI6
Pn4G7tqbON2xik+5H8FKF/pnHcUStwsRiRr6C2Y3gRhecp9jJVR+QhD6L8lPcneu
sSxUOjexSNHSapkxB0XeVrjAHXPCT65daqeTt4HLAlUcRH7q4wjr7Ac8x+pPsOIr
bkrQvFRJ6+gGV+YFMwemfQBSUSZbXGi+Y7ru2dY07du0TTtjyYdCWc2KSJ9N+1RU
DpGMgJkch1snpH/rHY7L
=0jEA
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
