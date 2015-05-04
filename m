From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: mixer: Constify platform_device_id
Date: Mon, 04 May 2015 16:47:24 +0900
Message-ID: <5547240C.3090107@samsung.com>
References: <1430495796-32016-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57033 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752118AbbEDHr1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 03:47:27 -0400
In-reply-to: <1430495796-32016-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015=EB=85=84 05=EC=9B=94 02=EC=9D=BC 00:56, Krzysztof Kozlowski wro=
te:
> The platform_device_id is not modified by the driver and core uses it=
 as
> const.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index fbec750574e6..512549a35e96 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1156,7 +1156,7 @@ static struct mixer_drv_data exynos4210_mxr_drv=
_data =3D {
>  	.has_sclk =3D 1,
>  };
> =20
> -static struct platform_device_id mixer_driver_types[] =3D {
> +static const struct platform_device_id mixer_driver_types[] =3D {
>  	{
>  		.name		=3D "s5p-mixer",
>  		.driver_data	=3D (unsigned long)&exynos4210_mxr_drv_data,
>=20
