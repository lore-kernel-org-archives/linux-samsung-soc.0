From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix compilation error with s3c2410_defconfig
Date: Wed, 08 Aug 2012 19:25:17 +0900
Message-ID: <0af001cd7550$1af66040$50e320c0$%kim@samsung.com>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com>
 <5020F568.5020204@linaro.org>
 <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
 <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
 <0abe01cd752f$4f96ad80$eec40880$%kim@samsung.com>
 <20120808065046.GA30832@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37009 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788Ab2HHKZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 06:25:19 -0400
In-reply-to: <20120808065046.GA30832@avionic-0098.mockup.avionic-design.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

Thierry Reding wrote:
> 
> On Wed, Aug 08, 2012 at 03:30:32PM +0900, Kukjin Kim wrote:

[...]

> > Yeah, your pointing out is correct, but in this case, it should be
> 'bool'
> > not 'tristate' because the PWM driver cannot support module now.
> 
> Is there any reason why that is so?

I mean, current pwm-samsung.c does not support module, as you know, the
pwm_init() of pwm-samsung is called by arch_initcall().

> Looking at the driver it seems like
> it should be easy to turn it into a module.

Yeah, I know :)

> I know that Jingoo (Cc'ed)
> has been working on the driver and I've asked him the same question
> already.
> 
I didn't know, would be helpful to me if you could add me in Cc for
discussion of pwm-samsung. And he is my team member, so I will talk to him
about the plan.

> Anyway I don't want to force the issue, I just think you should consider
> it.
> 
Thanks.

> > > solve this problem would be to add a default line, like so:
> > >
> > > 	default PLAT_SAMSUNG
> > >
> > > I've checked this with a s3c2410_defconfig and this causes PWM_SAMSUNG
> > > to be selected =y, which I guess is what you want.
> > >
> > How do you think following, just adding from original one?
> >
> > -	tristate "Samsung pwm support"
> > +	bool "SAMSUNG PWM support"
> >
> > Thanks.
> 
> If you convert this to bool anyway, then maybe you can still use
> def_bool:
> 
> 	config PWM_SAMSUNG
> 		prompt "SAMSUNG PWM support" if PLAT_SAMSUNG
> 		def_bool PLAT_SAMSUNG
> 
> Any particular reason why you want "SAMSUNG" capitalized?
> 
No, there is no reason, just because...

So, how about following? If PWM is selected on Samsung SoCs, the PWM_SAMSUNG
will be selected automatically. Of course, it can be de-selected in kernel
menuconfig. Note that, I think, using 'bool <expr>' and 'depends on <expr>'
is more clear than 'prompt <prompt> ["if" <expr>]'. However if any your
preference here, please kindly let me know.

---
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 8fc3808..c74d055 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -58,14 +58,12 @@ config PWM_PXA
 	will be called pwm-pxa.

 config PWM_SAMSUNG
-	tristate "Samsung pwm support"
+	bool "Samsung PWM support"
 	depends on PLAT_SAMSUNG
+	default y
 	help
 	  Generic PWM framework driver for Samsung.
 
-	  To compile this driver as a module, choose M here: the module
-	  will be called pwm-samsung.
-
 config PWM_TEGRA
 	tristate "NVIDIA Tegra PWM support"
 	depends on ARCH_TEGRA
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
