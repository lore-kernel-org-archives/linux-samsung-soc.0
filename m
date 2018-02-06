From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/4] drm/exynos: fix comparison to bitshift when dealing
 with a mask
Date: Tue, 06 Feb 2018 09:06:21 +0900
Message-ID: <5A78F17D.1010400@samsung.com>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
        <CGME20180205201026epcas5p214598aead48b3d8118b8f1fe114da8ec@epcas5p2.samsung.com>
        <20180205201002.23621-3-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-reply-to: <20180205201002.23621-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



2018년 02월 06일 05:09에 Wolfram Sang 이(가) 쓴 글:
> Due to a typo, the mask was destroyed by a comparison instead of a bit
> shift.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Only build tested. To be applied individually per subsystem.
> 
>  drivers/gpu/drm/exynos/regs-fimc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/regs-fimc.h b/drivers/gpu/drm/exynos/regs-fimc.h
> index 30496134a3d072..d7cbe53c4c01f4 100644
> --- a/drivers/gpu/drm/exynos/regs-fimc.h
> +++ b/drivers/gpu/drm/exynos/regs-fimc.h
> @@ -569,7 +569,7 @@
>  #define EXYNOS_CIIMGEFF_FIN_EMBOSSING		(4 << 26)
>  #define EXYNOS_CIIMGEFF_FIN_SILHOUETTE		(5 << 26)
>  #define EXYNOS_CIIMGEFF_FIN_MASK			(7 << 26)
> -#define EXYNOS_CIIMGEFF_PAT_CBCR_MASK		((0xff < 13) | (0xff < 0))
> +#define EXYNOS_CIIMGEFF_PAT_CBCR_MASK		((0xff << 13) | (0xff << 0))
>  

Oops. Picked it up.

Thanks,
Inki Dae

>  /* Real input DMA size register */
>  #define EXYNOS_CIREAL_ISIZE_AUTOLOAD_ENABLE	(1 << 31)
> 
