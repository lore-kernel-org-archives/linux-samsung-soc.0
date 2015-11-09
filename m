From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 10/13] tests/exynos: add test for g2d_move
Date: Mon, 09 Nov 2015 16:36:31 +0900
Message-ID: <20151109163631.13d41d5f@hwh-ubuntu>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-11-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60199 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKIHge (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2015 02:36:34 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NXJ01K98EGVQF90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Nov 2015 16:36:31 +0900 (KST)
In-reply-to: <1442937302-8211-11-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk

Hello,

I think this patch should update .gitignore, not for adding the built
binary to untracked file list.

But without it, it looks good to me, and I tested it on my Odroid U3
board.

Tested-by: Hyungwon Hwang <human.hwang@samsung.com>
Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>

Best regards,
Hyungwon Hwang


On Tue, 22 Sep 2015 17:54:59 +0200
Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:

> To check if g2d_move() works properly we create a small checkerboard
> pattern in the center of the screen and then shift this pattern
> around with g2d_move(). The pattern should be properly preserved
> by the operation.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  tests/exynos/exynos_fimg2d_test.c | 132
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 132
> insertions(+)
> 
> diff --git a/tests/exynos/exynos_fimg2d_test.c
> b/tests/exynos/exynos_fimg2d_test.c index dfb00a0..797fb6e 100644
> --- a/tests/exynos/exynos_fimg2d_test.c
> +++ b/tests/exynos/exynos_fimg2d_test.c
> @@ -313,6 +313,130 @@ fail:
>  	return ret;
>  }
>  
> +static int g2d_move_test(struct exynos_device *dev,
> +				struct exynos_bo *tmp,
> +				struct exynos_bo *buf,
> +				enum e_g2d_buf_type type)
> +{
> +	struct g2d_context *ctx;
> +	struct g2d_image img = {0}, tmp_img = {0};
> +	unsigned int img_w, img_h, count;
> +	int cur_x, cur_y;
> +	void *checkerboard;
> +	int ret;
> +
> +	static const struct g2d_step {
> +		int x, y;
> +	} steps[] = {
> +		{ 1,  0}, { 0,  1},
> +		{-1,  0}, { 0, -1},
> +		{ 1,  1}, {-1, -1},
> +		{ 1, -1}, {-1,  1},
> +		{ 2,  1}, { 1,  2},
> +		{-2, -1}, {-1, -2},
> +		{ 2, -1}, { 1, -2},
> +		{-2,  1}, {-1,  2}
> +	};
> +	static const unsigned int num_steps =
> +		sizeof(steps) / sizeof(struct g2d_step);
> +
> +	ctx = g2d_init(dev->fd);
> +	if (!ctx)
> +		return -EFAULT;
> +
> +	img.bo[0] = buf->handle;
> +
> +	/* create pattern of half the screen size */
> +	checkerboard = create_checkerboard_pattern(screen_width /
> 64, screen_height / 64, 32);
> +	if (!checkerboard) {
> +		ret = -EFAULT;
> +		goto fail;
> +	}
> +
> +	img_w = (screen_width / 64) * 32;
> +	img_h = (screen_height / 64) * 32;
> +
> +	switch (type) {
> +	case G2D_IMGBUF_GEM:
> +		memcpy(tmp->vaddr, checkerboard, img_w * img_h * 4);
> +		tmp_img.bo[0] = tmp->handle;
> +		break;
> +	case G2D_IMGBUF_USERPTR:
> +		tmp_img.user_ptr[0].userptr = (unsigned
> long)checkerboard;
> +		tmp_img.user_ptr[0].size = img_w * img_h * 4;
> +		break;
> +	case G2D_IMGBUF_COLOR:
> +	default:
> +		ret = -EFAULT;
> +		goto fail;
> +	}
> +
> +	/* solid fill framebuffer with white color */
> +	img.width = screen_width;
> +	img.height = screen_height;
> +	img.stride = screen_width * 4;
> +	img.buf_type = G2D_IMGBUF_GEM;
> +	img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
> +	img.color = 0xffffffff;
> +
> +	/* put checkerboard pattern in the center of the framebuffer
> */
> +	cur_x = (screen_width - img_w) / 2;
> +	cur_y = (screen_height - img_h) / 2;
> +	tmp_img.width = img_w;
> +	tmp_img.height = img_h;
> +	tmp_img.stride = img_w * 4;
> +	tmp_img.buf_type = type;
> +	tmp_img.color_mode = G2D_COLOR_FMT_ARGB8888 |
> G2D_ORDER_AXRGB; +
> +	ret = g2d_solid_fill(ctx, &img, 0, 0, screen_width,
> screen_height) ||
> +		g2d_copy(ctx, &tmp_img, &img, 0, 0, cur_x, cur_y,
> img_w, img_h); +
> +	if (!ret)
> +		ret = g2d_exec(ctx);
> +	if (ret < 0)
> +			goto fail;
> +
> +	printf("move test with %s.\n",
> +			type == G2D_IMGBUF_GEM ? "gem" : "userptr");
> +
> +	srand(time(NULL));
> +	for (count = 0; count < 256; ++count) {
> +		const struct g2d_step *s;
> +
> +		/* select step and validate it */
> +		while (1) {
> +			s = &steps[random() % num_steps];
> +
> +			if (cur_x + s->x < 0 || cur_y + s->y < 0 ||
> +				cur_x + img_w + s->x >= screen_width
> ||
> +				cur_y + img_h + s->y >=
> screen_height)
> +				continue;
> +			else
> +				break;
> +		}
> +
> +		ret = g2d_move(ctx, &img, cur_x, cur_y, cur_x +
> s->x, cur_y + s->y,
> +			img_w, img_h);
> +		if (!ret)
> +			ret = g2d_exec(ctx);
> +
> +		if (ret < 0)
> +			goto fail;
> +
> +		cur_x += s->x;
> +		cur_y += s->y;
> +
> +		usleep(100000);
> +	}
> +
> +fail:
> +	g2d_fini(ctx);
> +
> +	free(checkerboard);
> +
> +	return ret;
> +}
> +
>  static int g2d_copy_with_scale_test(struct exynos_device *dev,
>  					struct exynos_bo *src,
>  					struct exynos_bo *dst,
> @@ -708,6 +832,14 @@ int main(int argc, char **argv)
>  
>  	wait_for_user_input(0);
>  
> +	ret = g2d_move_test(dev, src, bo, G2D_IMGBUF_GEM);
> +	if (ret < 0) {
> +		fprintf(stderr, "failed to test move operation.\n");
> +		goto err_free_src;
> +	}
> +
> +	wait_for_user_input(0);
> +
>  	ret = g2d_copy_with_scale_test(dev, src, bo, G2D_IMGBUF_GEM);
>  	if (ret < 0) {
>  		fprintf(stderr, "failed to test copy and scale
> operation.\n");
