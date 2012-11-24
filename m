From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Sat, 24 Nov 2012 01:04:59 +0100
Message-ID: <201211240105.00184.heiko@sntech.de>
References: <1353589201-31445-1-git-send-email-fenixk19@mail.ru> <201211230011.57846.heiko@sntech.de> <50AF2157.5050508@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33081 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932340Ab2KXAFH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 19:05:07 -0500
In-Reply-To: <50AF2157.5050508@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

Am Freitag, 23. November 2012, 08:10:15 schrieb Alexander Varnin:
> Please take a look at this document. It describes the problem with
> EXTINTn registers on 2443.
> In fact, the irqext_set function for s3c2443 differs from common
> starting from "//Hack for 2443 error workaround" comment.

wow ... this is a crazy bug :-)

[...]

> >> diff --git a/arch/arm/mach-s3c24xx/s3c2443.c
> >> b/arch/arm/mach-s3c24xx/s3c2443.c index ab648ad..99eef31 100644
> >> --- a/arch/arm/mach-s3c24xx/s3c2443.c
> >> +++ b/arch/arm/mach-s3c24xx/s3c2443.c

[...]

> >> +#if defined(CONFIG_CPU_S3C2443)
> >> +int
> >> +s3c2443_irqext_type(struct irq_data *data, unsigned int type)
> >> +{

[...]

> >> +	value = __raw_readl(extint_reg);
> >> +	//Hack for 2443 error workaround
> >> +	fixed = 0;
> >> +	if(extint_reg == S3C24XX_EXTINT1 || extint_reg == S3C24XX_EXTINT2)
> >> +		for(i=0; i<7;i++)
> >> +		    	fixed |= (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-
i)*4-3))
> >> & 8)) << i*4; +	else
> >> +		for(i=0; i<7;i++)
> >> +		    	fixed |= ( (value >> (7-i)*4) & 0xf )  << i*4;
> >> +        fixed |= (((value>>1) & 7) | ((value<<3) & 8)) << 27;
> >> +	value = fixed;
> > 
> > What does this do or what should it do? Also it gets calculated but
> > never used?
> > 
> > And please use scripts/checkpatch.pl to verify your patch follows
> > coding guidelines, as this block is especially hard to read.



> >> +	value = (value & ~(7 << extint_offset)) | (newvalue << 
extint_offset);
> >> +	__raw_writel(value, extint_reg);
> >> +
> >> +	return 0;
> >> +}
> >> +#endif //defined(CONFIG_CPU_S3C2443)
> >> 
> >>   static struct irq_chip s3c_irqext_chip = {
> >>   
> >>   	.name		= "s3c-ext",
> >>   	.irq_mask	= s3c_irqext_mask,
