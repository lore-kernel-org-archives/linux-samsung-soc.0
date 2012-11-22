From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Fri, 23 Nov 2012 00:11:57 +0100
Message-ID: <201211230011.57846.heiko@sntech.de>
References: <1353589201-31445-1-git-send-email-fenixk19@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39339 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751120Ab2KVXMB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 18:12:01 -0500
In-Reply-To: <1353589201-31445-1-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org

Hi Alexander,


first of all could you elaborate a bit more on the error you experience,
because I currently have problems to understand it from the code alone :-) .

More inline.


Am Donnerstag, 22. November 2012, 14:00:01 schrieb Alexander Varnin:
> S3C2443 CPU has a problem with incorrect reading from EXTINTn
> registers. So s3c_irqext_type function wrongly modifies them.
> So add special function for s3c2443, to handle this case.
> 
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> ---
>  arch/arm/mach-s3c24xx/s3c2443.c |    8 ++++
>  arch/arm/plat-s3c24xx/irq.c     |   89
> +++++++++++++++++++++++++++++++++++++++ 2 files changed, 97 insertions(+),
> 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/s3c2443.c
> b/arch/arm/mach-s3c24xx/s3c2443.c index ab648ad..99eef31 100644
> --- a/arch/arm/mach-s3c24xx/s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/s3c2443.c
> @@ -67,8 +67,11 @@ void s3c2443_restart(char mode, const char *cmd)
>  	__raw_writel(S3C2443_SWRST_RESET, S3C2443_SWRST);
>  }
> 
> +extern int s3c2443_irqext_type(struct irq_data *data, unsigned int type);
> +
>  int __init s3c2443_init(void)
>  {
> +	struct irq_chip * chip;
>  	printk("S3C2443: Initialising architecture\n");
> 
>  	s3c_nand_setname("s3c2412-nand");
> @@ -81,6 +84,11 @@ int __init s3c2443_init(void)
>  	s3c_device_wdt.resource[1].start = IRQ_S3C2443_WDT;
>  	s3c_device_wdt.resource[1].end   = IRQ_S3C2443_WDT;
> 
> +	chip = irq_get_chip(IRQ_EINT0);
> +	chip->irq_set_type=s3c2443_irqext_type;
> +	chip = irq_get_chip(IRQ_EINT4);
> +	chip->irq_set_type=s3c2443_irqext_type;
> +
>  	return device_register(&s3c2443_dev);
>  }

both this and your new exttype function would be more suitable for
irq-s3c2443.c .



> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
> index fe57bbb..9c815f3 100644
> --- a/arch/arm/plat-s3c24xx/irq.c
> +++ b/arch/arm/plat-s3c24xx/irq.c
> @@ -224,7 +224,96 @@ s3c_irqext_type(struct irq_data *data, unsigned int
> type)
> 
>  	return 0;
>  }
> +#if defined(CONFIG_CPU_S3C2443)
> +int
> +s3c2443_irqext_type(struct irq_data *data, unsigned int type)
> +{
> +	int i;
> +	int fixed;
> +	void __iomem *extint_reg;
> +	void __iomem *gpcon_reg;
> +	unsigned long gpcon_offset, extint_offset;
> +	unsigned long newvalue = 0, value;
> +
> +	if ((data->irq >= IRQ_EINT0) && (data->irq <= IRQ_EINT3)) {
> +		gpcon_reg = S3C2410_GPFCON;
> +		extint_reg = S3C24XX_EXTINT0;
> +		gpcon_offset = (data->irq - IRQ_EINT0) * 2;
> +		extint_offset = (data->irq - IRQ_EINT0) * 4;
> +	} else if ((data->irq >= IRQ_EINT4) && (data->irq <= IRQ_EINT7)) {
> +		gpcon_reg = S3C2410_GPFCON;
> +		extint_reg = S3C24XX_EXTINT0;
> +		gpcon_offset = (data->irq - (EXTINT_OFF)) * 2;
> +		extint_offset = (data->irq - (EXTINT_OFF)) * 4;
> +	} else if ((data->irq >= IRQ_EINT8) && (data->irq <= IRQ_EINT15)) {
> +		gpcon_reg = S3C2410_GPGCON;
> +		extint_reg = S3C24XX_EXTINT1;
> +		gpcon_offset = (data->irq - IRQ_EINT8) * 2;
> +		extint_offset = (data->irq - IRQ_EINT8) * 4;
> +	} else if ((data->irq >= IRQ_EINT16) && (data->irq <= IRQ_EINT23)) {
> +		gpcon_reg = S3C2410_GPGCON;
> +		extint_reg = S3C24XX_EXTINT2;
> +		gpcon_offset = (data->irq - IRQ_EINT8) * 2;
> +		extint_offset = (data->irq - IRQ_EINT16) * 4;
> +	} else {
> +		return -1;
> +	}
> 
> +	/* Set the GPIO to external interrupt mode */
> +	value = __raw_readl(gpcon_reg);
> +	value = (value & ~(3 << gpcon_offset)) | (0x02 << gpcon_offset);
> +	__raw_writel(value, gpcon_reg);
> +
> +	/* Set the external interrupt to pointed trigger type */
> +	switch (type)
> +	{
> +		case IRQ_TYPE_NONE:
> +			printk(KERN_WARNING "No edge setting!\n");
> +			break;
> +
> +		case IRQ_TYPE_EDGE_RISING:
> +			newvalue = S3C2410_EXTINT_RISEEDGE;
> +			break;
> +
> +		case IRQ_TYPE_EDGE_FALLING:
> +			newvalue = S3C2410_EXTINT_FALLEDGE;
> +			break;
> +
> +		case IRQ_TYPE_EDGE_BOTH:
> +			newvalue = S3C2410_EXTINT_BOTHEDGE;
> +			break;
> +
> +		case IRQ_TYPE_LEVEL_LOW:
> +			newvalue = S3C2410_EXTINT_LOWLEV;
> +			break;
> +
> +		case IRQ_TYPE_LEVEL_HIGH:
> +			newvalue = S3C2410_EXTINT_HILEV;
> +			break;
> +
> +		default:
> +			printk(KERN_ERR "No such irq type %d", type);
> +			return -1;
> +	}
> +
> +	value = __raw_readl(extint_reg);
> +	//Hack for 2443 error workaround
> +	fixed = 0;
> +	if(extint_reg == S3C24XX_EXTINT1 || extint_reg == S3C24XX_EXTINT2)
> +		for(i=0; i<7;i++)
> +		    	fixed |= (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-i)*4-3)) & 8)) << i*4;
> +	else
> +		for(i=0; i<7;i++)
> +		    	fixed |= ( (value >> (7-i)*4) & 0xf )  << i*4;
> +        fixed |= (((value>>1) & 7) | ((value<<3) & 8)) << 27;
> +	value = fixed;

What does this do or what should it do? Also it gets calculated but
never used?

And please use scripts/checkpatch.pl to verify your patch follows
coding guidelines, as this block is especially hard to read.


> +	value = (value & ~(7 << extint_offset)) | (newvalue << extint_offset);
> +	__raw_writel(value, extint_reg);
> +
> +	return 0;
> +}
> +#endif //defined(CONFIG_CPU_S3C2443)
>  static struct irq_chip s3c_irqext_chip = {
>  	.name		= "s3c-ext",
>  	.irq_mask	= s3c_irqext_mask,
