From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v10 02/17] drm/exynos: use =?UTF-8?Q?adjusted=5Fmode?=
 =?UTF-8?Q?=20of=20crtc=5Fstate=20instead=20of=20mode?=
Date: Mon, 01 Jun 2015 17:09:15 +0200
Message-ID: <519a97890c97fc23d5980ab1a70b1c3d@math.uni-bielefeld.de>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <1433171095-23773-3-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56049 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751468AbbFAPJS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:09:18 -0400
In-Reply-To: <1433171095-23773-3-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com

Hello,

as pointed out in [1] before, this gives me an kernel oops during boot.

With best wishes,
Tobias

[1] http://www.spinics.net/lists/linux-samsung-soc/msg44736.html


On 2015-06-01 17:04, Gustavo Padovan wrote:
> From: Joonyoung Shim <jy0922.shim@samsung.com>
> 
> Handle changes by removing copy from adjusted_mode to mode as using
> adjusted_mode of crtc_state.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c |  4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c  | 13 +++++++------
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 6714e5b..f29e4be 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -175,7 +175,7 @@ static bool decon_mode_fixup(struct exynos_drm_crtc 
> *crtc,
>  static void decon_commit(struct exynos_drm_crtc *crtc)
>  {
>  	struct decon_context *ctx = crtc->ctx;
> -	struct drm_display_mode *mode = &crtc->base.mode;
> +	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
>  	u32 val, clkdiv;
> 
>  	if (ctx->suspended)
> @@ -395,7 +395,7 @@ static void decon_shadow_protect_win(struct
> decon_context *ctx,
>  static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned 
> int win)
>  {
>  	struct decon_context *ctx = crtc->ctx;
> -	struct drm_display_mode *mode = &crtc->base.mode;
> +	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
>  	struct exynos_drm_plane *plane;
>  	int padding;
>  	unsigned long val, alpha;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index a0edab8..b326b31 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -337,7 +337,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc 
> *crtc,
>  static void fimd_commit(struct exynos_drm_crtc *crtc)
>  {
>  	struct fimd_context *ctx = crtc->ctx;
> -	struct drm_display_mode *mode = &crtc->base.mode;
> +	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
>  	struct fimd_driver_data *driver_data = ctx->driver_data;
>  	void *timing_base = ctx->regs + driver_data->timing_base;
>  	u32 val, clkdiv;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index b1180fb..01d2918 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -92,11 +92,12 @@ void exynos_plane_mode_set(struct drm_plane
> *plane, struct drm_crtc *crtc,
>  			  uint32_t src_w, uint32_t src_h)
>  {
>  	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>  	unsigned int actual_w;
>  	unsigned int actual_h;
> 
> -	actual_w = exynos_plane_get_size(crtc_x, crtc_w, 
> crtc->mode.hdisplay);
> -	actual_h = exynos_plane_get_size(crtc_y, crtc_h, 
> crtc->mode.vdisplay);
> +	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
> +	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
> 
>  	if (crtc_x < 0) {
>  		if (actual_w)
> @@ -132,10 +133,10 @@ void exynos_plane_mode_set(struct drm_plane
> *plane, struct drm_crtc *crtc,
>  	exynos_plane->crtc_height = actual_h;
> 
>  	/* set drm mode data. */
> -	exynos_plane->mode_width = crtc->mode.hdisplay;
> -	exynos_plane->mode_height = crtc->mode.vdisplay;
> -	exynos_plane->refresh = crtc->mode.vrefresh;
> -	exynos_plane->scan_flag = crtc->mode.flags;
> +	exynos_plane->mode_width = mode->hdisplay;
> +	exynos_plane->mode_height = mode->vdisplay;
> +	exynos_plane->refresh = mode->vrefresh;
> +	exynos_plane->scan_flag = mode->flags;
> 
>  	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
>  			exynos_plane->crtc_x, exynos_plane->crtc_y,
