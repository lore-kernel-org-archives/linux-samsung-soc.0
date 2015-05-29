From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v9 16/18] drm/exynos: split exynos_crtc->dpms in enable()
 and disable()
Date: Fri, 29 May 2015 15:23:00 +0900
Message-ID: <556805C4.3040706@samsung.com>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
 <1432849376-12828-17-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60492 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755382AbbE2GW6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 02:22:58 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP301XI7LPYNF60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 May 2015 15:22:46 +0900 (KST)
In-reply-to: <1432849376-12828-17-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 05/29/2015 06:42 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> To follow more closely the new atomic API we split the dpms()
> helper into the enable() and disable() helper to get exactly the
> same semantics.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 31 +++++------------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c   |  8 ++---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  6 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 31 +++++------------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 55 ++++++++++++------------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 32 ++++++-----------
>  6 files changed, 56 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 6714e5b..0008658 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -603,8 +603,9 @@ static void decon_init(struct decon_context *ctx)
>  		writel(VIDCON1_VCLK_HOLD, ctx->regs + VIDCON1(0));
>  }
>  
> -static int decon_poweron(struct decon_context *ctx)
> +static int decon_enable(struct exynos_drm_crtc *crtc)
>  {
> +	struct decon_context *ctx = crtc->ctx;
>  	int ret;
>  
>  	if (!ctx->suspended)
> @@ -668,8 +669,10 @@ pclk_err:
>  	return ret;
>  }
>  
> -static int decon_poweroff(struct decon_context *ctx)
> +static int decon_disable(struct exynos_drm_crtc *crtc)
>  {
> +	struct decon_context *ctx = crtc->ctx;
> +
>  	if (ctx->suspended)
>  		return 0;
>  
> @@ -691,27 +694,9 @@ static int decon_poweroff(struct decon_context *ctx)
>  	return 0;
>  }
>  
> -static void decon_dpms(struct exynos_drm_crtc *crtc, int mode)
> -{
> -	DRM_DEBUG_KMS("%s, %d\n", __FILE__, mode);
> -
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		decon_poweron(crtc->ctx);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		decon_poweroff(crtc->ctx);
> -		break;
> -	default:
> -		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
> -		break;
> -	}
> -}
> -
>  static const struct exynos_drm_crtc_ops decon_crtc_ops = {
> -	.dpms = decon_dpms,
> +	.enable = decon_enable,
> +	.disable = decon_disable,
>  	.mode_fixup = decon_mode_fixup,
>  	.commit = decon_commit,
>  	.enable_vblank = decon_enable_vblank,
> @@ -796,7 +781,7 @@ static void decon_unbind(struct device *dev, struct device *master,
>  {
>  	struct decon_context *ctx = dev_get_drvdata(dev);
>  
> -	decon_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
> +	decon_disable(ctx->crtc);
>  
>  	if (ctx->display)
>  		exynos_dpi_remove(ctx->display);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index b7c6d51..644b4b7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -29,8 +29,8 @@ static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
>  	if (exynos_crtc->enabled)
>  		return;
>  
> -	if (exynos_crtc->ops->dpms)
> -		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_ON);
> +	if (exynos_crtc->ops->enable)
> +		exynos_crtc->ops->enable(exynos_crtc);
>  
>  	exynos_crtc->enabled = true;
>  
> @@ -51,8 +51,8 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
>  
>  	drm_crtc_vblank_off(crtc);
>  
> -	if (exynos_crtc->ops->dpms)
> -		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
> +	if (exynos_crtc->ops->disable)
> +		exynos_crtc->ops->disable(exynos_crtc);
>  
>  	exynos_crtc->enabled = false;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 86d6894..a3053a2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -157,7 +157,8 @@ struct exynos_drm_display {
>  /*
>   * Exynos drm crtc ops
>   *
> - * @dpms: control device power.
> + * @enable: enable the device
> + * @disable: disable the device
>   * @mode_fixup: fix mode data before applying it
>   * @commit: set current hw specific display mode to hw.
>   * @enable_vblank: specific driver callback for enabling vblank interrupt.
> @@ -175,7 +176,8 @@ struct exynos_drm_display {
>   */
>  struct exynos_drm_crtc;
>  struct exynos_drm_crtc_ops {
> -	void (*dpms)(struct exynos_drm_crtc *crtc, int mode);
> +	int (*enable)(struct exynos_drm_crtc *crtc);
> +	int (*disable)(struct exynos_drm_crtc *crtc);

Need return value for .enable and .disable? It's better to use void
because there is no any care about the result. It's possible to not
return .enable functions of fimd and decon driver.

Anyway, more patches including 17/18 can be difficult to merge atomic
patchset. IMHO i think cleanup patches like this would be posted after
atomic patches merged.
