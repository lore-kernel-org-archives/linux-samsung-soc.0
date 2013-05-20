From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 30/33] arch/arm/plat-samsung: don't check resource with
 devm_ioremap_resource
Date: Tue, 21 May 2013 01:38:23 +0900
Message-ID: <519A517F.5020003@samsung.com>
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de> <1368702961-4325-31-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:63270 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755663Ab3ETQi1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 12:38:27 -0400
In-Reply-To: <1368702961-4325-31-git-send-email-wsa@the-dreams.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 05/16/13 20:15, Wolfram Sang wrote:
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
>
> Signed-off-by: Wolfram Sang<wsa@the-dreams.de>

Looks good to me, applied into Samsung tree.

Wolfram, if you want to take this into your tree, let me know.

Thanks.

- Kukjin

> ---
>   arch/arm/plat-samsung/adc.c |    5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
> index ca07cb1..79690f2 100644
> --- a/arch/arm/plat-samsung/adc.c
> +++ b/arch/arm/plat-samsung/adc.c
> @@ -381,11 +381,6 @@ static int s3c_adc_probe(struct platform_device *pdev)
>   	}
>
>   	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!regs) {
> -		dev_err(dev, "failed to find registers\n");
> -		return -ENXIO;
> -	}
> -
>   	adc->regs = devm_ioremap_resource(dev, regs);
>   	if (IS_ERR(adc->regs))
>   		return PTR_ERR(adc->regs);
