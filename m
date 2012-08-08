From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix compilation error with s3c2410_defconfig
Date: Wed, 08 Aug 2012 15:30:32 +0900
Message-ID: <0abe01cd752f$4f96ad80$eec40880$%kim@samsung.com>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com>
 <5020F568.5020204@linaro.org>
 <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
 <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30493 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051Ab2HHGae (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 02:30:34 -0400
In-reply-to: <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org

Thierry Reding wrote:
> 
> On Wed, Aug 08, 2012 at 09:54:13AM +0900, Kukjin Kim wrote:
> > diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-
> samsung/Kconfig
> > index 7aca31c..dcdfb77 100644
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -403,7 +403,7 @@ config S5P_DEV_USB_EHCI
> >
> >  config S3C24XX_PWM
> >  	bool "PWM device support"
> > -	select HAVE_PWM
> > +	select PWM
> >  	help
> >  	  Support for exporting the PWM timer blocks via the pwm device
> >  	  system
> 
> You could add
> 
> 	select PWM_SAMSUNG
> 
Well, the 'PWM_SAMSUNG' depends on 'PWM', so I think, it'd better to select
PWM_SAMSUNG for building pwm-samsung.c automatically when PWM is selected.

> here to side-step the issue below.
> 
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 8fc3808..34c8ec1 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -59,7 +59,7 @@ config PWM_PXA
> >
> >  config PWM_SAMSUNG
> >  	tristate "Samsung pwm support"
> > -	depends on PLAT_SAMSUNG
> > +	def_bool PLAT_SAMSUNG
> 
> tristate and def_bool conflict, don't they? I think the easiest way to

Yeah, your pointing out is correct, but in this case, it should be 'bool'
not 'tristate' because the PWM driver cannot support module now.

> solve this problem would be to add a default line, like so:
> 
> 	default PLAT_SAMSUNG
> 
> I've checked this with a s3c2410_defconfig and this causes PWM_SAMSUNG
> to be selected =y, which I guess is what you want.
> 
How do you think following, just adding from original one?

-	tristate "Samsung pwm support"
+	bool "SAMSUNG PWM support"

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
