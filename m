From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: fix size check in =?UTF-8?Q?g=32d=5Fcheck=5Fbuf?=
 =?UTF-8?Q?=5Fdesc=5Fis=5Fvalid=28=29?=
Date: Tue, 25 Aug 2015 17:51:33 +0200
Message-ID: <27fcb02bc8d4f7ba9aed7e785b657185@math.uni-bielefeld.de>
References: <1439851884-3346-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1439851884-3346-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52009 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751726AbbHYPvf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 11:51:35 -0400
In-Reply-To: <1439851884-3346-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com

Gentle ping!

Also please note that this is a critical fix. With the
incomplete check pagefaults can happen when the engine
accesses a invalid buffer position.

With best wishes,
Tobias


On 2015-08-18 00:51, Tobias Jakobi wrote:
> The size check was incomplete. It only computed the
> size of area of the drawing rectangle and checked if
> the size still fit inside the buffer.
> 
> The correct check is to compute the position of the
> last byte that the G2D engine is going to access and
> then check if that position is still contained in the
> buffer. In particular we need the stride information
> to determine this.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 51 
> ++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 211af37..535b4ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -48,11 +48,13 @@
> 
>  /* registers for base address */
>  #define G2D_SRC_BASE_ADDR		0x0304
> +#define G2D_SRC_STRIDE_REG		0x0308
>  #define G2D_SRC_COLOR_MODE		0x030C
>  #define G2D_SRC_LEFT_TOP		0x0310
>  #define G2D_SRC_RIGHT_BOTTOM		0x0314
>  #define G2D_SRC_PLANE2_BASE_ADDR	0x0318
>  #define G2D_DST_BASE_ADDR		0x0404
> +#define G2D_DST_STRIDE_REG		0x0408
>  #define G2D_DST_COLOR_MODE		0x040C
>  #define G2D_DST_LEFT_TOP		0x0410
>  #define G2D_DST_RIGHT_BOTTOM		0x0414
> @@ -148,6 +150,7 @@ struct g2d_cmdlist {
>   * A structure of buffer description
>   *
>   * @format: color format
> + * @stride: buffer stride/pitch in bytes
>   * @left_x: the x coordinates of left top corner
>   * @top_y: the y coordinates of left top corner
>   * @right_x: the x coordinates of right bottom corner
> @@ -156,6 +159,7 @@ struct g2d_cmdlist {
>   */
>  struct g2d_buf_desc {
>  	unsigned int	format;
> +	unsigned int	stride;
>  	unsigned int	left_x;
>  	unsigned int	top_y;
>  	unsigned int	right_x;
> @@ -589,6 +593,7 @@ static enum g2d_reg_type g2d_get_reg_type(int 
> reg_offset)
> 
>  	switch (reg_offset) {
>  	case G2D_SRC_BASE_ADDR:
> +	case G2D_SRC_STRIDE_REG:
>  	case G2D_SRC_COLOR_MODE:
>  	case G2D_SRC_LEFT_TOP:
>  	case G2D_SRC_RIGHT_BOTTOM:
> @@ -598,6 +603,7 @@ static enum g2d_reg_type g2d_get_reg_type(int 
> reg_offset)
>  		reg_type = REG_TYPE_SRC_PLANE2;
>  		break;
>  	case G2D_DST_BASE_ADDR:
> +	case G2D_DST_STRIDE_REG:
>  	case G2D_DST_COLOR_MODE:
>  	case G2D_DST_LEFT_TOP:
>  	case G2D_DST_RIGHT_BOTTOM:
> @@ -652,8 +658,8 @@ static bool g2d_check_buf_desc_is_valid(struct
> g2d_buf_desc *buf_desc,
>  						enum g2d_reg_type reg_type,
>  						unsigned long size)
>  {
> -	unsigned int width, height;
> -	unsigned long area;
> +	int width, height;
> +	unsigned long bpp, last_pos;
> 
>  	/*
>  	 * check source and destination buffers only.
> @@ -662,22 +668,37 @@ static bool g2d_check_buf_desc_is_valid(struct
> g2d_buf_desc *buf_desc,
>  	if (reg_type != REG_TYPE_SRC && reg_type != REG_TYPE_DST)
>  		return true;
> 
> -	width = buf_desc->right_x - buf_desc->left_x;
> +	/* This check also makes sure that right_x > left_x. */
> +	width = (int)buf_desc->right_x - (int)buf_desc->left_x;
>  	if (width < G2D_LEN_MIN || width > G2D_LEN_MAX) {
> -		DRM_ERROR("width[%u] is out of range!\n", width);
> +		DRM_ERROR("width[%d] is out of range!\n", width);
>  		return false;
>  	}
> 
> -	height = buf_desc->bottom_y - buf_desc->top_y;
> +	/* This check also makes sure that bottom_y > top_y. */
> +	height = (int)buf_desc->bottom_y - (int)buf_desc->top_y;
>  	if (height < G2D_LEN_MIN || height > G2D_LEN_MAX) {
> -		DRM_ERROR("height[%u] is out of range!\n", height);
> +		DRM_ERROR("height[%d] is out of range!\n", height);
>  		return false;
>  	}
> 
> -	area = (unsigned long)width * (unsigned long)height *
> -					g2d_get_buf_bpp(buf_desc->format);
> -	if (area > size) {
> -		DRM_ERROR("area[%lu] is out of range[%lu]!\n", area, size);
> +	bpp = g2d_get_buf_bpp(buf_desc->format);
> +
> +	/* Compute the position of the last byte that the engine accesses. */
> +	last_pos = ((unsigned long)buf_desc->bottom_y - 1) *
> +		(unsigned long)buf_desc->stride +
> +		(unsigned long)buf_desc->right_x * bpp - 1;
> +
> +	/*
> +	 * Since right_x > left_x and bottom_y > top_y we already know
> +	 * that the first_pos < last_pos (first_pos being the position
> +	 * of the first byte the engine accesses), it just remains to
> +	 * check if last_pos is smaller then the buffer size.
> +	 */
> +
> +	if (last_pos >= size) {
> +		DRM_ERROR("last engine access position [%lu] "
> +			"is out of range [%lu]!\n", last_pos, size);
>  		return false;
>  	}
> 
> @@ -981,6 +1002,16 @@ static int g2d_check_reg_offset(struct device 
> *dev,
>  			} else
>  				buf_info->types[reg_type] = BUF_TYPE_GEM;
>  			break;
> +		case G2D_SRC_STRIDE_REG:
> +		case G2D_DST_STRIDE_REG:
> +			if (for_addr)
> +				goto err;
> +
> +			reg_type = g2d_get_reg_type(reg_offset);
> +
> +			buf_desc = &buf_info->descs[reg_type];
> +			buf_desc->stride = cmdlist->data[index + 1];
> +			break;
>  		case G2D_SRC_COLOR_MODE:
>  		case G2D_DST_COLOR_MODE:
>  			if (for_addr)
