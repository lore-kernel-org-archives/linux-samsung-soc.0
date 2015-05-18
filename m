From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH] drm/exynos: dp: Lower level of EDID read success message
Date: Tue, 19 May 2015 08:30:14 +0900
Message-ID: <000101d091c2$9c1d1920$d4574b60$@com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36310 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754942AbbERXmb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 19:42:31 -0400
Content-Language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'Inki Dae' <inki.dae@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'David Airlie' <airlied@linux.ie>, 'Kukjin Kim' <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

> Don't pollute the dmesg with EDID read success message as an error.
> Printing as debug should be fine.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Right, dev_err() is not right.
Thank you for sending the patch.

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 441ef06b8894..30feb7d06624 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -195,7 +195,7 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
>  		}
>  	}
>  
> -	dev_err(dp->dev, "EDID Read success!\n");
> +	dev_dbg(dp->dev, "EDID Read success!\n");
>  	return 0;
>  }
>  
> -- 
> 1.9.1
