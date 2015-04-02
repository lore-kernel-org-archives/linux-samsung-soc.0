From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 09/10] drm/exynos: remove exported functions from
 exynos_drm_plane
Date: Thu, 02 Apr 2015 17:43:51 +0900
Message-ID: <551D0147.6020509@samsung.com>
References: <1427471939-27345-1-git-send-email-gustavo@padovan.org>
 <1427471939-27345-10-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8993 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753396AbbDBInr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 04:43:47 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NM600EDD88XJRB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Apr 2015 17:43:45 +0900 (KST)
In-reply-to: <1427471939-27345-10-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 03/28/2015 12:58 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Now that no one is using the functions exported by exynos_drm_plane due
> to the atomic conversion we can make remove some of the them or make them
> static.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 91 +++++++++++++------------------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h | 11 ----
>  2 files changed, 38 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index e83908a..7f8f962 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -62,35 +62,12 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
>  	return size;
>  }
>  
> -int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
> -{
> -	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> -	int nr;
> -	int i;
> -
> -	nr = exynos_drm_fb_get_buf_cnt(fb);
> -	for (i = 0; i < nr; i++) {
> -		struct exynos_drm_gem_buf *buffer = exynos_drm_fb_buffer(fb, i);
> -
> -		if (!buffer) {
> -			DRM_DEBUG_KMS("buffer is null\n");
> -			return -EFAULT;
> -		}
> -
> -		exynos_plane->dma_addr[i] = buffer->dma_addr;
> -
> -		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
> -				i, (unsigned long)exynos_plane->dma_addr[i]);
> -	}
> -
> -	return 0;
> -}
> -
> -void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
> -			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
> -			  unsigned int crtc_w, unsigned int crtc_h,
> -			  uint32_t src_x, uint32_t src_y,
> -			  uint32_t src_w, uint32_t src_h)
> +static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
> +				  struct drm_framebuffer *fb,
> +				  int crtc_x, int crtc_y,
> +				  unsigned int crtc_w, unsigned int crtc_h,
> +				  uint32_t src_x, uint32_t src_y,
> +				  uint32_t src_w, uint32_t src_h)
>  {
>  	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
>  	unsigned int actual_w;
> @@ -141,24 +118,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
>  	plane->crtc = crtc;
>  }
>  
> -void
> -exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
> -		     struct drm_framebuffer *fb, int crtc_x, int crtc_y,
> -		     unsigned int crtc_w, unsigned int crtc_h,
> -		     uint32_t src_x, uint32_t src_y,
> -		     uint32_t src_w, uint32_t src_h)
> -{
> -	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> -	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> -
> -	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
> -			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
> -			      src_w >> 16, src_h >> 16);
> -
> -	if (exynos_crtc->ops->win_commit)
> -		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> -}
> -
>  static struct drm_plane_funcs exynos_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> @@ -171,19 +130,45 @@ static struct drm_plane_funcs exynos_plane_funcs = {
>  static int exynos_plane_atomic_check(struct drm_plane *plane,
>  				     struct drm_plane_state *state)
>  {
> -	return exynos_check_plane(plane, state->fb);
> +	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> +	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);

Here exynos_crtc is unnecessary.

> +	int nr;
> +	int i;
> +
> +	nr = exynos_drm_fb_get_buf_cnt(state->fb);
> +	for (i = 0; i < nr; i++) {
> +		struct exynos_drm_gem_buf *buffer =
> +					exynos_drm_fb_buffer(state->fb, i);
> +
> +		if (!buffer) {
> +			DRM_DEBUG_KMS("buffer is null\n");
> +			return -EFAULT;
> +		}
> +
> +		exynos_plane->dma_addr[i] = buffer->dma_addr;
> +
> +		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
> +				i, (unsigned long)exynos_plane->dma_addr[i]);
> +	}
> +
> +	return 0;
>  }

Thanks.
