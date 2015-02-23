From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 08/15] exynos: introduce g2d_add_base_addr helper function
Date: Mon, 23 Feb 2015 11:22:25 +0000
Message-ID: <54EB0D71.2000803@gmail.com>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1424094405-6314-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:46582 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbbBWLWV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Feb 2015 06:22:21 -0500
Received: by wevm14 with SMTP id m14so17241502wev.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Feb 2015 03:22:20 -0800 (PST)
In-Reply-To: <1424094405-6314-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, robclark@freedesktop.org, m.szyprowski@samsung.com

On 16/02/15 13:46, Tobias Jakobi wrote:
> In almost all functions the base address register is written, so it
> makes sense to have a helper function for this.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  exynos/exynos_fimg2d.c | 87 +++++++++++++++++++-------------------------------
>  1 file changed, 33 insertions(+), 54 deletions(-)
> 
> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
> index b79081e..c08974a 100644
> --- a/exynos/exynos_fimg2d.c
> +++ b/exynos/exynos_fimg2d.c
> @@ -41,6 +41,11 @@
>  
>  #define MIN(a, b)	((a) < (b) ? (a) : (b))
>  
> +enum g2d_base_addr_reg {
> +	g2d_dst = 0,
> +	g2d_src
> +};
> +
>  static unsigned int g2d_get_scaling(unsigned int src, unsigned int dst)
>  {
>  	/* The G2D hw scaling factor is a normalized inverse of the scaling factor. *
> @@ -132,6 +137,25 @@ static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
>  }
>  
>  /*
> + * g2d_add_base_addr - helper function to set dst/src base address register.
> + *
> + * @ctx: a pointer to g2d_context structure.
> + * @img: a pointer to the dst/src g2d_image structure.
> + * @reg: the register that should be set.
> + */
> +static void g2d_add_base_addr(struct g2d_context *ctx, struct g2d_image *img,
> +			enum g2d_base_addr_reg reg)
> +{
> +	const unsigned long cmd = (reg == g2d_dst) ? DST_BASE_ADDR_REG : SRC_BASE_ADDR_REG;
> +
Can we wrap this to 80 columns please ?

-Emil
