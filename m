From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/9] exynos: fimg2d: fix return codes
Date: Fri, 12 Jun 2015 16:57:34 +0100
Message-ID: <CACvgo50-A71yG1vtyyow_tEcAe4cUnpNfsbh8hAPYskju5AdxQ@mail.gmail.com>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1433943748-15849-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:46133 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242AbbFLP5e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 11:57:34 -0400
Received: by vnbf7 with SMTP id f7so6668440vnb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 08:57:34 -0700 (PDT)
In-Reply-To: <1433943748-15849-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Even if flushing the command buffer doesn't succeed, the
> G2D calls would still return zero. Fix this by just passing
> the flush return code.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index 86ae898..5ea42e6 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -330,9 +330,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
>         bitblt.data.fast_solid_color_fill_en = 1;
>         g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
>
> -       g2d_flush(ctx);
> -
> -       return 0;
> +       return g2d_flush(ctx);
>  }
>
>  /**
> @@ -415,9 +413,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
>         rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
>         g2d_add_cmd(ctx, ROP4_REG, rop4.val);
>
> -       g2d_flush(ctx);
> -
> -       return 0;
> +       return g2d_flush(ctx);
>  }
>
>  /**
> @@ -527,9 +523,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
>         pt.data.y = dst_y + dst_h;
>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>
> -       g2d_flush(ctx);
> -
> -       return 0;
> +       return g2d_flush(ctx);
>  }
>
>  /**
> @@ -636,9 +630,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
>         pt.data.y = dst_y + h;
>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>
> -       g2d_flush(ctx);
> -
> -       return 0;
> +       return g2d_flush(ctx);
>  }
>
>  /**
> @@ -766,7 +758,5 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
>         pt.data.y = dst_y + dst_h;
>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>
Strictly speaking g2d_add_cmd() can fail, and all the functions that
build upon it. In the latter case most ignore the return value which
is a bit bad. That plus the fact that these are part of the public API
makes things easier to misuse.

One way to avoid all this is to implement an internal function that
does the size checks ahead of time, and drop them from g2d_add_cmd(),
apart from this patch.

The nouveau mesa drivers do a similar thing - see PUSH_SPACE().

-Emil
