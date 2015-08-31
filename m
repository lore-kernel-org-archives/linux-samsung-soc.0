From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 04/14] exynos/fimg2d: check buffer space in g2d_solid_fill()
Date: Mon, 31 Aug 2015 22:01:29 +0900
Message-ID: <55E45029.40009@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50392 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110AbbHaNBb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 09:01:31 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTY00Z766UHCL90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Aug 2015 22:01:29 +0900 (KST)
In-reply-to: <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:13, Tobias Jakobi wrote:
> The amount of commands (regular and GEM) doesn't depend
> on the input here.
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 1ae8adf..9b7bcce 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -319,6 +319,9 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2=
d_image *img,
>  	union g2d_bitblt_cmd_val bitblt;
>  	union g2d_point_val pt;
> =20
> +	if (g2d_check_space(ctx, 7, 1))
> +		return -ENOSPC;

You can make 3 and 4 patches to one. These should be same patch.

> +
>  	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
>  	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, img->color_mode);
>  	g2d_add_base_addr(ctx, img, g2d_dst);
>=20
