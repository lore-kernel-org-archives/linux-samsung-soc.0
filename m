From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 09/13] exynos/fimg2d: add g2d_move
Date: Fri, 30 Oct 2015 16:17:04 +0900
Message-ID: <20151030161704.33346dab@hwh-ubuntu>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-10-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34984 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777AbbJ3HRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 03:17:06 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX0002QBUWGUA10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Oct 2015 16:17:05 +0900 (KST)
In-reply-to: <1442937302-8211-10-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk

On Tue, 22 Sep 2015 17:54:58 +0200
Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:

> We already have g2d_copy() which implements G2D copy
> operations from one buffer to another. However we can't
> do a overlapping copy operation in one buffer.
> 
> Add g2d_move() which acts like the standard memmove()
> and properly handles overlapping copies.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 94
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> exynos/exynos_fimg2d.h |  3 ++ 2 files changed, 97 insertions(+)
> 
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 4d5419c..8703629 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -540,6 +540,100 @@ g2d_copy(struct g2d_context *ctx, struct
> g2d_image *src, }
>  
>  /**
> + * g2d_move - move content inside single buffer.
> + *	Similar to 'memmove' this moves a rectangular region
> + *	of the provided buffer to another location (the source
> + *	and destination region potentially overlapping).
> + *
> + * @ctx: a pointer to g2d_context structure.
> + * @img: a pointer to g2d_image structure providing
> + *	buffer information.
> + * @src_x: x position of source rectangle.
> + * @src_y: y position of source rectangle.
> + * @dst_x: x position of destination rectangle.
> + * @dst_y: y position of destination rectangle.
> + * @w: width of rectangle to move.
> + * @h: height of rectangle to move.
> + */
> +int
> +g2d_move(struct g2d_context *ctx, struct g2d_image *img,
> +		unsigned int src_x, unsigned int src_y,
> +		unsigned int dst_x, unsigned dst_y, unsigned int w,
> +		unsigned int h)
> +{
> +	union g2d_rop4_val rop4;
> +	union g2d_point_val pt;
> +	union g2d_direction_val dir;
> +	unsigned int src_w, src_h, dst_w, dst_h;
> +
> +	src_w = w;
> +	src_h = h;
> +	if (src_x + img->width > w)
> +		src_w = img->width - src_x;
> +	if (src_y + img->height > h)
> +		src_h = img->height - src_y;
> +
> +	dst_w = w;
> +	dst_h = w;
> +	if (dst_x + img->width > w)
> +		dst_w = img->width - dst_x;
> +	if (dst_y + img->height > h)
> +		dst_h = img->height - dst_y;
> +
> +	w = MIN(src_w, dst_w);
> +	h = MIN(src_h, dst_h);
> +
> +	if (w == 0 || h == 0) {
> +		fprintf(stderr, MSG_PREFIX "invalid width or
> height.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (g2d_check_space(ctx, 13, 2))
> +		return -ENOSPC;
> +
> +	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
> +	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
> +
> +	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, img->color_mode);
> +	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, img->color_mode);
> +
> +	g2d_add_base_addr(ctx, img, g2d_dst);
> +	g2d_add_base_addr(ctx, img, g2d_src);
> +
> +	g2d_add_cmd(ctx, DST_STRIDE_REG, img->stride);
> +	g2d_add_cmd(ctx, SRC_STRIDE_REG, img->stride);
> +
> +	dir.val[0] = dir.val[1] = 0;
> +
> +	if (dst_x >= src_x)
> +		dir.data.src_x_direction = dir.data.dst_x_direction
> = 1;
> +	if (dst_y >= src_y)
> +		dir.data.src_y_direction = dir.data.dst_y_direction
> = 1; +

As I commented in the patch 08/13, I think that direction is related
with flip. If I am right, these two if statements looks awkward.

Best regards,
Hyungwon Hwang

> +	g2d_set_direction(ctx, &dir);
> +
> +	pt.data.x = src_x;
> +	pt.data.y = src_y;
> +	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
> +	pt.data.x = src_x + w;
> +	pt.data.y = src_y + h;
> +	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
> +
> +	pt.data.x = dst_x;
> +	pt.data.y = dst_y;
> +	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
> +	pt.data.x = dst_x + w;
> +	pt.data.y = dst_y + h;
> +	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
> +
> +	rop4.val = 0;
> +	rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
> +	g2d_add_cmd(ctx, ROP4_REG, rop4.val);
> +
> +	return g2d_flush(ctx);
> +}
> +
> +/**
>   * g2d_copy_with_scale - copy contents in source buffer to
> destination buffer
>   *	scaling up or down properly.
>   *
> diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
> index 9eee7c0..2700686 100644
> --- a/exynos/exynos_fimg2d.h
> +++ b/exynos/exynos_fimg2d.h
> @@ -343,6 +343,9 @@ int g2d_copy(struct g2d_context *ctx, struct
> g2d_image *src, struct g2d_image *dst, unsigned int src_x,
>  		unsigned int src_y, unsigned int dst_x, unsigned int
> dst_y, unsigned int w, unsigned int h);
> +int g2d_move(struct g2d_context *ctx, struct g2d_image *img,
> +		unsigned int src_x, unsigned int src_y, unsigned int
> dst_x,
> +		unsigned dst_y, unsigned int w, unsigned int h);
>  int g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image
> *src, struct g2d_image *dst, unsigned int src_x,
>  				unsigned int src_y, unsigned int
> src_w,
