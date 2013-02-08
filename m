From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] pinctrl: samsung: remove duplicated line of
 samsung_pinctrl_register()
Date: Fri, 08 Feb 2013 14:44:31 -0800
Message-ID: <1a5901ce064d$dd8962e0$989c28a0$@samsung.com>
References: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53374 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760366Ab3BHWos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:44:48 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX0077JB6M6M00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:44:47 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00J3FB6LG310@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:44:47 +0900 (KST)
In-reply-to: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Jingoo Han wrote:
> 
> This patch removes duplicated line of samsung_pinctrl_register(),
> because the number of pins is redundantly assigned twice.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin

> ---
>  drivers/pinctrl/pinctrl-samsung.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-
> samsung.c
> index 294bcdd..3d5cf63 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -716,7 +716,6 @@ static int samsung_pinctrl_register(struct
> platform_device *pdev,
>  	}
>  	ctrldesc->pins = pindesc;
>  	ctrldesc->npins = drvdata->ctrl->nr_pins;
> -	ctrldesc->npins = drvdata->ctrl->nr_pins;
> 
>  	/* dynamically populate the pin number and pin name for pindesc */
>  	for (pin = 0, pdesc = pindesc; pin < ctrldesc->npins; pin++,
pdesc++)
> --
> 1.7.2.5
