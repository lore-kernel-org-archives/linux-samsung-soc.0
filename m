From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S3C64XX: Use chip_data to store the shift for
 EINTs
Date: Wed, 01 Dec 2010 20:44:25 +0900
Message-ID: <003101cb914d$1caf7040$560e50c0$%kim@samsung.com>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1290698309-7691-3-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10459 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233Ab0LALok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:44:40 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCQ00822ZAESF30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:44:38 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCQ00KQXZAETS@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:44:38 +0900 (KST)
In-reply-to: <1290698309-7691-3-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> This makes all the functions that use the shift slightly smaller, one
> instruction in most cases but more for ack() and maskack().
> 
Hi Mark,

Uhm...I'm not sure to use chip_data for the eint_irq_to_bit() is best to us.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/irq-eint.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/irq-eint.c b/arch/arm/mach-s3c64xx/irq-
> eint.c
> index 169ee29..2ead818 100644
> --- a/arch/arm/mach-s3c64xx/irq-eint.c
> +++ b/arch/arm/mach-s3c64xx/irq-eint.c
> @@ -30,14 +30,14 @@
>  #include <plat/pm.h>
> 
>  #define eint_offset(irq)	((irq) - IRQ_EINT(0))
> -#define eint_irq_to_bit(irq)	(1 << eint_offset(irq))
> +#define eint_irq_to_bit(irq)	((u32)(1 << eint_offset(irq)))
> 
>  static inline void s3c_irq_eint_mask(struct irq_data *data)
>  {
>  	u32 mask;
> 
>  	mask = __raw_readl(S3C64XX_EINT0MASK);
> -	mask |= eint_irq_to_bit(data->irq);
> +	mask |= (u32)data->chip_data;
>  	__raw_writel(mask, S3C64XX_EINT0MASK);
>  }
> 
> @@ -46,13 +46,13 @@ static void s3c_irq_eint_unmask(struct irq_data *data)
>  	u32 mask;
> 
>  	mask = __raw_readl(S3C64XX_EINT0MASK);
> -	mask &= ~eint_irq_to_bit(data->irq);
> +	mask &= ~((u32)data->chip_data);
>  	__raw_writel(mask, S3C64XX_EINT0MASK);
>  }
> 
>  static inline void s3c_irq_eint_ack(struct irq_data *data)
>  {
> -	__raw_writel(eint_irq_to_bit(data->irq), S3C64XX_EINT0PEND);
> +	__raw_writel((u32)data->chip_data, S3C64XX_EINT0PEND);
>  }
> 
>  static void s3c_irq_eint_maskack(struct irq_data *data)
> @@ -198,6 +198,7 @@ static int __init s3c64xx_init_irq_eint(void)
> 
>  	for (irq = IRQ_EINT(0); irq <= IRQ_EINT(27); irq++) {
>  		set_irq_chip(irq, &s3c_irq_eint);
> +		set_irq_chip_data(irq, (void *)eint_irq_to_bit(irq));
>  		set_irq_handler(irq, handle_level_irq);
>  		set_irq_flags(irq, IRQF_VALID);
>  	}
> --
