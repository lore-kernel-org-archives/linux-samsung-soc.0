From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 4/6] [media] exynos-gsc: Add hardware rotation limits
Date: Mon, 11 Sep 2017 11:35:15 +0200
Message-ID: <27b46679-e6c7-2471-f10e-3f0634178ebf@samsung.com>
References: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170908060309epcas1p3d48dd0871d3fde02ba3c9921bbe5a7a6@epcas1p3.samsung.com>
        <1504850560-27950-5-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1504850560-27950-5-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/08/2017 08:02 AM, Hoegeun Kwon wrote:
> The hardware rotation limits of gsc depends on SOC (Exynos
> 5250/5420/5433). Distinguish them and add them to the driver data.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   drivers/media/platform/exynos-gsc/gsc-core.c | 96 ++++++++++++++++++++++++----
>   1 file changed, 83 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 4380150..8f8636e 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -943,7 +943,37 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   	return IRQ_HANDLED;
>   }
>   
> -static struct gsc_pix_max gsc_v_100_max = {
> +static struct gsc_pix_max gsc_v_5250_max = {
> +	.org_scaler_bypass_w	= 8192,
> +	.org_scaler_bypass_h	= 8192,
> +	.org_scaler_input_w	= 4800,
> +	.org_scaler_input_h	= 3344,
> +	.real_rot_dis_w		= 4800,
> +	.real_rot_dis_h		= 3344,
> +	.real_rot_en_w		= 2016,
> +	.real_rot_en_h		= 2016,
> +	.target_rot_dis_w	= 4800,
> +	.target_rot_dis_h	= 3344,
> +	.target_rot_en_w	= 2016,
> +	.target_rot_en_h	= 2016,
> +};
> +
> +static struct gsc_pix_max gsc_v_5420_max = {
> +	.org_scaler_bypass_w	= 8192,
> +	.org_scaler_bypass_h	= 8192,
> +	.org_scaler_input_w	= 4800,
> +	.org_scaler_input_h	= 3344,
> +	.real_rot_dis_w		= 4800,
> +	.real_rot_dis_h		= 3344,
> +	.real_rot_en_w		= 2048,
> +	.real_rot_en_h		= 2048,
> +	.target_rot_dis_w	= 4800,
> +	.target_rot_dis_h	= 3344,
> +	.target_rot_en_w	= 2016,
> +	.target_rot_en_h	= 2016,
> +};
> +
> +static struct gsc_pix_max gsc_v_5433_max = {
>   	.org_scaler_bypass_w	= 8192,
>   	.org_scaler_bypass_h	= 8192,
>   	.org_scaler_input_w	= 4800,
> @@ -979,8 +1009,8 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   	.target_h		= 2,  /* yuv420 : 2, others : 1 */
>   };
>   
> -static struct gsc_variant gsc_v_100_variant = {
> -	.pix_max		= &gsc_v_100_max,
> +static struct gsc_variant gsc_v_5250_variant = {
> +	.pix_max		= &gsc_v_5250_max,
>   	.pix_min		= &gsc_v_100_min,
>   	.pix_align		= &gsc_v_100_align,
>   	.in_buf_cnt		= 32,
> @@ -992,12 +1022,48 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   	.local_sc_down		= 2,
>   };
>   
> -static struct gsc_driverdata gsc_v_100_drvdata = {
> +static struct gsc_variant gsc_v_5420_variant = {
> +	.pix_max		= &gsc_v_5420_max,
> +	.pix_min		= &gsc_v_100_min,
> +	.pix_align		= &gsc_v_100_align,
> +	.in_buf_cnt		= 32,
> +	.out_buf_cnt		= 32,
> +	.sc_up_max		= 8,
> +	.sc_down_max		= 16,
> +	.poly_sc_down_max	= 4,
> +	.pre_sc_down_max	= 4,
> +	.local_sc_down		= 2,
> +};
> +
> +static struct gsc_variant gsc_v_5433_variant = {
> +	.pix_max		= &gsc_v_5433_max,
> +	.pix_min		= &gsc_v_100_min,
> +	.pix_align		= &gsc_v_100_align,
> +	.in_buf_cnt		= 32,
> +	.out_buf_cnt		= 32,
> +	.sc_up_max		= 8,
> +	.sc_down_max		= 16,
> +	.poly_sc_down_max	= 4,
> +	.pre_sc_down_max	= 4,
> +	.local_sc_down		= 2,
> +};
> +
> +static struct gsc_driverdata gsc_v_5250_drvdata = {
>   	.variant = {
> -		[0] = &gsc_v_100_variant,
> -		[1] = &gsc_v_100_variant,
> -		[2] = &gsc_v_100_variant,
> -		[3] = &gsc_v_100_variant,
> +		[0] = &gsc_v_5250_variant,
> +		[1] = &gsc_v_5250_variant,
> +		[2] = &gsc_v_5250_variant,
> +		[3] = &gsc_v_5250_variant,
> +	},
> +	.num_entities = 4,
> +	.clk_names = { "gscl" },
> +	.num_clocks = 1,
> +};
> +
> +static struct gsc_driverdata gsc_v_5420_drvdata = {
> +	.variant = {
> +		[0] = &gsc_v_5420_variant,
> +		[1] = &gsc_v_5420_variant,
>   	},
>   	.num_entities = 4,
>   	.clk_names = { "gscl" },
> @@ -1006,9 +1072,9 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   
>   static struct gsc_driverdata gsc_5433_drvdata = {
>   	.variant = {
> -		[0] = &gsc_v_100_variant,
> -		[1] = &gsc_v_100_variant,
> -		[2] = &gsc_v_100_variant,
> +		[0] = &gsc_v_5433_variant,
> +		[1] = &gsc_v_5433_variant,
> +		[2] = &gsc_v_5433_variant,
>   	},
>   	.num_entities = 3,
>   	.clk_names = { "pclk", "aclk", "aclk_xiu", "aclk_gsclbend" },
> @@ -1017,8 +1083,12 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   
>   static const struct of_device_id exynos_gsc_match[] = {
>   	{
> -		.compatible = "samsung,exynos5-gsc",
> -		.data = &gsc_v_100_drvdata,

Can you keep the "samsung,exynos5-gsc" entry with the gsc_v_5250_variant
data, so that it can work with "samsung,exynos5-gsc" compatible in DT
on both exynos5250 and exynos5420 SoCs?

> +		.compatible = "samsung,exynos5250-gsc",
> +		.data = &gsc_v_5250_drvdata,
> +	},
> +	{
> +		.compatible = "samsung,exynos5420-gsc",
> +		.data = &gsc_v_5420_drvdata,
>   	},

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
