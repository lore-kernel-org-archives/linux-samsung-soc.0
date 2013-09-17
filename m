From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] irqchip: exynos-combiner: remove hard-coded irq_base value
Date: Tue, 17 Sep 2013 14:37:27 +0200
Message-ID: <2060959.cLD86Prq58@amdc1227>
References: <1379309482-19779-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57044 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752340Ab3IQMhh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Sep 2013 08:37:37 -0400
In-reply-to: <1379309482-19779-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tglx@linutronix.de, thomas.ab@samsung.com

Hi Chander,

On Monday 16 of September 2013 11:01:22 Chander Kashyap wrote:
> Pass '0' in place of hardcoded "irq_base" value as "first_irq" parameter
> to "irq_domain_add_simple" in order to use linear irq domain.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
>  drivers/irqchip/exynos-combiner.c |   15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/exynos-combiner.c
> b/drivers/irqchip/exynos-combiner.c index 4c68265..b4ed356 100644
> --- a/drivers/irqchip/exynos-combiner.c
> +++ b/drivers/irqchip/exynos-combiner.c
> @@ -206,8 +206,7 @@ static unsigned int combiner_lookup_irq(int group)
> 
>  static void __init combiner_init(void __iomem *combiner_base,
>  				 struct device_node *np,
> -				 unsigned int max_nr,
> -				 int irq_base)
> +				 unsigned int max_nr)
>  {
>  	int i, irq;
>  	unsigned int nr_irq;
> @@ -221,7 +220,7 @@ static void __init combiner_init(void __iomem
> *combiner_base, return;
>  	}
> 
> -	combiner_irq_domain = irq_domain_add_simple(np, nr_irq, irq_base,
> +	combiner_irq_domain = irq_domain_add_simple(np, nr_irq, 0,
>  				&combiner_irq_domain_ops, combiner_data);

I believe you can safely go with calling irq_domain_add_linear() directly 
here.

Otherwise the patch looks good.

Best regards,
Tomasz
