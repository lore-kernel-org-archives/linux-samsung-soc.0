From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 25/29] drm/exynos: atomic phase 1: use
 drm_plane_helper_disable()
Date: Thu, 18 Dec 2014 16:30:26 +0100
Message-ID: <20141218153026.GN2711@phenom.ffwll.local>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-26-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:39778 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953AbaLRPac (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 10:30:32 -0500
Received: by mail-wi0-f182.google.com with SMTP id h11so2213435wiw.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 07:30:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1418911135-5207-26-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On Thu, Dec 18, 2014 at 11:58:51AM -0200, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> The atomic helper to disable planes also uses exynos_update_plane() to
> disable plane so we had to adapt it to both commit and disable planes.
> 
> A check for NULL CRTC was added to exynos_plane_mode_set() since planes
> to be disabled have plane_state->crtc set to NULL.
> 
> Also win_disable() callback uses plane->crtc as arg for the same reason.
> 
> exynos_drm_fb_get_buf_cnt() needs a fb check too to avoid a null pointer.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Thierry has patches to add an optional atomic_disable vfunc to plane
helpers, which seems useful for you too. Until that patch has landed maybe
just carry Thierry's patch locally. Or undo the merge done here again
later on.
-Daniel

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 24 ++++++++++++++++++------
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index d346d1e..470456d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -136,7 +136,7 @@ unsigned int exynos_drm_fb_get_buf_cnt(struct drm_framebuffer *fb)
>  
>  	exynos_fb = to_exynos_fb(fb);
>  
> -	return exynos_fb->buf_cnt;
> +	return exynos_fb ? exynos_fb->buf_cnt : 0;
>  }
>  
>  struct drm_framebuffer *
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index 1c67fbc..dfca218 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -98,6 +98,9 @@ static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc
>  	unsigned int actual_w;
>  	unsigned int actual_h;
>  
> +	if (!crtc)
> +		return;
> +
>  	actual_w = exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisplay);
>  	actual_h = exynos_plane_get_size(crtc_y, crtc_h, crtc->mode.vdisplay);
>  
> @@ -140,8 +143,6 @@ static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc
>  			exynos_plane->crtc_x, exynos_plane->crtc_y,
>  			exynos_plane->crtc_width, exynos_plane->crtc_height);
>  
> -	plane->crtc = crtc;
> -
>  	if (exynos_crtc->ops->win_mode_set)
>  		exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
>  }
> @@ -179,15 +180,26 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>  		     uint32_t src_x, uint32_t src_y,
>  		     uint32_t src_w, uint32_t src_h)
>  {
> -	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
>  	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> +	struct exynos_drm_crtc *exynos_crtc;
>  
>  	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
>  			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
>  			      src_w >> 16, src_h >> 16);
>  
> -	if (exynos_crtc->ops->win_commit)
> -		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> +	if (fb) {
> +		exynos_crtc = to_exynos_crtc(crtc);
> +		if (exynos_crtc->ops->win_commit)
> +			exynos_crtc->ops->win_commit(exynos_crtc,
> +						     exynos_plane->zpos);
> +	} else {
> +		exynos_crtc = to_exynos_crtc(plane->crtc);
> +		if (exynos_crtc->ops->win_disable)
> +			exynos_crtc->ops->win_disable(exynos_crtc,
> +						      exynos_plane->zpos);
> +	}
> +
> +	plane->crtc = crtc;
>  }
>  
>  static int exynos_disable_plane(struct drm_plane *plane)
> @@ -224,7 +236,7 @@ static int exynos_plane_set_property(struct drm_plane *plane,
>  
>  static struct drm_plane_funcs exynos_plane_funcs = {
>  	.update_plane	= drm_plane_helper_update,
> -	.disable_plane	= exynos_disable_plane,
> +	.disable_plane	= drm_plane_helper_disable,
>  	.destroy	= exynos_plane_destroy,
>  	.set_property	= exynos_plane_set_property,
>  };
> -- 
> 1.9.3
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
