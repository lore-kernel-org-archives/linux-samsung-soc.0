From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 4/4] drm/exynos: remove checks for zpos == -1 on primary
 planes
Date: Fri, 06 Feb 2015 13:40:43 +0900
Message-ID: <54D445CB.7010809@samsung.com>
References: <1423159199-16394-1-git-send-email-gustavo@padovan.org>
 <1423159199-16394-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27797 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753617AbbBFEkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 23:40:36 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJC001F22BMEI00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Feb 2015 13:40:34 +0900 (KST)
In-reply-to: <1423159199-16394-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 02/06/2015 02:59 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> The primary plane default zpos is now 0, so remove checks for zpos ==
> -1. We don't need to set win to 0 anymore it is already zero.
> 

Could you also remove DEFAULT_ZPOS define? And zpos and win should be
unsigned from now.

Thanks.

> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 6 ------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 6 ------
>  drivers/gpu/drm/exynos/exynos_mixer.c    | 6 ++----
>  3 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 00df40d..7637780 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -612,9 +612,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int win)
>  	if (ctx->suspended)
>  		return;
>  
> -	if (win == DEFAULT_ZPOS)
> -		win = ctx->default_win;
> -
>  	if (win < 0 || win >= WINDOWS_NR)
>  		return;
>  
> @@ -735,9 +732,6 @@ static void fimd_win_disable(struct exynos_drm_crtc *crtc, int win)
>  	struct fimd_context *ctx = crtc->ctx;
>  	struct exynos_drm_plane *plane;
>  
> -	if (win == DEFAULT_ZPOS)
> -		win = ctx->default_win;
> -
>  	if (win < 0 || win >= WINDOWS_NR)
>  		return;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index 3c0dcb4..e730ef6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -125,9 +125,6 @@ static void vidi_win_commit(struct exynos_drm_crtc *crtc, int win)
>  	if (ctx->suspended)
>  		return;
>  
> -	if (win == DEFAULT_ZPOS)
> -		win = ctx->default_win;
> -
>  	if (win < 0 || win >= WINDOWS_NR)
>  		return;
>  
> @@ -146,9 +143,6 @@ static void vidi_win_disable(struct exynos_drm_crtc *crtc, int win)
>  	struct vidi_context *ctx = crtc->ctx;
>  	struct exynos_drm_plane *plane;
>  
> -	if (win == DEFAULT_ZPOS)
> -		win = ctx->default_win;
> -
>  	if (win < 0 || win >= WINDOWS_NR)
>  		return;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 141d461..b283713 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -892,10 +892,9 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
>  	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
>  }
>  
> -static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
> +static void mixer_win_commit(struct exynos_drm_crtc *crtc, int win)
>  {
>  	struct mixer_context *mixer_ctx = crtc->ctx;
> -	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
>  
>  	DRM_DEBUG_KMS("win: %d\n", win);
>  
> @@ -914,11 +913,10 @@ static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
>  	mixer_ctx->planes[win].enabled = true;
>  }
>  
> -static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
> +static void mixer_win_disable(struct exynos_drm_crtc *crtc, int win)
>  {
>  	struct mixer_context *mixer_ctx = crtc->ctx;
>  	struct mixer_resources *res = &mixer_ctx->mixer_res;
> -	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
>  	unsigned long flags;
>  
>  	DRM_DEBUG_KMS("win: %d\n", win);
> 
