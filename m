From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/9] drm/panel: Add driver for exynos_dp based panels
Date: Tue, 22 Apr 2014 10:26:07 +0200
Message-ID: <20140422082606.GB17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:51752 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280AbaDVI10 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 04:27:26 -0400
Received: by mail-ee0-f45.google.com with SMTP id d17so4308405eek.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 01:27:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:12AM +0530, Ajay Kumar wrote:
> This patch adds a simple driver to handle all the LCD and LED
> powerup/down routines needed to support eDP/eDP-LVDS panels
> supported on exynos boards.
>=20
> The LCD and LED units are usually powered up via regulators,
> and almost on all boards, we will have a BL_EN pin to enable/
> disable the backlight. Sometimes, we can have LCD_EN switches
> as well. The routines in this driver can be used to control
> panel power sequence on such boards.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	Added routine for post_disable, removed few unwanted headers.
> 	Refactored a lot of code.
>=20
>  .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++++
>  drivers/gpu/drm/panel/Kconfig                      |    9 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 ++++++++++++++=
++++++
>  4 files changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-pan=
el.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c

What this patch does is in no way Exynos specific. It is also not eDP
specific.

This conflates panel drivers with board drivers in a strange way. Panel
drivers should be for *panels*, not for a given SoC or specific outputs
on that SoC.

Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVieeAAoJEN0jrNd/PrOhTV4QAIFbB/KuE6+3pVxT/0iobDfp
/JkqbkManiNDrOdYM4Awl0upK9zi55Z3L1uffiFUNnA0ejZfKyu9UCmvk0aJUf3V
tZq0uYXoTrTnNKZMX3e9l8GdK16kSE45nKcUZrToCMvdE3+pdCpfJVRD6/HG+kSI
MJIrOnV1YjwPjbfFx158MuAByQi7CRoK9jd7CDTpjhylh/ORepxZVedVIeRsB51L
CMb3PGj4efiTUg3J3H+dNMTSJas3nG0pdE4iuuJoKeLVXi90Z5qF/V8sokazxvxM
ofLsSw9oh/AgigZ7YAM+7sOIWUj+MN6TucOH4STmmBdc4Ro/J+bPOjzY+lVQGH7J
S/lOuaP4+TcY/rFnMCvcsmVyxqpF7DDbHbfIAMYGi9Gdls5FKWUR3NFXIMCX5NTu
Wsc9wBLnwl8TSgDKR3KbsCy3qXiRdQdhlrwihysKHHOaiwOm0daPP6dWV8Wc0vJ5
OmfO41q9JhXqWp/NMmGGFh9Z4Lrpu2RpH+XJ8dXRWcfXzCXkOP1Y0IjroIUZaIvT
Yj94vpKBDkwuhsv9PcTruYGyOgYOT3x/FPytLdDxxdmLTEpk8AhPDJCkpFTAfoHJ
d0axV3v+cdVMAP4O6AjU4SpVz3By2EQmVLxb25brZz3tdbQvTt/beNjNi2Q2stnW
MeQkeL9oleU2BJivSLsT
=9sGu
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
