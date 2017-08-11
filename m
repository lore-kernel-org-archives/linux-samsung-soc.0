From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 4/8] drm/exynos: mixer: remove src offset from
 mixer_graph_buffer()
Date: Fri, 11 Aug 2017 17:12:14 +0900
Message-ID: <598D66DE.2090006@samsung.com>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
        <CGME20170809115026epcas2p4ea35e8ab1206b0f5ebbddf48d9855132@epcas2p4.samsung.com>
        <20170809114857.4945-5-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52155 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751416AbdHKIMQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 04:12:16 -0400
In-reply-to: <20170809114857.4945-5-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com



2017년 08월 09일 20:48에 Tobias Jakobi 이(가) 쓴 글:
> We always translate the dma address such that the offsets of
> the source image are zero. Hence we can remove manipulation of
> the MXR_GRAPHIC_SXY(win) register.
> 
> We leave the register defines (in regs_mixer.h) in place, since
> they document the hardware.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 8d68de85bada..28fbe79befff 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -584,7 +584,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	unsigned long flags;
>  	unsigned int win = plane->index;
>  	unsigned int x_ratio = 0, y_ratio = 0;
> -	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
> +	unsigned int dst_x_offset, dst_y_offset;
>  	dma_addr_t dma_addr;
>  	unsigned int fmt;
>  	u32 val;
> @@ -618,12 +618,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	dst_x_offset = state->crtc.x;
>  	dst_y_offset = state->crtc.y;
>  
> -	/* converting dma address base and source offset */
> +	/* translate dma address base s.t. the source image offset is zero */
>  	dma_addr = exynos_drm_fb_dma_addr(fb, 0)
>  		+ (state->src.x * fb->format->cpp[0])
>  		+ (state->src.y * fb->pitches[0]);
> -	src_x_offset = 0;
> -	src_y_offset = 0;
>  
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
> @@ -654,11 +652,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	val |= MXR_GRP_WH_V_SCALE(y_ratio);
>  	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
>  
> -	/* setup offsets in source image */
> -	val  = MXR_GRP_SXY_SX(src_x_offset);
> -	val |= MXR_GRP_SXY_SY(src_y_offset);
> -	mixer_reg_write(res, MXR_GRAPHIC_SXY(win), val);

The offset of source buffer can be set at bootloader so previous value can be keeped. I think MXR_GRAPHIC_SXY register should be cleared at mixer_win_reset function if you want to remove above lines.

> -
>  	/* setup offsets in display image */
>  	val  = MXR_GRP_DXY_DX(dst_x_offset);
>  	val |= MXR_GRP_DXY_DY(dst_y_offset);
> 
