From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 6/7] drm/exynos/decon5433: signal vblank only on odd
 fields
Date: Fri, 20 Jan 2017 15:55:40 +0200
Message-ID: <20170120135540.GC31595@intel.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065231eucas1p121d2a987695fdce00e1b2bba445f1818@eucas1p1.samsung.com>
 <1484895145-511-7-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484895145-511-7-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 20, 2017 at 07:52:24AM +0100, Andrzej Hajda wrote:
> In case of interlace mode irq is generated for odd and even fields, but
> vblank should be signaled only for the last emitted field.

I'm pretty sure most drivers signal it for both fields. At least i915
does.

> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 7 +++++++
>  include/video/exynos5433_decon.h              | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 46434ba9..ad8b93a 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -591,6 +591,13 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
>  
>  	if (val) {
>  		writel(val, ctx->addr + DECON_VIDINTCON1);
> +		if (ctx->out_type & IFTYPE_HDMI) {
> +			val = readl(ctx->addr + DECON_VIDOUTCON0);
> +			val &= VIDOUT_INTERLACE_EN_F | VIDOUT_INTERLACE_FIELD_F;
> +			if (val ==
> +			    (VIDOUT_INTERLACE_EN_F | VIDOUT_INTERLACE_FIELD_F))
> +				return IRQ_HANDLED;
> +		}
>  		drm_crtc_handle_vblank(&ctx->crtc->base);
>  	}
>  
> diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
> index b26511a..ef8e2a8 100644
> --- a/include/video/exynos5433_decon.h
> +++ b/include/video/exynos5433_decon.h
> @@ -89,6 +89,7 @@
>  #define VIDCON0_ENVID_F			(1 << 0)
>  
>  /* VIDOUTCON0 */
> +#define VIDOUT_INTERLACE_FIELD_F	(1 << 29)
>  #define VIDOUT_INTERLACE_EN_F		(1 << 28)
>  #define VIDOUT_LCD_ON			(1 << 24)
>  #define VIDOUT_IF_F_MASK		(0x3 << 20)
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel OTC
