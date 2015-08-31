From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 05/14] exynos/fimg2d: check buffer space in g2d_copy()
Date: Mon, 31 Aug 2015 22:06:44 +0900
Message-ID: <55E45164.7090205@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-6-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44011 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322AbbHaNGq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 09:06:46 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTY00ZGM738CL90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Aug 2015 22:06:44 +0900 (KST)
In-reply-to: <1440425649-9768-6-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
> Move the parameter validation before buffer space checking
> so that we can exit early if it fails.
> Also don't reset the G2D context anymore in this situation
> (since the buffers are not partially submitted).
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 9b7bcce..185aa80 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -375,17 +375,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_ima=
ge *src,
>  {
>  	union g2d_rop4_val rop4;
>  	union g2d_point_val pt;
> -	unsigned int src_w =3D 0, src_h =3D 0, dst_w =3D 0, dst_h =3D 0;
> -
> -	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
> -	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
> -	g2d_add_base_addr(ctx, dst, g2d_dst);
> -	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
> -
> -	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
> -	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
> -	g2d_add_base_addr(ctx, src, g2d_src);
> -	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
> +	unsigned int src_w, src_h, dst_w, dst_h;
> =20
>  	src_w =3D w;
>  	src_h =3D h;
> @@ -406,10 +396,22 @@ g2d_copy(struct g2d_context *ctx, struct g2d_im=
age *src,
> =20
>  	if (w <=3D 0 || h <=3D 0) {
>  		fprintf(stderr, "invalid width or height.\n");
> -		g2d_reset(ctx);
>  		return -EINVAL;
>  	}
> =20
> +	if (g2d_check_space(ctx, 11, 2))
> +		return -ENOSPC;

Above lines could be integrated with 3 and 4 patches as one patch. And
you can make other codes to other one.

Thanks,
Inki Dae

> +
> +	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
> +	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
> +	g2d_add_base_addr(ctx, dst, g2d_dst);
> +	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
> +
> +	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
> +	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
> +	g2d_add_base_addr(ctx, src, g2d_src);
> +	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
> +
>  	pt.val =3D 0;
>  	pt.data.x =3D src_x;
>  	pt.data.y =3D src_y;
>=20
