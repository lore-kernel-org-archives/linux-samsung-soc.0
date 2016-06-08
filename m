From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: don't use HW trigger for Exynos5420/5422/5800
Date: Thu, 09 Jun 2016 08:09:01 +0900
Message-ID: <5758A58D.7050106@samsung.com>
References: <CGME20160602142058epcas1p4f26bc6ab2acd0012962f90bb2c6c4141@epcas1p4.samsung.com>
 <1464877210-27207-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32821 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423551AbcFHXJE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 19:09:04 -0400
In-reply-to: <1464877210-27207-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Hi Javier,

2016=EB=85=84 06=EC=9B=94 02=EC=9D=BC 23:20=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Commit a6f75aa161c5 ("drm/exynos: fimd: add HW trigger support") adde=
d
> hardware trigger support to the FIMD controller driver. But this brok=
e
> the display in at least the Exynos5800 Peach Pi Chromebook.
>=20
> So until the issue is fixed, avoid using HW trigger for the Exynos542=
0
> based boards and use SW trigger as it was before the mentioned commit=
=2E
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
> Hello Inki,
>=20
> Since commit a6f75aa161c5 landed in v4.7-rc1, I think $SUBJECT should=
 be
> picked to make sure that v4.7 is released with the display working fo=
r
> the Exynos5420 based Chromebooks.
>=20
> We can then figure out what's wrong with the HW trigger support and f=
ix
> it for v4.8.

Agree. And below is a trivial comment.

>=20
> Best regards,
> Javier
>=20
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 1c23a8ff5e83..f10030ff00e6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -170,14 +170,11 @@ static struct fimd_driver_data exynos5420_fimd_=
driver_data =3D {
>  	.lcdblk_vt_shift =3D 24,
>  	.lcdblk_bypass_shift =3D 15,
>  	.lcdblk_mic_bypass_shift =3D 11,
> -	.trg_type =3D I80_HW_TRG,
>  	.has_shadowcon =3D 1,
>  	.has_vidoutcon =3D 1,
>  	.has_vtsel =3D 1,
>  	.has_mic_bypass =3D 1,
>  	.has_dp_clk =3D 1,
> -	.has_hw_trigger =3D 1,
> -	.has_trigger_per_te =3D 1,

We don't need to remove above two lines. It would be enough to remove '=
trg_type =3D I80_HW_TRG', which makes FIMD to be worked with SW trigger=
 in default.

Thanks,
Inki Dae

>  };
> =20
>  struct fimd_context {
>=20
