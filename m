From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: Avoid NULL pointer dereference in resume if
 bind failed
Date: Wed, 30 Sep 2015 20:26:37 +0900
Message-ID: <560BC6ED.3090205@samsung.com>
References: <1443370306-15429-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54391 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932661AbbI3L0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 07:26:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NVH02U4TMGD1UB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Sep 2015 20:26:37 +0900 (KST)
In-reply-to: <1443370306-15429-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, jingoohan1@gmail.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On 2015=EB=85=84 09=EC=9B=94 28=EC=9D=BC 01:11, Charles Keepax wrote:
> If binding failed calling exynos_dp_enable in exynos_dp_resume will
> result in several NULL pointer dereferences. It is much better to
> simply skip suspend/resume handling if bind has failed, do so by
> checking if a drm_dev exists.

Thanks for your patch. However, the pm interfaces of KMS drivers aren't
required because these are controlled by top of Exynos drm driver and
connector dpms. So I posted a patch that it removes pm interfaces of dp
driver.

Thanks,
Inki Dae

>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index d66ade0..48baf07 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1388,6 +1388,9 @@ static int exynos_dp_suspend(struct device *dev=
)
>  {
>  	struct exynos_dp_device *dp =3D dev_get_drvdata(dev);
> =20
> +	if (!dp->drm_dev)
> +		return 0;
> +
>  	exynos_dp_disable(&dp->encoder);
>  	return 0;
>  }
> @@ -1396,6 +1399,9 @@ static int exynos_dp_resume(struct device *dev)
>  {
>  	struct exynos_dp_device *dp =3D dev_get_drvdata(dev);
> =20
> +	if (!dp->drm_dev)
> +		return 0;
> +
>  	exynos_dp_enable(&dp->encoder);
>  	return 0;
>  }
>=20
