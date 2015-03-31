From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH -v2 3/8] drm/exynos: remove struct *_win_data abstraction
 on planes
Date: Tue, 31 Mar 2015 17:19:31 +0900
Message-ID: <551A5893.8040706@samsung.com>
References: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
 <1427379061-30621-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57587 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbbCaIT3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 04:19:29 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NM2002AWHSEYY70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Mar 2015 17:19:27 +0900 (KST)
In-reply-to: <1427379061-30621-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 03/26/2015 11:10 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> struct {fimd,mixer,vidi}_win_data was just keeping the same data
> as struct exynos_drm_plane thus get ride of it and use exynos_drm_plane
> directly.
> 
> It changes how planes are created and remove .win_mode_set() callback
> that was only filling all *_win_data structs.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 164 ++++++++--------------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c   |   9 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c    |  14 --
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |   5 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 182 +++++++++----------------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c  |  23 +---
>  drivers/gpu/drm/exynos/exynos_drm_plane.h  |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 123 ++++-------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 212 ++++++++++-------------------
>  10 files changed, 242 insertions(+), 497 deletions(-)
> 

[snip]

> @@ -818,7 +762,9 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct decon_context *ctx = dev_get_drvdata(dev);
>  	struct drm_device *drm_dev = data;
> -	int ret;
> +	struct exynos_drm_plane *exynos_plane;
> +	enum drm_plane_type type;
> +	int zpos, ret;
>  
>  	ret = decon_ctx_initialize(ctx, drm_dev);
>  	if (ret) {
> @@ -826,8 +772,16 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  		return ret;
>  	}
>  
> -	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
> -					   EXYNOS_DISPLAY_TYPE_LCD,
> +	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
> +		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
> +						DRM_PLANE_TYPE_OVERLAY;
> +		exynos_plane_init(drm_dev, &ctx->planes[zpos], 1 << ctx->pipe,
> +				  type);

Doesn't error checking need about return value of exynos_plane_init?

Thanks.
