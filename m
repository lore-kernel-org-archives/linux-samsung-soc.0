From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 4/6] drm/exynos: remove leftover functions declarations
Date: Fri, 30 Jan 2015 11:48:15 +0900
Message-ID: <54CAF0EF.9090502@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51303 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759344AbbA3CsP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 21:48:15 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIY009RYYGD6840@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jan 2015 11:48:13 +0900 (KST)
In-reply-to: <1422016980-23806-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, =?UTF-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVw==?= =?UTF-8?B?IFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekA==?= =?UTF-8?B?JyI=?= <inki.dae@samsung.com>

+Cc Inki,

Hi,

On 01/23/2015 09:42 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> These functions were already removed by previous cleanup work, but these
> ones were left behind.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> index 6258b80..628b787 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> @@ -27,12 +27,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
>  void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
>  void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
>  
> -void exynos_drm_crtc_plane_mode_set(struct drm_crtc *crtc,
> -			struct exynos_drm_plane *plane);
> -void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
> -void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
> -void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
> -
>  /* This function gets pipe value to crtc device matched with out_type. */
>  int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
>  					unsigned int out_type);
> 

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
