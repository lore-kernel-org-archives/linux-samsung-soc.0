From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] watchdog: s3c2410: Constify local structures
Date: Tue, 14 Mar 2017 06:47:51 -0700
Message-ID: <7b5ab910-2d3b-e36f-8418-25e2ffc0d647@roeck-us.net>
References: <20170313190726.2988-1-krzk@kernel.org>
 <20170313190726.2988-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313190726.2988-2-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/13/2017 12:07 PM, Krzysztof Kozlowski wrote:
> Structures watchdog_device, watchdog_ops and s3c2410_wdt_variant are not
> modified so they can be made const to increase code safeness.
>
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 6ed97596ca80..52b66bcdd1ef 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -131,7 +131,7 @@ struct s3c2410_wdt {
>  	unsigned long		wtdat_save;
>  	struct watchdog_device	wdt_device;
>  	struct notifier_block	freq_transition;
> -	struct s3c2410_wdt_variant *drv_data;
> +	const struct s3c2410_wdt_variant *drv_data;
>  	struct regmap *pmureg;
>  };
>
> @@ -401,7 +401,7 @@ static const struct watchdog_ops s3c2410wdt_ops = {
>  	.restart = s3c2410wdt_restart,
>  };
>
> -static struct watchdog_device s3c2410_wdd = {
> +static const struct watchdog_device s3c2410_wdd = {
>  	.info = &s3c2410_wdt_ident,
>  	.ops = &s3c2410wdt_ops,
>  	.timeout = S3C2410_WATCHDOG_DEFAULT_TIME,
> @@ -507,7 +507,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
>  	return 0;
>  }
>
> -static inline struct s3c2410_wdt_variant *
> +static inline const struct s3c2410_wdt_variant *
>  s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  {
>  	if (pdev->dev.of_node) {
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
