From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v6 03/12] drm/exynos: atomic phase 1: add .mode_set_nofb()
 callback
Date: Fri, 22 May 2015 12:46:51 +0900
Message-ID: <555EA6AB.6070701@samsung.com>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
 <1432238571-31621-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14538 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754448AbbEVDqw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 23:46:52 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOQ008DEFU2APE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 12:46:50 +0900 (KST)
In-reply-to: <1432238571-31621-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 05/22/2015 05:02 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> The new atomic infrastructure needs the .mode_set_nofb() callback to
> update CRTC timings before setting any plane.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 60 +++++---------------------------
>  1 file changed, 9 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 61b8cfe..54b74e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -81,59 +81,16 @@ exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
>  	return true;
>  }
>  
> -static int
> -exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
> -			  struct drm_display_mode *adjusted_mode, int x, int y,
> -			  struct drm_framebuffer *old_fb)
> -{
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> -	unsigned int crtc_w;
> -	unsigned int crtc_h;
> -	int ret;
> -
> -	/*
> -	 * copy the mode data adjusted by mode_fixup() into crtc->mode
> -	 * so that hardware can be seet to proper mode.
> -	 */
> -	memcpy(&crtc->mode, adjusted_mode, sizeof(*adjusted_mode));

This can cause any problem because exynos drm drivers use crtc->mode
directly as adjusted_mode. It's necessary to consider using
crtc_state->adjusted_mode in exynos drm drivers.

Please refer a patch of Daniel Stone using hwmode instead of mode but it
cannot use for atomic.

http://lists.freedesktop.org/archives/dri-devel/2015-March/079546.html

> -
> -	ret = exynos_check_plane(crtc->primary, fb);
> -	if (ret < 0)
> -		return ret;
> -
> -	crtc_w = fb->width - x;
> -	crtc_h = fb->height - y;
> -	exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
> -			      crtc_w, crtc_h, x, y, crtc_w, crtc_h);
> -
> -	return 0;
> -}
> -
> -static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
> -					  struct drm_framebuffer *old_fb)
> +static void
> +exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  {
>  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> -	unsigned int crtc_w;
> -	unsigned int crtc_h;
> -	int ret;
>  
> -	/* when framebuffer changing is requested, crtc's dpms should be on */
> -	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
> -		DRM_ERROR("failed framebuffer changing request.\n");
> -		return -EPERM;
> -	}
> -
> -	ret = exynos_check_plane(crtc->primary, fb);
> -	if (ret)
> -		return ret;
> -
> -	crtc_w = fb->width - x;
> -	crtc_h = fb->height - y;
> -	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
> -			    crtc_w, crtc_h, x, y, crtc_w, crtc_h);
> +	if (WARN_ON(!crtc->state))
> +		return;
>  
> -	return 0;
> +	if (exynos_crtc->ops->commit)
> +		exynos_crtc->ops->commit(exynos_crtc);

This will be called again by crtc_funcs->commit from
drm_crtc_helper_set_mode. It seems to need to remove the call from
exynos_drm_crtc_commit like below.

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 48ccab7..aa981c2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -63,9 +63,6 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 
 	if (exynos_crtc->ops->win_commit)
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-
-	if (exynos_crtc->ops->commit)
-		exynos_crtc->ops->commit(exynos_crtc);
 }
 
 static bool

>  }
>  
>  static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
> @@ -158,8 +115,9 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
>  	.prepare	= exynos_drm_crtc_prepare,
>  	.commit		= exynos_drm_crtc_commit,
>  	.mode_fixup	= exynos_drm_crtc_mode_fixup,
> -	.mode_set	= exynos_drm_crtc_mode_set,
> -	.mode_set_base	= exynos_drm_crtc_mode_set_base,
> +	.mode_set	= drm_helper_crtc_mode_set,
> +	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
> +	.mode_set_base	= drm_helper_crtc_mode_set_base,
>  	.disable	= exynos_drm_crtc_disable,
>  };
>  
> 

Thanks.
