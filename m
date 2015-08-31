From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 07/14] exynos/fimg2d: add g2d_validate_xyz() functions
Date: Mon, 31 Aug 2015 22:18:33 +0900
Message-ID: <55E45429.3070500@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-8-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45713 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752807AbbHaNSf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 09:18:35 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTY01QLV7MXXX40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Aug 2015 22:18:33 +0900 (KST)
In-reply-to: <1440425649-9768-8-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
> The G2D headers define a number of modes through enums
> (like e.g. color, select, repeat, etc.).
>=20
> This introduces g2d_validate_select_mode() and
> g2d_validate_blending_op() which validate a
> select mode or blending operation respectively.
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 44 ++++++++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 2e04f4a..781aff5 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -119,6 +119,50 @@ static unsigned int g2d_check_space(const struct=
 g2d_context *ctx,
>  }
> =20
>  /*
> + * g2d_validate_select_mode - validate select mode.
> + *
> + * @mode: the mode to validate
> + */
> +static unsigned int g2d_validate_select_mode(
> +	enum e_g2d_select_mode mode)
> +{
> +	switch (mode) {
> +	case G2D_SELECT_MODE_NORMAL:
> +	case G2D_SELECT_MODE_FGCOLOR:
> +	case G2D_SELECT_MODE_BGCOLOR:
> +		return 0;
> +	}

It's strange use a bit. Just check the range like below,

=46irst, please add G2D_SELECT_MODE_MAX which has 3 << 0, and

if (G2D_SELECT_MODE_MAX < mode) {
	fprintf(strerr, "invalid command(0x%x)\n", mode);
	return -EINVAL;
}

And I think it'd be better to change return type of this function to in=
t,

> +
> +	return 1;

so return 0

> +}
> +
> +/*
> + * g2d_validate_blending_op - validate blending operation.
> + *
> + * @operation: the operation to validate
> + */
> +static unsigned int g2d_validate_blending_op(
> +	enum e_g2d_op operation)
> +{
> +	switch (operation) {
> +	case G2D_OP_CLEAR:
> +	case G2D_OP_SRC:
> +	case G2D_OP_DST:
> +	case G2D_OP_OVER:
> +	case G2D_OP_INTERPOLATE:
> +	case G2D_OP_DISJOINT_CLEAR:
> +	case G2D_OP_DISJOINT_SRC:
> +	case G2D_OP_DISJOINT_DST:
> +	case G2D_OP_CONJOINT_CLEAR:
> +	case G2D_OP_CONJOINT_SRC:
> +	case G2D_OP_CONJOINT_DST:
> +		return 0;

Ditto, You could modify it like above.

Thanks,
Inki Dae

> +	}
> +
> +	return 1;
> +}
> +
> +/*
>   * g2d_add_cmd - set given command and value to user side command bu=
ffer.
>   *
>   * @ctx: a pointer to g2d_context structure.
>=20
