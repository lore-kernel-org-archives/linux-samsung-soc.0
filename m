From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [RFC 39/42] arch/arm/plat-samsung: don't check resource with
 devm_ioremap_resource
Date: Sat, 11 May 2013 14:15:05 +0900
Message-ID: <002601ce4e06$7f68fbc0$7e3af340$@samsung.com>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
 <1368173847-5661-40-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25615 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247Ab3EKFPH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 May 2013 01:15:07 -0400
In-reply-to: <1368173847-5661-40-git-send-email-wsa@the-dreams.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wolfram Sang' <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Friday, May 10, 2013 5:17 PM, Wolfram Sang wrote:
> 
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/plat-samsung/adc.c |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
> index ca07cb1..79690f2 100644
> --- a/arch/arm/plat-samsung/adc.c
> +++ b/arch/arm/plat-samsung/adc.c
> @@ -381,11 +381,6 @@ static int s3c_adc_probe(struct platform_device *pdev)
>  	}
> 
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!regs) {
> -		dev_err(dev, "failed to find registers\n");
> -		return -ENXIO;
> -	}
> -
>  	adc->regs = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(adc->regs))
>  		return PTR_ERR(adc->regs);
> --
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
