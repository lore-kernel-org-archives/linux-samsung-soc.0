From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 1/4] drm/exynos: remove struct *_win_data abstraction on
 planes
Date: Fri, 06 Feb 2015 13:18:12 +0900
Message-ID: <54D44084.3030308@samsung.com>
References: <1423159199-16394-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23137 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753553AbbBFESG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 23:18:06 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJC00L8N1A4ZT00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Feb 2015 13:18:04 +0900 (KST)
In-reply-to: <1423159199-16394-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

On 02/06/2015 02:59 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> struct {fimd,mixer,vidi}_win_data was just keeping the same data
> as struct exynos_drm_plane thus get ride of it and use exynos_drm_plane
> directly.
> 
> It changes how planes are created and remove .win_mode_set() callback
> that was only filling all *_win_data structs.
> 

OK, let's go ahead this with next zpos problem fix.

> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  |   9 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h  |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   |  14 --
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |   5 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 182 ++++++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  20 +--
>  drivers/gpu/drm/exynos/exynos_drm_plane.h |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 123 +++++------------
>  drivers/gpu/drm/exynos/exynos_mixer.c     | 212 +++++++++++-------------------
>  9 files changed, 183 insertions(+), 389 deletions(-)
> 

[snip]

> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 736269a..6e7c0cc 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -37,34 +37,13 @@
>  
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_crtc.h"
> +#include "exynos_drm_plane.h"
>  #include "exynos_drm_iommu.h"
>  #include "exynos_mixer.h"
>  
>  #define MIXER_WIN_NR		3
>  #define MIXER_DEFAULT_WIN	0
>  
> -struct hdmi_win_data {
> -	dma_addr_t		dma_addr;
> -	dma_addr_t		chroma_dma_addr;
> -	uint32_t		pixel_format;
> -	unsigned int		bpp;
> -	unsigned int		crtc_x;
> -	unsigned int		crtc_y;
> -	unsigned int		crtc_width;
> -	unsigned int		crtc_height;
> -	unsigned int		fb_x;
> -	unsigned int		fb_y;
> -	unsigned int		fb_width;
> -	unsigned int		fb_height;
> -	unsigned int		src_width;
> -	unsigned int		src_height;
> -	unsigned int		mode_width;
> -	unsigned int		mode_height;
> -	unsigned int		scan_flags;
> -	bool			enabled;
> -	bool			resume;
> -};
> -
>  struct mixer_resources {
>  	int			irq;
>  	void __iomem		*mixer_regs;
> @@ -88,6 +67,7 @@ struct mixer_context {
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
> +	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>  	int			pipe;
>  	bool			interlace;
>  	bool			powered;
> @@ -97,7 +77,6 @@ struct mixer_context {
>  
>  	struct mutex		mixer_mutex;
>  	struct mixer_resources	mixer_res;
> -	struct hdmi_win_data	win_data[MIXER_WIN_NR];
>  	enum mixer_version_id	mxr_ver;
>  	wait_queue_head_t	wait_vsync_queue;
>  	atomic_t		wait_vsync_event;
> @@ -401,7 +380,7 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	unsigned long flags;
> -	struct hdmi_win_data *win_data;
> +	struct exynos_drm_plane *plane;
>  	unsigned int x_ratio, y_ratio;
>  	unsigned int buf_num = 1;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
> @@ -409,9 +388,9 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	bool crcb_mode = false;
>  	u32 val;
>  
> -	win_data = &ctx->win_data[win];
> +	plane = &ctx->planes[win];
>  
> -	switch (win_data->pixel_format) {
> +	switch (plane->pixel_format) {
>  	case DRM_FORMAT_NV12MT:
>  		tiled_mode = true;
>  	case DRM_FORMAT_NV12:
> @@ -421,35 +400,35 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	/* TODO: single buffer format NV12, NV21 */
>  	default:
>  		/* ignore pixel format at disable time */
> -		if (!win_data->dma_addr)
> +		if (!plane->dma_addr[0])
>  			break;
>  
>  		DRM_ERROR("pixel format for vp is wrong [%d].\n",
> -				win_data->pixel_format);
> +				plane->pixel_format);
>  		return;
>  	}
>  
>  	/* scaling feature: (src << 16) / dst */
> -	x_ratio = (win_data->src_width << 16) / win_data->crtc_width;
> -	y_ratio = (win_data->src_height << 16) / win_data->crtc_height;
> +	x_ratio = (plane->src_width << 16) / plane->crtc_width;
> +	y_ratio = (plane->src_height << 16) / plane->crtc_height;
>  
>  	if (buf_num == 2) {
> -		luma_addr[0] = win_data->dma_addr;
> -		chroma_addr[0] = win_data->chroma_dma_addr;
> +		luma_addr[0] = plane->dma_addr[0];
> +		chroma_addr[0] = plane->dma_addr[1];
>  	} else {
> -		luma_addr[0] = win_data->dma_addr;
> -		chroma_addr[0] = win_data->dma_addr
> -			+ (win_data->fb_width * win_data->fb_height);
> +		luma_addr[0] = plane->dma_addr[0];
> +		chroma_addr[0] = plane->dma_addr[0]
> +			+ (plane->fb_width * plane->fb_height);
>  	}
>  
> -	if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE) {
> +	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
>  		ctx->interlace = true;
>  		if (tiled_mode) {
>  			luma_addr[1] = luma_addr[0] + 0x40;
>  			chroma_addr[1] = chroma_addr[0] + 0x40;
>  		} else {
> -			luma_addr[1] = luma_addr[0] + win_data->fb_width;
> -			chroma_addr[1] = chroma_addr[0] + win_data->fb_width;
> +			luma_addr[1] = luma_addr[0] + plane->fb_width;
> +			chroma_addr[1] = chroma_addr[0] + plane->fb_width;
>  		}
>  	} else {
>  		ctx->interlace = false;
> @@ -470,26 +449,26 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
>  
>  	/* setting size of input image */
> -	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(win_data->fb_width) |
> -		VP_IMG_VSIZE(win_data->fb_height));
> +	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->fb_width) |
> +		VP_IMG_VSIZE(plane->fb_height));
>  	/* chroma height has to reduced by 2 to avoid chroma distorions */
> -	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(win_data->fb_width) |
> -		VP_IMG_VSIZE(win_data->fb_height / 2));
> +	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->fb_width) |
> +		VP_IMG_VSIZE(plane->fb_height / 2));
>  
> -	vp_reg_write(res, VP_SRC_WIDTH, win_data->src_width);
> -	vp_reg_write(res, VP_SRC_HEIGHT, win_data->src_height);
> +	vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
> +	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
>  	vp_reg_write(res, VP_SRC_H_POSITION,
> -			VP_SRC_H_POSITION_VAL(win_data->fb_x));
> -	vp_reg_write(res, VP_SRC_V_POSITION, win_data->fb_y);
> +			VP_SRC_H_POSITION_VAL(plane->fb_x));
> +	vp_reg_write(res, VP_SRC_V_POSITION, plane->fb_y);
>  
> -	vp_reg_write(res, VP_DST_WIDTH, win_data->crtc_width);
> -	vp_reg_write(res, VP_DST_H_POSITION, win_data->crtc_x);
> +	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
> +	vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
>  	if (ctx->interlace) {
> -		vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height / 2);
> -		vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y / 2);
> +		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
> +		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
>  	} else {
> -		vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height);
> -		vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y);
> +		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
> +		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
>  	}
>  
>  	vp_reg_write(res, VP_H_RATIO, x_ratio);
> @@ -503,8 +482,8 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
>  	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
>  
> -	mixer_cfg_scan(ctx, win_data->mode_height);
> -	mixer_cfg_rgb_fmt(ctx, win_data->mode_height);
> +	mixer_cfg_scan(ctx, plane->mode_height);
> +	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
>  	mixer_cfg_layer(ctx, win, true);
>  	mixer_run(ctx);
>  
> @@ -525,21 +504,21 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	unsigned long flags;
> -	struct hdmi_win_data *win_data;
> +	struct exynos_drm_plane *plane;
>  	unsigned int x_ratio, y_ratio;
>  	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
>  	dma_addr_t dma_addr;
>  	unsigned int fmt;
>  	u32 val;
>  
> -	win_data = &ctx->win_data[win];
> +	plane = &ctx->planes[win];
>  
>  	#define RGB565 4
>  	#define ARGB1555 5
>  	#define ARGB4444 6
>  	#define ARGB8888 7
>  
> -	switch (win_data->bpp) {
> +	switch (plane->bpp) {
>  	case 16:
>  		fmt = ARGB4444;
>  		break;
> @@ -554,17 +533,17 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	x_ratio = 0;
>  	y_ratio = 0;
>  
> -	dst_x_offset = win_data->crtc_x;
> -	dst_y_offset = win_data->crtc_y;
> +	dst_x_offset = plane->crtc_x;
> +	dst_y_offset = plane->crtc_y;
>  
>  	/* converting dma address base and source offset */
> -	dma_addr = win_data->dma_addr
> -		+ (win_data->fb_x * win_data->bpp >> 3)
> -		+ (win_data->fb_y * win_data->fb_width * win_data->bpp >> 3);
> +	dma_addr = plane->dma_addr[0]
> +		+ (plane->fb_x * plane->bpp >> 3)
> +		+ (plane->fb_y * plane->fb_width * plane->bpp >> 3);
>  	src_x_offset = 0;
>  	src_y_offset = 0;
>  
> -	if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE)
> +	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE)
>  		ctx->interlace = true;
>  	else
>  		ctx->interlace = false;
> @@ -577,18 +556,18 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  		MXR_GRP_CFG_FORMAT_VAL(fmt), MXR_GRP_CFG_FORMAT_MASK);
>  
>  	/* setup geometry */
> -	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
> +	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), plane->fb_width);
>  
>  	/* setup display size */
>  	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
>  		win == MIXER_DEFAULT_WIN) {
> -		val  = MXR_MXR_RES_HEIGHT(win_data->fb_height);
> -		val |= MXR_MXR_RES_WIDTH(win_data->fb_width);
> +		val  = MXR_MXR_RES_HEIGHT(plane->fb_height);
> +		val |= MXR_MXR_RES_WIDTH(plane->fb_width);

I can't apply because of this changes.

Could you make patch based on latest exynos-drm-next branch?	

Thanks.
