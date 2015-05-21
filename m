From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH] drm/exynos: use drm_atomic_state directly
Date: Thu, 21 May 2015 12:22:42 -0300
Message-ID: <20150521152242.GA1641@joana>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
 <1432220576-18532-3-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55652 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754017AbbEUPWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 11:22:52 -0400
Content-Disposition: inline
In-Reply-To: <1432220576-18532-3-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de

Just ignore this one. The patch file was by mistake in the same folder
as the atomic ones. It is part of a patchset that will come out later.

Gustavo

2015-05-21 Gustavo Padovan <gustavo@padovan.org>:

> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Instead of use duplicated information stored on struct exynos_drm_plane
> use the atomic state directly to have a more clear understanding and clean
> code.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c |  49 ++++++------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  51 -------------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   |  47 ++++++------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c  |  86 ++++++---------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 116 ++++++++++++++---------------
>  5 files changed, 131 insertions(+), 218 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index ed4461f..612ee29 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -281,16 +281,16 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
>  	}
>  }
>  
> -static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
> +static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
> +				 struct drm_framebuffer *fb)
>  {
> -	struct exynos_drm_plane *plane = &ctx->planes[win];
>  	unsigned long val;
>  	int padding;
>  
>  	val = readl(ctx->regs + WINCON(win));
>  	val &= ~WINCONx_BPPMODE_MASK;
>  
> -	switch (plane->pixel_format) {
> +	switch (fb->pixel_format) {
>  	case DRM_FORMAT_RGB565:
>  		val |= WINCONx_BPPMODE_16BPP_565;
>  		val |= WINCONx_BURSTLEN_16WORD;
> @@ -339,7 +339,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
>  		break;
>  	}
>  
> -	DRM_DEBUG_KMS("bpp = %d\n", plane->bpp);
> +	DRM_DEBUG_KMS("bpp = %d\n", fb->bits_per_pixel);
>  
>  	/*
>  	 * In case of exynos, setting dma-burst to 16Word causes permanent
> @@ -349,8 +349,8 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
>  	 * movement causes unstable DMA which results into iommu crash/tear.
>  	 */
>  
> -	padding = (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
> -	if (plane->fb_width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
> +	padding = (fb->pitches[0] / (fb->bits_per_pixel >> 3)) - fb->width;
> +	if (fb->width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>  		val &= ~WINCONx_BURSTLEN_MASK;
>  		val |= WINCONx_BURSTLEN_8WORD;
>  	}
> @@ -396,12 +396,15 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>  			       struct exynos_drm_plane *plane)
>  {
>  	struct decon_context *ctx = crtc->ctx;
> +	struct drm_plane_state *state = plane->base.state;
>  	struct drm_display_mode *mode = &crtc->base.mode;
>  	int padding;
>  	unsigned long val, alpha;
>  	unsigned int last_x;
>  	unsigned int last_y;
>  	unsigned int win = plane->zpos;
> +	unsigned int bpp = state->fb->bits_per_pixel >> 3;
> +	unsigned int pitch = state->fb->pitches[0];
>  
>  	/* If suspended, enable this on resume */
>  	if (ctx->suspended) {
> @@ -426,38 +429,38 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>  	val = (unsigned long)plane->dma_addr[0];
>  	writel(val, ctx->regs + VIDW_BUF_START(win));
>  
> -	padding = (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
> +	padding = (pitch / bpp) - state->fb->width;
>  
>  	/* buffer size */
> -	writel(plane->fb_width + padding, ctx->regs + VIDW_WHOLE_X(win));
> -	writel(plane->fb_height, ctx->regs + VIDW_WHOLE_Y(win));
> +	writel(state->fb->width + padding, ctx->regs + VIDW_WHOLE_X(win));
> +	writel(state->fb->height, ctx->regs + VIDW_WHOLE_Y(win));
>  
>  	/* offset from the start of the buffer to read */
> -	writel(plane->src_x, ctx->regs + VIDW_OFFSET_X(win));
> -	writel(plane->src_y, ctx->regs + VIDW_OFFSET_Y(win));
> +	writel(state->src_x, ctx->regs + VIDW_OFFSET_X(win));
> +	writel(state->src_y, ctx->regs + VIDW_OFFSET_Y(win));
>  
>  	DRM_DEBUG_KMS("start addr = 0x%lx\n",
>  			(unsigned long)val);
> -	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
> -			plane->crtc_width, plane->crtc_height);
> +	DRM_DEBUG_KMS("crtc_w = %d, crtc_h = %d\n",
> +			state->crtc_w, state->crtc_h);
>  
>  	/*
>  	 * OSD position.
>  	 * In case the window layout goes of LCD layout, DECON fails.
>  	 */
> -	if ((plane->crtc_x + plane->crtc_width) > mode->hdisplay)
> -		plane->crtc_x = mode->hdisplay - plane->crtc_width;
> -	if ((plane->crtc_y + plane->crtc_height) > mode->vdisplay)
> -		plane->crtc_y = mode->vdisplay - plane->crtc_height;
> +	if ((state->crtc_x + state->crtc_w) > mode->hdisplay)
> +		state->crtc_x = mode->hdisplay - state->crtc_w;
> +	if ((state->crtc_y + state->crtc_h) > mode->vdisplay)
> +		state->crtc_y = mode->vdisplay - state->crtc_h;
>  
> -	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
> -		VIDOSDxA_TOPLEFT_Y(plane->crtc_y);
> +	val = VIDOSDxA_TOPLEFT_X(state->crtc_x) |
> +		VIDOSDxA_TOPLEFT_Y(state->crtc_y);
>  	writel(val, ctx->regs + VIDOSD_A(win));
>  
> -	last_x = plane->crtc_x + plane->crtc_width;
> +	last_x = state->crtc_x + state->crtc_w;
>  	if (last_x)
>  		last_x--;
> -	last_y = plane->crtc_y + plane->crtc_height;
> +	last_y = state->crtc_y + state->crtc_h;
>  	if (last_y)
>  		last_y--;
>  
> @@ -466,7 +469,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>  	writel(val, ctx->regs + VIDOSD_B(win));
>  
>  	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
> -			plane->crtc_x, plane->crtc_y, last_x, last_y);
> +			state->crtc_x, state->crtc_y, last_x, last_y);
>  
>  	/* OSD alpha */
>  	alpha = VIDOSDxC_ALPHA0_R_F(0x0) |
> @@ -481,7 +484,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>  
>  	writel(alpha, ctx->regs + VIDOSD_D(win));
>  
> -	decon_win_set_pixfmt(ctx, win);
> +	decon_win_set_pixfmt(ctx, win, state->fb);
>  
>  	/* hardware window 0 doesn't support color key. */
>  	if (win != 0)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 516e11b..fff13e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -47,37 +47,9 @@ enum exynos_drm_output_type {
>   * Exynos drm common overlay structure.
>   *
>   * @base: plane object
> - * @src_x: offset x on a framebuffer to be displayed.
> - *	- the unit is screen coordinates.
> - * @src_y: offset y on a framebuffer to be displayed.
> - *	- the unit is screen coordinates.
> - * @src_width: width of a partial image to be displayed from framebuffer.
> - * @src_height: height of a partial image to be displayed from framebuffer.
> - * @fb_width: width of a framebuffer.
> - * @fb_height: height of a framebuffer.
> - * @crtc_x: offset x on hardware screen.
> - * @crtc_y: offset y on hardware screen.
> - * @crtc_width: window width to be displayed (hardware screen).
> - * @crtc_height: window height to be displayed (hardware screen).
> - * @mode_width: width of screen mode.
> - * @mode_height: height of screen mode.
> - * @h_ratio: horizontal scaling ratio, 16.16 fixed point
> - * @v_ratio: vertical scaling ratio, 16.16 fixed point
> - * @refresh: refresh rate.
> - * @scan_flag: interlace or progressive way.
> - *	(it could be DRM_MODE_FLAG_*)
> - * @bpp: pixel size.(in bit)
> - * @pixel_format: fourcc pixel format of this overlay
>   * @dma_addr: array of bus(accessed by dma) address to the memory region
>   *	      allocated for a overlay.
>   * @zpos: order of overlay layer(z position).
> - * @index_color: if using color key feature then this value would be used
> - *			as index color.
> - * @default_win: a window to be enabled.
> - * @color_key: color key on or off.
> - * @local_path: in case of lcd type, local path mode on or off.
> - * @transparency: transparency on or off.
> - * @activated: activated or not.
>   * @enabled: enabled or not.
>   * @resume: to resume or not.
>   *
> @@ -87,33 +59,10 @@ enum exynos_drm_output_type {
>  
>  struct exynos_drm_plane {
>  	struct drm_plane base;
> -	unsigned int src_x;
> -	unsigned int src_y;
> -	unsigned int src_width;
> -	unsigned int src_height;
> -	unsigned int fb_width;
> -	unsigned int fb_height;
> -	unsigned int crtc_x;
> -	unsigned int crtc_y;
> -	unsigned int crtc_width;
> -	unsigned int crtc_height;
> -	unsigned int mode_width;
> -	unsigned int mode_height;
> -	unsigned int h_ratio;
> -	unsigned int v_ratio;
> -	unsigned int scan_flag;
> -	unsigned int bpp;
> -	unsigned int pitch;
> -	uint32_t pixel_format;
>  	dma_addr_t dma_addr[MAX_FB_BUFFER];
>  	unsigned int zpos;
>  	unsigned int index_color;
>  
> -	bool default_win:1;
> -	bool color_key:1;
> -	bool local_path:1;
> -	bool transparency:1;
> -	bool activated:1;
>  	bool enabled:1;
>  	bool resume:1;
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 0a88e91..f917d22 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -491,9 +491,9 @@ static void fimd_disable_vblank(struct exynos_drm_crtc *crtc)
>  	}
>  }
>  
> -static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
> +static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> +				struct drm_framebuffer *fb)
>  {
> -	struct exynos_drm_plane *plane = &ctx->planes[win];
>  	unsigned long val;
>  
>  	val = WINCONx_ENWIN;
> @@ -503,11 +503,11 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
>  	 * So the request format is ARGB8888 then change it to XRGB8888.
>  	 */
>  	if (ctx->driver_data->has_limited_fmt && !win) {
> -		if (plane->pixel_format == DRM_FORMAT_ARGB8888)
> -			plane->pixel_format = DRM_FORMAT_XRGB8888;
> +		if (fb->pixel_format == DRM_FORMAT_ARGB8888)
> +			fb->pixel_format = DRM_FORMAT_XRGB8888;
>  	}
>  
> -	switch (plane->pixel_format) {
> +	switch (fb->pixel_format) {
>  	case DRM_FORMAT_C8:
>  		val |= WINCON0_BPPMODE_8BPP_PALETTE;
>  		val |= WINCONx_BURSTLEN_8WORD;
> @@ -543,7 +543,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
>  		break;
>  	}
>  
> -	DRM_DEBUG_KMS("bpp = %d\n", plane->bpp);
> +	DRM_DEBUG_KMS("bpp = %d\n", fb->bits_per_pixel);
>  
>  	/*
>  	 * In case of exynos, setting dma-burst to 16Word causes permanent
> @@ -553,7 +553,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
>  	 * movement causes unstable DMA which results into iommu crash/tear.
>  	 */
>  
> -	if (plane->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
> +	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>  		val &= ~WINCONx_BURSTLEN_MASK;
>  		val |= WINCONx_BURSTLEN_4WORD;
>  	}
> @@ -623,10 +623,13 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  			      struct exynos_drm_plane *plane)
>  {
>  	struct fimd_context *ctx = crtc->ctx;
> +	struct drm_plane_state *state = plane->base.state;
>  	dma_addr_t dma_addr;
>  	unsigned long val, size, offset;
>  	unsigned int last_x, last_y, buf_offsize, line_size;
>  	unsigned int win = plane->zpos;
> +	unsigned int bpp = state->fb->bits_per_pixel >> 3;
> +	unsigned int pitch = state->fb->pitches[0];
>  
>  	/* If suspended, enable this on resume */
>  	if (ctx->suspended) {
> @@ -648,8 +651,8 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  	fimd_shadow_protect_win(ctx, win, true);
>  
>  
> -	offset = plane->src_x * (plane->bpp >> 3);
> -	offset += plane->src_y * plane->pitch;
> +	offset = state->src_x * bpp;
> +	offset += state->src_y * pitch;
>  
>  	/* buffer start address */
>  	dma_addr = plane->dma_addr[0] + offset;
> @@ -657,18 +660,18 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
>  
>  	/* buffer end address */
> -	size = plane->pitch * plane->crtc_height;
> +	size = pitch * state->crtc_h;
>  	val = (unsigned long)(dma_addr + size);
>  	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
>  
>  	DRM_DEBUG_KMS("start addr = 0x%lx, end addr = 0x%lx, size = 0x%lx\n",
>  			(unsigned long)dma_addr, val, size);
>  	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
> -			plane->crtc_width, plane->crtc_height);
> +			state->crtc_w, state->crtc_h);
>  
>  	/* buffer size */
> -	buf_offsize = plane->pitch - (plane->crtc_width * (plane->bpp >> 3));
> -	line_size = plane->crtc_width * (plane->bpp >> 3);
> +	buf_offsize = pitch - (state->crtc_w * bpp);
> +	line_size = state->crtc_w * bpp;
>  	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
>  		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
>  		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
> @@ -676,16 +679,16 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  	writel(val, ctx->regs + VIDWx_BUF_SIZE(win, 0));
>  
>  	/* OSD position */
> -	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
> -		VIDOSDxA_TOPLEFT_Y(plane->crtc_y) |
> -		VIDOSDxA_TOPLEFT_X_E(plane->crtc_x) |
> -		VIDOSDxA_TOPLEFT_Y_E(plane->crtc_y);
> +	val = VIDOSDxA_TOPLEFT_X(state->crtc_x) |
> +		VIDOSDxA_TOPLEFT_Y(state->crtc_y) |
> +		VIDOSDxA_TOPLEFT_X_E(state->crtc_x) |
> +		VIDOSDxA_TOPLEFT_Y_E(state->crtc_y);
>  	writel(val, ctx->regs + VIDOSD_A(win));
>  
> -	last_x = plane->crtc_x + plane->crtc_width;
> +	last_x = state->crtc_x + state->crtc_w;
>  	if (last_x)
>  		last_x--;
> -	last_y = plane->crtc_y + plane->crtc_height;
> +	last_y = state->crtc_y + state->crtc_h;
>  	if (last_y)
>  		last_y--;
>  
> @@ -695,20 +698,20 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  	writel(val, ctx->regs + VIDOSD_B(win));
>  
>  	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
> -			plane->crtc_x, plane->crtc_y, last_x, last_y);
> +			state->crtc_x, state->crtc_y, last_x, last_y);
>  
>  	/* OSD size */
>  	if (win != 3 && win != 4) {
>  		u32 offset = VIDOSD_D(win);
>  		if (win == 0)
>  			offset = VIDOSD_C(win);
> -		val = plane->crtc_width * plane->crtc_height;
> +		val = state->crtc_w * state->crtc_h;
>  		writel(val, ctx->regs + offset);
>  
>  		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
>  	}
>  
> -	fimd_win_set_pixfmt(ctx, win);
> +	fimd_win_set_pixfmt(ctx, win, state->fb);
>  
>  	/* hardware window 0 doesn't support color key. */
>  	if (win != 0)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index 437613a..49f850e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -62,65 +62,6 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
>  	return size;
>  }
>  
> -static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
> -				  struct drm_framebuffer *fb,
> -				  int crtc_x, int crtc_y,
> -				  unsigned int crtc_w, unsigned int crtc_h,
> -				  uint32_t src_x, uint32_t src_y,
> -				  uint32_t src_w, uint32_t src_h)
> -{
> -	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> -	unsigned int actual_w;
> -	unsigned int actual_h;
> -
> -	actual_w = exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisplay);
> -	actual_h = exynos_plane_get_size(crtc_y, crtc_h, crtc->mode.vdisplay);
> -
> -	if (crtc_x < 0) {
> -		if (actual_w)
> -			src_x -= crtc_x;
> -		crtc_x = 0;
> -	}
> -
> -	if (crtc_y < 0) {
> -		if (actual_h)
> -			src_y -= crtc_y;
> -		crtc_y = 0;
> -	}
> -
> -	/* set ratio */
> -	exynos_plane->h_ratio = (src_w << 16) / crtc_w;
> -	exynos_plane->v_ratio = (src_h << 16) / crtc_h;
> -
> -	/* set drm framebuffer data. */
> -	exynos_plane->src_x = src_x;
> -	exynos_plane->src_y = src_y;
> -	exynos_plane->src_width = (actual_w * exynos_plane->h_ratio) >> 16;
> -	exynos_plane->src_height = (actual_h * exynos_plane->v_ratio) >> 16;
> -	exynos_plane->fb_width = fb->width;
> -	exynos_plane->fb_height = fb->height;
> -	exynos_plane->bpp = fb->bits_per_pixel;
> -	exynos_plane->pitch = fb->pitches[0];
> -	exynos_plane->pixel_format = fb->pixel_format;
> -
> -	/* set plane range to be displayed. */
> -	exynos_plane->crtc_x = crtc_x;
> -	exynos_plane->crtc_y = crtc_y;
> -	exynos_plane->crtc_width = actual_w;
> -	exynos_plane->crtc_height = actual_h;
> -
> -	/* set drm mode data. */
> -	exynos_plane->mode_width = crtc->mode.hdisplay;
> -	exynos_plane->mode_height = crtc->mode.vdisplay;
> -	exynos_plane->scan_flag = crtc->mode.flags;
> -
> -	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
> -			exynos_plane->crtc_x, exynos_plane->crtc_y,
> -			exynos_plane->crtc_width, exynos_plane->crtc_height);
> -
> -	plane->crtc = crtc;
> -}
> -
>  static struct drm_plane_funcs exynos_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> @@ -162,15 +103,32 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
>  	struct drm_plane_state *state = plane->state;
>  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(state->crtc);
>  	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> +	unsigned int actual_w;
> +	unsigned int actual_h;
> +	unsigned int src_x = state->src_x >> 16;
> +	unsigned int src_y = state->src_y >> 16;
>  
>  	if (!state->crtc)
>  		return;
>  
> -	exynos_plane_mode_set(plane, state->crtc, state->fb,
> -			      state->crtc_x, state->crtc_y,
> -			      state->crtc_w, state->crtc_h,
> -			      state->src_x >> 16, state->src_y >> 16,
> -			      state->src_w >> 16, state->src_h >> 16);
> +	actual_w = exynos_plane_get_size(state->crtc_x, state->crtc_w,
> +					 state->crtc->mode.hdisplay);
> +	actual_h = exynos_plane_get_size(state->crtc_y, state->crtc_h,
> +					 state->crtc->mode.vdisplay);
> +
> +	if (state->crtc_x < 0) {
> +		if (actual_w)
> +			src_x -= state->crtc_x;
> +		state->crtc_x = 0;
> +	}
> +	state->src_x = src_x;
> +
> +	if (state->crtc_y < 0) {
> +		if (actual_h)
> +			src_y -= state->crtc_y;
> +		state->crtc_y = 0;
> +	}
> +	state->src_y = src_y;
>  
>  	if (exynos_crtc->ops->update_plane)
>  		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index ce8fc13..38977e4 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -383,20 +383,21 @@ static void mixer_stop(struct mixer_context *ctx)
>  	mixer_regs_dump(ctx);
>  }
>  
> -static void vp_video_buffer(struct mixer_context *ctx, int win)
> +static void vp_video_buffer(struct mixer_context *ctx,
> +			    struct exynos_drm_plane *plane)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
> +	struct drm_plane_state *state = plane->base.state;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_display_mode *mode = &state->crtc->mode;
>  	unsigned long flags;
> -	struct exynos_drm_plane *plane;
>  	unsigned int buf_num = 1;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
>  	bool tiled_mode = false;
>  	bool crcb_mode = false;
>  	u32 val;
>  
> -	plane = &ctx->planes[win];
> -
> -	switch (plane->pixel_format) {
> +	switch (fb->pixel_format) {
>  	case DRM_FORMAT_NV12:
>  		crcb_mode = false;
>  		buf_num = 2;
> @@ -408,7 +409,7 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  			break;
>  
>  		DRM_ERROR("pixel format for vp is wrong [%d].\n",
> -				plane->pixel_format);
> +				fb->pixel_format);
>  		return;
>  	}
>  
> @@ -418,17 +419,17 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	} else {
>  		luma_addr[0] = plane->dma_addr[0];
>  		chroma_addr[0] = plane->dma_addr[0]
> -			+ (plane->pitch * plane->fb_height);
> +			+ (fb->pitches[0] * fb->height);
>  	}
>  
> -	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
>  		ctx->interlace = true;
>  		if (tiled_mode) {
>  			luma_addr[1] = luma_addr[0] + 0x40;
>  			chroma_addr[1] = chroma_addr[0] + 0x40;
>  		} else {
> -			luma_addr[1] = luma_addr[0] + plane->pitch;
> -			chroma_addr[1] = chroma_addr[0] + plane->pitch;
> +			luma_addr[1] = luma_addr[0] + fb->pitches[0];
> +			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
>  		}
>  	} else {
>  		ctx->interlace = false;
> @@ -449,30 +450,30 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
>  
>  	/* setting size of input image */
> -	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
> -		VP_IMG_VSIZE(plane->fb_height));
> +	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(fb->pitches[0]) |
> +		VP_IMG_VSIZE(fb->height));
>  	/* chroma height has to reduced by 2 to avoid chroma distorions */
> -	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
> -		VP_IMG_VSIZE(plane->fb_height / 2));
> +	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
> +		VP_IMG_VSIZE(fb->height / 2));
>  
> -	vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
> -	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
> +	vp_reg_write(res, VP_SRC_WIDTH, state->src_w);
> +	vp_reg_write(res, VP_SRC_HEIGHT, state->src_h);
>  	vp_reg_write(res, VP_SRC_H_POSITION,
> -			VP_SRC_H_POSITION_VAL(plane->src_x));
> -	vp_reg_write(res, VP_SRC_V_POSITION, plane->src_y);
> +			VP_SRC_H_POSITION_VAL(state->src_x));
> +	vp_reg_write(res, VP_SRC_V_POSITION, state->src_y);
>  
> -	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
> -	vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
> +	vp_reg_write(res, VP_DST_WIDTH, state->crtc_w);
> +	vp_reg_write(res, VP_DST_H_POSITION, state->crtc_x);
>  	if (ctx->interlace) {
> -		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
> -		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
> +		vp_reg_write(res, VP_DST_HEIGHT, state->crtc_h / 2);
> +		vp_reg_write(res, VP_DST_V_POSITION, state->crtc_y / 2);
>  	} else {
> -		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
> -		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
> +		vp_reg_write(res, VP_DST_HEIGHT, state->crtc_h);
> +		vp_reg_write(res, VP_DST_V_POSITION, state->crtc_y);
>  	}
>  
> -	vp_reg_write(res, VP_H_RATIO, plane->h_ratio);
> -	vp_reg_write(res, VP_V_RATIO, plane->v_ratio);
> +	vp_reg_write(res, VP_H_RATIO, (state->src_w << 16) / state->crtc_w);
> +	vp_reg_write(res, VP_V_RATIO, (state->src_h << 16) / state->crtc_h);
>  
>  	vp_reg_write(res, VP_ENDIAN_MODE, VP_ENDIAN_MODE_LITTLE);
>  
> @@ -482,9 +483,9 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
>  	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
>  
> -	mixer_cfg_scan(ctx, plane->mode_height);
> -	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
> -	mixer_cfg_layer(ctx, win, true);
> +	mixer_cfg_scan(ctx, mode->vdisplay);
> +	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> +	mixer_cfg_layer(ctx, plane->zpos, true);
>  	mixer_run(ctx);
>  
>  	mixer_vsync_set_update(ctx, true);
> @@ -500,18 +501,18 @@ static void mixer_layer_update(struct mixer_context *ctx)
>  	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
>  }
>  
> -static int mixer_setup_scale(const struct exynos_drm_plane *plane,
> +static int mixer_setup_scale(const struct drm_plane_state *state,
>  		unsigned int *x_ratio, unsigned int *y_ratio)
>  {
> -	if (plane->crtc_width != plane->src_width) {
> -		if (plane->crtc_width == 2 * plane->src_width)
> +	if (state->crtc_w != state->src_w) {
> +		if (state->crtc_w == 2 * state->src_w)
>  			*x_ratio = 1;
>  		else
>  			goto fail;
>  	}
>  
> -	if (plane->crtc_height != plane->src_height) {
> -		if (plane->crtc_height == 2 * plane->src_height)
> +	if (state->crtc_h != state->src_h) {
> +		if (state->crtc_h == 2 * state->src_h)
>  			*y_ratio = 1;
>  		else
>  			goto fail;
> @@ -524,20 +525,22 @@ fail:
>  	return -ENOTSUPP;
>  }
>  
> -static void mixer_graph_buffer(struct mixer_context *ctx, int win)
> +static void mixer_graph_buffer(struct mixer_context *ctx,
> +			       struct exynos_drm_plane *plane)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
> +	struct drm_plane_state *state = plane->base.state;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_display_mode *mode = &state->crtc->mode;
>  	unsigned long flags;
> -	struct exynos_drm_plane *plane;
> +	unsigned int win = plane->zpos;
>  	unsigned int x_ratio = 0, y_ratio = 0;
> -	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
> +	unsigned int src_x_offset, src_y_offset;
>  	dma_addr_t dma_addr;
>  	unsigned int fmt;
>  	u32 val;
>  
> -	plane = &ctx->planes[win];
> -
> -	switch (plane->pixel_format) {
> +	switch (fb->pixel_format) {
>  	case DRM_FORMAT_XRGB4444:
>  	case DRM_FORMAT_ARGB4444:
>  		fmt = MXR_FORMAT_ARGB4444;
> @@ -563,20 +566,17 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	}
>  
>  	/* check if mixer supports requested scaling setup */
> -	if (mixer_setup_scale(plane, &x_ratio, &y_ratio))
> +	if (mixer_setup_scale(state, &x_ratio, &y_ratio))
>  		return;
>  
> -	dst_x_offset = plane->crtc_x;
> -	dst_y_offset = plane->crtc_y;
> -
>  	/* converting dma address base and source offset */
>  	dma_addr = plane->dma_addr[0]
> -		+ (plane->src_x * plane->bpp >> 3)
> -		+ (plane->src_y * plane->pitch);
> +		+ (state->src_x * fb->bits_per_pixel >> 3)
> +		+ (state->src_y * fb->pitches[0]);
>  	src_x_offset = 0;
>  	src_y_offset = 0;
>  
> -	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE)
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		ctx->interlace = true;
>  	else
>  		ctx->interlace = false;
> @@ -590,18 +590,18 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  
>  	/* setup geometry */
>  	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
> -			plane->pitch / (plane->bpp >> 3));
> +			fb->pitches[0] / (fb->bits_per_pixel >> 3));
>  
>  	/* setup display size */
>  	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
>  		win == MIXER_DEFAULT_WIN) {
> -		val  = MXR_MXR_RES_HEIGHT(plane->mode_height);
> -		val |= MXR_MXR_RES_WIDTH(plane->mode_width);
> +		val  = MXR_MXR_RES_HEIGHT(mode->vdisplay);
> +		val |= MXR_MXR_RES_WIDTH(mode->hdisplay);
>  		mixer_reg_write(res, MXR_RESOLUTION, val);
>  	}
>  
> -	val  = MXR_GRP_WH_WIDTH(plane->src_width);
> -	val |= MXR_GRP_WH_HEIGHT(plane->src_height);
> +	val  = MXR_GRP_WH_WIDTH(state->src_w);
> +	val |= MXR_GRP_WH_HEIGHT(state->src_h);
>  	val |= MXR_GRP_WH_H_SCALE(x_ratio);
>  	val |= MXR_GRP_WH_V_SCALE(y_ratio);
>  	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
> @@ -612,15 +612,15 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	mixer_reg_write(res, MXR_GRAPHIC_SXY(win), val);
>  
>  	/* setup offsets in display image */
> -	val  = MXR_GRP_DXY_DX(dst_x_offset);
> -	val |= MXR_GRP_DXY_DY(dst_y_offset);
> +	val  = MXR_GRP_DXY_DX(state->crtc_x);
> +	val |= MXR_GRP_DXY_DY(state->crtc_y);
>  	mixer_reg_write(res, MXR_GRAPHIC_DXY(win), val);
>  
>  	/* set buffer address to mixer */
>  	mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);
>  
> -	mixer_cfg_scan(ctx, plane->mode_height);
> -	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
> +	mixer_cfg_scan(ctx, mode->vdisplay);
> +	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>  	mixer_cfg_layer(ctx, win, true);
>  
>  	/* layer update mandatory for mixer 16.0.33.0 */
> @@ -948,9 +948,9 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
>  	mutex_unlock(&mixer_ctx->mixer_mutex);
>  
>  	if (win > 1 && mixer_ctx->vp_enabled)
> -		vp_video_buffer(mixer_ctx, win);
> +		vp_video_buffer(mixer_ctx, plane);
>  	else
> -		mixer_graph_buffer(mixer_ctx, win);
> +		mixer_graph_buffer(mixer_ctx, plane);
>  
>  	plane->enabled = true;
>  }
> -- 
> 2.1.0
> 
