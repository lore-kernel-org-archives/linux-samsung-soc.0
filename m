From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] rtc: s3c: add device data for samsung,exynos3250-rtc
Date: Mon, 11 Jul 2016 07:49:53 +0200
Message-ID: <57833381.7050503@samsung.com>
References: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
 <1468056226-19128-3-git-send-email-ayaka@soulik.info>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKZNNNLXAHBBB7HRS6AKGQEDJRO3MA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-reply-to: <1468056226-19128-3-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/09/2016 11:23 AM, Randy Li wrote:
> The device data for samsung,exynos3250-rtc and samsung,s3c6410-rtc
> are just have a difference, but keeping using the same device data
> would cause the platform using the other IP core not work.

I cannot understand what you wanted to say here. Please rephrase it.

Why not just reverting a42e6eae457837d6a5925f4926f5ba05ccf44f89?

Best regards,
Krzysztof

> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  drivers/rtc/rtc-s3c.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5dc18ca..e9f6151 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -810,6 +810,18 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
>  	.disable		= s3c6410_rtc_disable,
>  };
>  
> +static struct s3c_rtc_data const exynos3250_rtc_data = {
> +	.max_user_freq		= 32768,
> +	.needs_src_clk          = true,
> +	.irq_handler		= s3c6410_rtc_irq,
> +	.set_freq		= s3c6410_rtc_setfreq,
> +	.enable_tick		= s3c6410_rtc_enable_tick,
> +	.save_tick_cnt		= s3c6410_rtc_save_tick_cnt,
> +	.restore_tick_cnt	= s3c6410_rtc_restore_tick_cnt,
> +	.enable			= s3c24xx_rtc_enable,
> +	.disable		= s3c6410_rtc_disable,
> +};
> +
>  static const struct of_device_id s3c_rtc_dt_match[] = {
>  	{
>  		.compatible = "samsung,s3c2410-rtc",
> @@ -825,7 +837,7 @@ static const struct of_device_id s3c_rtc_dt_match[] = {
>  		.data = (void *)&s3c6410_rtc_data,
>  	}, {
>  		.compatible = "samsung,exynos3250-rtc",
> -		.data = (void *)&s3c6410_rtc_data,
> +		.data = (void *)&exynos3250_rtc_data,
>  	},
>  	{ /* sentinel */ },
>  };
> 

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
