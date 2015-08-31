From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 09/14] exynos/fimg2d: check buffer space in
 g2d_scale_and_blend()
Date: Mon, 31 Aug 2015 22:20:44 +0900
Message-ID: <55E454AC.4050607@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-10-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52490 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031AbbHaNUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 09:20:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTY01HGY7QLXR60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Aug 2015 22:20:45 +0900 (KST)
In-reply-to: <1440425649-9768-10-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
> Apply the same transformation as in g2d_blend().
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 67 +++++++++++++++++++++++++++++-----------=
----------
>  1 file changed, 39 insertions(+), 28 deletions(-)
>=20
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 5acccf8..4274a94 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -745,9 +745,47 @@ g2d_scale_and_blend(struct g2d_context *ctx, str=
uct g2d_image *src,
>  	union g2d_point_val pt;
>  	union g2d_bitblt_cmd_val bitblt;
>  	union g2d_blend_func_val blend;
> -	unsigned int scale;
> +	unsigned int scale, gem_space;
>  	unsigned int scale_x, scale_y;
> =20
> +	if (src_w =3D=3D dst_w && src_h =3D=3D dst_h)
> +		scale =3D 0;
> +	else {
> +		scale =3D 1;
> +		scale_x =3D g2d_get_scaling(src_w, dst_w);
> +		scale_y =3D g2d_get_scaling(src_h, dst_h);
> +	}
> +
> +	if (src_x + src_w > src->width)
> +		src_w =3D src->width - src_x;
> +	if (src_y + src_h > src->height)
> +		src_h =3D src->height - src_y;
> +
> +	if (dst_x + dst_w > dst->width)
> +		dst_w =3D dst->width - dst_x;
> +	if (dst_y + dst_h > dst->height)
> +		dst_h =3D dst->height - dst_y;
> +
> +	if (src_w <=3D 0 || src_h <=3D 0 || dst_w <=3D 0 || dst_h <=3D 0) {
> +		fprintf(stderr, "invalid width or height.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (g2d_validate_select_mode(src->select_mode)) {
> +		fprintf(stderr , "invalid select mode for source.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (g2d_validate_blending_op(op)) {
> +		fprintf(stderr , "unsupported blending operation.\n");
> +		return -EINVAL;
> +	}
> +
> +	gem_space =3D src->select_mode =3D=3D G2D_SELECT_MODE_NORMAL ? 2 : =
1;
> +
> +	if (g2d_check_space(ctx, 12 + scale * 3, gem_space))
> +		return -ENOSPC;

Ditto.

Thanks,
Inki Dae

> +
>  	bitblt.val =3D 0;
>  	blend.val =3D 0;
> =20
> @@ -774,33 +812,6 @@ g2d_scale_and_blend(struct g2d_context *ctx, str=
uct g2d_image *src,
>  	case G2D_SELECT_MODE_BGCOLOR:
>  		g2d_add_cmd(ctx, BG_COLOR_REG, src->color);
>  		break;
> -	default:
> -		fprintf(stderr , "failed to set src.\n");
> -		return -EINVAL;
> -	}
> -
> -	if (src_w =3D=3D dst_w && src_h =3D=3D dst_h)
> -		scale =3D 0;
> -	else {
> -		scale =3D 1;
> -		scale_x =3D g2d_get_scaling(src_w, dst_w);
> -		scale_y =3D g2d_get_scaling(src_h, dst_h);
> -	}
> -
> -	if (src_x + src_w > src->width)
> -		src_w =3D src->width - src_x;
> -	if (src_y + src_h > src->height)
> -		src_h =3D src->height - src_y;
> -
> -	if (dst_x + dst_w > dst->width)
> -		dst_w =3D dst->width - dst_x;
> -	if (dst_y + dst_h > dst->height)
> -		dst_h =3D dst->height - dst_y;
> -
> -	if (src_w <=3D 0 || src_h <=3D 0 || dst_w <=3D 0 || dst_h <=3D 0) {
> -		fprintf(stderr, "invalid width or height.\n");
> -		g2d_reset(ctx);
> -		return -EINVAL;
>  	}
> =20
>  	if (scale) {
>=20
