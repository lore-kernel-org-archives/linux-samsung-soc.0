From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v6 09/12] drm/exynos: remove exported functions from
 exynos_drm_plane
Date: Fri, 22 May 2015 12:47:03 +0900
Message-ID: <555EA6B7.9070200@samsung.com>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
 <1432238571-31621-10-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31460 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753854AbbEVDrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 23:47:04 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOQ00FUAFUFNM80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 12:47:03 +0900 (KST)
In-reply-to: <1432238571-31621-10-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 05/22/2015 05:02 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Now that no one is using the functions exported by exynos_drm_plane due
> to the atomic conversion we can make remove some of the them or make them
> static.
> 
> v2: remove unused exynos_drm_crtc
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 91 +++++++++++++------------------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h | 11 ----
>  2 files changed, 38 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index e952cbd..c6e5114 100644
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
> -		exynos_plane->dma_addr[i] = buffer->dma_addr + fb->offsets[i];
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

checkpatch error:

WARNING: line over 80 characters
#56: FILE: drivers/gpu/drm/exynos/exynos_drm_plane.c:65:
+static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,

total: 0 errors, 1 warnings, 136 lines checked

Thanks.
