From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 08/13] exynos: fimg2d: add g2d_set_direction
Date: Thu, 26 Nov 2015 16:22:19 +0000
Message-ID: <CACvgo53G9a7kqYgWKs+Mvxs=4Y_ZDnFZBzRirEmxLN3s_U2Z=A@mail.gmail.com>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1448218123-21292-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35140 "EHLO
	mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751457AbbKZQWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 11:22:19 -0500
Received: by ioc74 with SMTP id 74so90921331ioc.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2015 08:22:19 -0800 (PST)
In-Reply-To: <1448218123-21292-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On 22 November 2015 at 18:48, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> This allows setting the two direction registers, which specify how
> the engine blits pixels. This can be used for overlapping blits,
> which happen e.g. when 'moving' a rectangular region inside a
> fixed buffer.
>
> Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 13 +++++++++++++
>  exynos/exynos_fimg2d.h | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index e997d4b..4d5419c 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -242,6 +242,19 @@ static void g2d_add_base_addr(struct g2d_context *ctx, struct g2d_image *img,
>  }
>
>  /*
> + * g2d_set_direction - setup direction register (useful for overlapping blits).
> + *
> + * @ctx: a pointer to g2d_context structure.
> + * @dir: a pointer to the g2d_direction_val structure.
> + */
> +static void g2d_set_direction(struct g2d_context *ctx,
> +                       const union g2d_direction_val *dir)
> +{
> +       g2d_add_cmd(ctx, SRC_MASK_DIRECT_REG, dir->val[0]);
> +       g2d_add_cmd(ctx, DST_PAT_DIRECT_REG, dir->val[1]);
> +}
> +
> +/*
>   * g2d_reset - reset fimg2d hardware.
>   *
>   * @ctx: a pointer to g2d_context structure.
> diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
> index c6b58ac..9eee7c0 100644
> --- a/exynos/exynos_fimg2d.h
> +++ b/exynos/exynos_fimg2d.h
> @@ -189,6 +189,11 @@ enum e_g2d_exec_flag {
>         G2D_EXEC_FLAG_ASYNC = (1 << 0)
>  };
>
> +enum e_g2d_dir_mode {
> +       G2D_DIR_MODE_POSITIVE = 0,
> +       G2D_DIR_MODE_NEGATIVE = 1
> +};
> +
>  union g2d_point_val {
>         unsigned int val;
>         struct {
> @@ -269,6 +274,39 @@ union g2d_blend_func_val {
>         } data;
>  };
>
> +union g2d_direction_val {
> +       unsigned int val[2];
> +       struct {
> +               /* SRC_MSK_DIRECT_REG [0:1] (source) */
> +               enum e_g2d_dir_mode             src_x_direction:1;
> +               enum e_g2d_dir_mode             src_y_direction:1;
> +
> +               /* SRC_MSK_DIRECT_REG [2:3] */
> +               unsigned int                    reversed1:2;
> +
> +               /* SRC_MSK_DIRECT_REG [4:5] (mask) */
> +               enum e_g2d_dir_mode             mask_x_direction:1;
> +               enum e_g2d_dir_mode             mask_y_direction:1;
> +
> +               /* SRC_MSK_DIRECT_REG [6:31] */
> +               unsigned int                    padding1:26;
> +
> +               /* DST_PAT_DIRECT_REG [0:1] (destination) */
> +               enum e_g2d_dir_mode             dst_x_direction:1;
> +               enum e_g2d_dir_mode             dst_y_direction:1;
> +
> +               /* DST_PAT_DIRECT_REG [2:3] */
> +               unsigned int                    reversed2:2;
> +
> +               /* DST_PAT_DIRECT_REG [4:5] (pattern) */
> +               enum e_g2d_dir_mode             pat_x_direction:1;
> +               enum e_g2d_dir_mode             pat_y_direction:1;
> +
> +               /* DST_PAT_DIRECT_REG [6:31] */
> +               unsigned int                    padding2:26;
> +       } data;
> +};
> +
You don't really want all this in the public header. At the moment
you're using it only internally so might as well not make it part of
the API.

Thanks
Emil
