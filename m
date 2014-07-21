From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: g2d: add exynos4212 as a compatible device.
Date: Mon, 21 Jul 2014 12:02:52 +0900
Message-ID: <53CC82DC.4000003@samsung.com>
References: <1405803183-6280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1405803183-6280-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51006 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070AbaGUDCy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Jul 2014 23:02:54 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N910010JKGS1T00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Jul 2014 12:02:52 +0900 (KST)
In-reply-to: <1405803183-6280-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, Alban Browaeys <prahal@yahoo.com>

On 2014=EB=85=84 07=EC=9B=94 20=EC=9D=BC 05:53, Tobias Jakobi wrote:
> From: Alban Browaeys <prahal@yahoo.com>
>=20

Applied.

Thanks,
Inki Dae

> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/dr=
m/exynos/exynos_drm_g2d.c
> index 8001587..5fa1bb6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1544,6 +1544,7 @@ static const struct dev_pm_ops g2d_pm_ops =3D {
> =20
>  static const struct of_device_id exynos_g2d_match[] =3D {
>  	{ .compatible =3D "samsung,exynos5250-g2d" },
> +	{ .compatible =3D "samsung,exynos4212-g2d" },
>  	{},
>  };
> =20
>=20
