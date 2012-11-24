From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Sat, 24 Nov 2012 01:16:44 +0100
Message-ID: <201211240116.44494.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33261 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932296Ab2KXAQu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 19:16:50 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

sorry, forgot half of it [inline]

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

So essentially register-reads somehow returned transformed data, but the write 
is done according to the datasheet.


It would definitely be better to integrate it into the existing _irqext_type 
function instead of introducing a second one.

The cpu_id is present in the samsung_cpu_id var and the list of cpus including 
the s3c2443 can be found in common.c. With this it would be possible to 
identify when the irq code is run on a s3c2443 machine and the original 
_irqext_type function could change the behaviour accordingly.

Not sure if it would make sense to introduce soc_is_s3c2443() etc macros for 
this.

And of course the actual block doing the transformation on read would need a 
more elaborate comment on the why and how, because in 3 years someone might 
not directly see what this does and why it was necessary.


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
