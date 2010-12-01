From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new irq_
 interrupt methods
Date: Wed, 01 Dec 2010 20:24:26 +0900
Message-ID: <002e01cb914a$5285f7f0$f791e7d0$%kim@samsung.com>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62049 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab0LALYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:24:43 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCQ00EXTYD4DQ00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:24:40 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCQ00F6IYD4GL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:24:40 +0900 (KST)
In-reply-to: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> Kernel 2.6.37 adds new interrupt methods which take a struct irq_data
> rather than an irq number. Begin converting Samsung platforms over to
> these methods by converting s3c_irqext_wake() with a simple textual
> substitution.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/irq-eint.c        |    2 +-
>  arch/arm/mach-s5pv310/irq-eint.c        |    2 +-
>  arch/arm/plat-s3c24xx/irq.c             |    2 +-
>  arch/arm/plat-s5p/irq-eint.c            |    4 ++--
>  arch/arm/plat-samsung/include/plat/pm.h |    4 +++-
>  arch/arm/plat-samsung/pm.c              |    6 +++---
>  6 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/irq-eint.c b/arch/arm/mach-s3c64xx/irq-
> eint.c
> index 5682d6a..1a1aa5d 100644
> --- a/arch/arm/mach-s3c64xx/irq-eint.c
> +++ b/arch/arm/mach-s3c64xx/irq-eint.c
> @@ -145,7 +145,7 @@ static struct irq_chip s3c_irq_eint = {
>  	.mask_ack	= s3c_irq_eint_maskack,
>  	.ack		= s3c_irq_eint_ack,
>  	.set_type	= s3c_irq_eint_set_type,
> -	.set_wake	= s3c_irqext_wake,
> +	.irq_set_wake	= s3c_irqext_wake,
>  };
> 
>  /* s3c_irq_demux_eint
> diff --git a/arch/arm/mach-s5pv310/irq-eint.c b/arch/arm/mach-s5pv310/irq-
> eint.c
> index 5877503..f5a415e 100644
> --- a/arch/arm/mach-s5pv310/irq-eint.c
> +++ b/arch/arm/mach-s5pv310/irq-eint.c
> @@ -152,7 +152,7 @@ static struct irq_chip s5pv310_irq_eint = {
>  	.ack		= s5pv310_irq_eint_ack,
>  	.set_type	= s5pv310_irq_eint_set_type,
>  #ifdef CONFIG_PM
> -	.set_wake	= s3c_irqext_wake,
> +	.irq_set_wake	= s3c_irqext_wake,
>  #endif
>  };
> 
> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
> index ad0d44e..91ce383 100644
> --- a/arch/arm/plat-s3c24xx/irq.c
> +++ b/arch/arm/plat-s3c24xx/irq.c
> @@ -238,7 +238,7 @@ static struct irq_chip s3c_irqext_chip = {
>  	.unmask		= s3c_irqext_unmask,
>  	.ack		= s3c_irqext_ack,
>  	.set_type	= s3c_irqext_type,
> -	.set_wake	= s3c_irqext_wake
> +	.irq_set_wake	= s3c_irqext_wake
>  };
> 
>  static struct irq_chip s3c_irq_eint0t4 = {
> diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
> index 752f1a6..f2f2e1c 100644
> --- a/arch/arm/plat-s5p/irq-eint.c
> +++ b/arch/arm/plat-s5p/irq-eint.c
> @@ -125,7 +125,7 @@ static struct irq_chip s5p_irq_eint = {
>  	.ack		= s5p_irq_eint_ack,
>  	.set_type	= s5p_irq_eint_set_type,
>  #ifdef CONFIG_PM
> -	.set_wake	= s3c_irqext_wake,
> +	.irq_set_wake	= s3c_irqext_wake,
>  #endif
>  };
> 
> @@ -194,7 +194,7 @@ static struct irq_chip s5p_irq_vic_eint = {
>  	.ack		= s5p_irq_vic_eint_ack,
>  	.set_type	= s5p_irq_eint_set_type,
>  #ifdef CONFIG_PM
> -	.set_wake	= s3c_irqext_wake,
> +	.irq_set_wake	= s3c_irqext_wake,
>  #endif
>  };
> 
> diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-
> samsung/include/plat/pm.h
> index 245836d..d9025e3 100644
> --- a/arch/arm/plat-samsung/include/plat/pm.h
> +++ b/arch/arm/plat-samsung/include/plat/pm.h
> @@ -15,6 +15,8 @@
>   * management
>  */
> 
> +#include <linux/irq.h>
> +
>  #ifdef CONFIG_PM
> 
>  extern __init int s3c_pm_init(void);
> @@ -100,7 +102,7 @@ extern void s3c_pm_do_restore(struct sleep_save *ptr,
int
> count);
>  extern void s3c_pm_do_restore_core(struct sleep_save *ptr, int count);
> 
>  #ifdef CONFIG_PM
> -extern int s3c_irqext_wake(unsigned int irqno, unsigned int state);
> +extern int s3c_irqext_wake(struct irq_data *data, unsigned int state);
>  extern int s3c24xx_irq_suspend(struct sys_device *dev, pm_message_t
state);
>  extern int s3c24xx_irq_resume(struct sys_device *dev);
>  #else
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 5bf3f2f..02d531f 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -136,15 +136,15 @@ static void s3c_pm_restore_uarts(void) { }
>  unsigned long s3c_irqwake_intmask	= 0xffffffffL;
>  unsigned long s3c_irqwake_eintmask	= 0xffffffffL;
> 
> -int s3c_irqext_wake(unsigned int irqno, unsigned int state)
> +int s3c_irqext_wake(struct irq_data *data, unsigned int state)
>  {
> -	unsigned long bit = 1L << IRQ_EINT_BIT(irqno);
> +	unsigned long bit = 1L << IRQ_EINT_BIT(data->irq);
> 
>  	if (!(s3c_irqwake_eintallow & bit))
>  		return -ENOENT;
> 
>  	printk(KERN_INFO "wake %s for irq %d\n",
> -	       state ? "enabled" : "disabled", irqno);
> +	       state ? "enabled" : "disabled", data->irq);
> 
>  	if (!state)
>  		s3c_irqwake_eintmask |= bit;
> --

Looks ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
