From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3-exynos fix unspecified suspend clk error
 handling
Date: Tue, 10 Jan 2017 14:20:09 +0300
Message-ID: <82fb5295-6640-7e9e-a42a-4067aa88e5b4@cogentembedded.com>
References: <20170110022131.31042-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110022131.31042-1-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello!

On 01/10/2017 05:21 AM, Shuah Khan wrote:

> Fix dwc3_exynos_probe() to call clk_prepare_enable() only when suspend
> clock is specified. Call clk_disable_unprepare() from remove and probe
> error path only when susp_clk has been set from remove and probe error
> paths.
>
> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index e27899b..f97a3d7 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -131,8 +131,8 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  	if (IS_ERR(exynos->susp_clk)) {
>  		dev_info(dev, "no suspend clk specified\n");
>  		exynos->susp_clk = NULL;
> -	}
> -	clk_prepare_enable(exynos->susp_clk);
> +	} else
> +		clk_prepare_enable(exynos->susp_clk);

    CodingStyle: need {} here as well since another branch has them.

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
