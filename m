From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/3] drm/exynos: fix typos in hdmi and mixer
Date: Tue, 07 Apr 2015 16:03:59 +0900
Message-ID: <5523815F.2030102@samsung.com>
References: <1428362092-29826-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1428362092-29826-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21781 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929AbbDGHEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 03:04:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMF00ICICYCVK60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Apr 2015 16:03:48 +0900 (KST)
In-reply-to: <1428362092-29826-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo@padovan.org, inki.dae@samsung.com

Hi,

On 04/07/2015 08:14 AM, Tobias Jakobi wrote:
> Use the correct spelling for 'progressive'.
> 
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c  | 2 +-
>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
>  drivers/gpu/drm/exynos/regs-mixer.h   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 3511fcc..20e2ce7 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2022,7 +2022,7 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
>  	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%s\n",
>  		m->hdisplay, m->vdisplay,
>  		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
> -		"INTERLACED" : "PROGERESSIVE");
> +		"INTERLACED" : "PROGRESSIVE");
>  
>  	/* preserve mode information for later use. */
>  	drm_mode_copy(&hdata->current_mode, mode);
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index aa5b6e1..5ab0e32 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -267,7 +267,7 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
>  
>  	/* choosing between interlace and progressive mode */
>  	val = (ctx->interlace ? MXR_CFG_SCAN_INTERLACE :
> -				MXR_CFG_SCAN_PROGRASSIVE);
> +				MXR_CFG_SCAN_PROGRESSIVE);
>  
>  	if (ctx->mxr_ver != MXR_VER_128_0_0_184) {
>  		/* choosing between proper HD and SD mode */
> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
> index 5f32e1a..ac60260 100644
> --- a/drivers/gpu/drm/exynos/regs-mixer.h
> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
> @@ -101,7 +101,7 @@
>  #define MXR_CFG_GRP0_ENABLE		(1 << 4)
>  #define MXR_CFG_VP_ENABLE		(1 << 3)
>  #define MXR_CFG_SCAN_INTERLACE		(0 << 2)
> -#define MXR_CFG_SCAN_PROGRASSIVE	(1 << 2)
> +#define MXR_CFG_SCAN_PROGRESSIVE	(1 << 2)
>  #define MXR_CFG_SCAN_NTSC		(0 << 1)
>  #define MXR_CFG_SCAN_PAL		(1 << 1)
>  #define MXR_CFG_SCAN_SD			(0 << 0)
> 

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
