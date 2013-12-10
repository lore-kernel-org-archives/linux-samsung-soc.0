From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 5/5] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
Date: Tue, 10 Dec 2013 11:57:07 +0100
Message-ID: <201312101157.08297.heiko@sntech.de>
References: <201312031619.58062.heiko@sntech.de> <201312031624.11442.heiko@sntech.de> <4563504.qD7ztRvaeD@amdc1227>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54875 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752321Ab3LJK5Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 05:57:16 -0500
In-Reply-To: <4563504.qD7ztRvaeD@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi Tomasz,

Am Montag, 9. Dezember 2013, 18:19:16 schrieb Tomasz Figa:
> > diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> > b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c index f50454a..0a86953 100644
> > --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> > +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c

[...]

> > @@ -86,6 +50,5 @@ DT_MACHINE_START(S3C2416_DT, "Samsung S3C2416
> > (Flattened Device Tree)")
> > 
> >  	.map_io		= s3c2416_dt_map_io,
> >  	.init_irq	= irqchip_init,
> >  	.init_machine	= s3c2416_dt_machine_init,
> > 
> > -	 .init_time	= clocksource_of_init,
> 
> Should it really be a part of this patch?

Yes it is needed as part of the conversion, as somebody has to call 
of_clk_init(), which the init_time default-handler does.

The only other option would be to introduce a new local init_time callback, 
calling of_clk_init and clocksource_of_init, only to remove it again in an 
additional patch.


Heiko
