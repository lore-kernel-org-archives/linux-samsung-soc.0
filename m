From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] mfd: sec-irq: fix support for devices without irq specified
Date: Thu, 07 Aug 2014 18:48:21 +0200
Message-ID: <1471646.xbSCysvkpT@amdc1032>
References: <22704524.WE4thfvSda@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45937 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932330AbaHGQsZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 12:48:25 -0400
In-reply-to: <22704524.WE4thfvSda@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org


[ added missing linux-samsung-soc ML, sorry for the noise ]

On Thursday, August 07, 2014 06:42:28 PM Bartlomiej Zolnierkiewicz wrote:
> Add missing check for the case of device without irq specified
> in sec_irq_exit() (please note that sec_irq_init() already
> correctly handles such devices).
> 
> This is needed for Insignal's Exynos4412 based Origen board.
> 
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> patch is against next-20140804 branch of linux-next kernel
> 
>  drivers/mfd/sec-irq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index f9a5786..b65a7f0 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -478,5 +478,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  
>  void sec_irq_exit(struct sec_pmic_dev *sec_pmic)
>  {
> -	regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
> +	if (sec_pmic->irq)
> +		regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
>  }
