From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3-exynos fix axius clock error path to do cleanup
Date: Tue, 10 Jan 2017 21:27:50 -0300
Message-ID: <e4f0b77a-d827-08fa-c4f6-950197c54358@osg.samsung.com>
References: <20170110230528.7612-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110230528.7612-1-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Shuah,

Patch looks good to me, I've just one comment.

On 01/10/2017 08:05 PM, Shuah Khan wrote:
> Axius clock error path returns without disabling clock and suspend clock.
> Fix it to disable them before returning error.
> 
> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index 3e8407a..f7421c2 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -136,7 +136,8 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  		exynos->axius_clk = devm_clk_get(dev, "usbdrd30_axius_clk");
>  		if (IS_ERR(exynos->axius_clk)) {
>  			dev_err(dev, "no AXI UpScaler clk specified\n");
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto axius_clk_err;
>  		}
>  		clk_prepare_enable(exynos->axius_clk);
>  	} else {
> @@ -194,6 +195,7 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  	regulator_disable(exynos->vdd33);
>  err2:
>  	clk_disable_unprepare(exynos->axius_clk);
> +axius_clk_err:

This label isn't consistent with the others, I know the errN aren't great
so what about changing those to meaningful names in a preparatory patch?

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
