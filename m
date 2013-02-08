From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] pinctrl: samsung: remove duplicated line of
 samsung_pinctrl_register()
Date: Fri, 08 Feb 2013 11:28:51 +0100
Message-ID: <6981182.GstG0O2YEu@amdc1227>
References: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52260 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760097Ab3BHK25 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 05:28:57 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHW00GOJD43EEA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 19:28:55 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHW009O8D455810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 19:28:55 +0900 (KST)
In-reply-to: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

On Friday 08 of February 2013 14:39:30 Jingoo Han wrote:
> This patch removes duplicated line of samsung_pinctrl_register(),
> because the number of pins is redundantly assigned twice.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/pinctrl/pinctrl-samsung.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-samsung.c
> b/drivers/pinctrl/pinctrl-samsung.c index 294bcdd..3d5cf63 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -716,7 +716,6 @@ static int samsung_pinctrl_register(struct
> platform_device *pdev, }
>  	ctrldesc->pins = pindesc;
>  	ctrldesc->npins = drvdata->ctrl->nr_pins;
> -	ctrldesc->npins = drvdata->ctrl->nr_pins;
> 
>  	/* dynamically populate the pin number and pin name for pindesc */
>  	for (pin = 0, pdesc = pindesc; pin < ctrldesc->npins; pin++, 
pdesc++)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
