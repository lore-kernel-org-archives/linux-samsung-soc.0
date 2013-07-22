From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Mon, 22 Jul 2013 12:37:52 +0900
Message-ID: <0ad601ce868c$d88bff40$89a3fdc0$@org>
References: <1372054438-15693-1-git-send-email-sachin.kamat@linaro.org>
 <0ab301ce867d$9078c170$b16a4450$%kim@samsung.com>
 <CAK9yfHzmF_oxc3DsuT5wtXX2C5O+wLxz4C2Ps3cVPnKLb8jOEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55440 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756095Ab3GVDiA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 23:38:00 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQB0031UJE1I6M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 12:37:52 +0900 (KST)
In-reply-to: <CAK9yfHzmF_oxc3DsuT5wtXX2C5O+wLxz4C2Ps3cVPnKLb8jOEw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, 'Tomasz Figa' <t.figa@samsung.com>

Sachin Kamat wrote:
> 
> On 22 July 2013 07:18, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Sachin Kamat wrote:
> >>
> >> With the recent cleanup in Exynos platform code notably commits
> >> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
> >> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
> >> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs
> like
> >> Exynos4412 which have more (285) than the default number of GPIOs
(255).
> >> Thus define this number in Kconfig file. Without this patch we get the
> >> following errors during boot:
> >>
> >> gpiochip_add: gpios 251..258 (gpv0) failed to register
> >> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
> >> error code: -22
> >> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> Cc: Tomasz Figa <t.figa@samsung.com>
> >> ---
> >> Based on Kukjin's for-next tree.
> >> ---
> >>  arch/arm/Kconfig |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> >> index ddf2667..380a53b 100644
> >> --- a/arch/arm/Kconfig
> >> +++ b/arch/arm/Kconfig
> >> @@ -1578,6 +1578,7 @@ config ARCH_NR_GPIO
> >>       default 512 if SOC_OMAP5
> >>       default 392 if ARCH_U8500
> >>       default 352 if ARCH_VT8500
> >> +     default 288 if ARCH_EXYNOS
> >>       default 288 if ARCH_SUNXI
> >>       default 264 if MACH_H4700
> >>       default 0
> >> --
> >> 1.7.9.5
> >
> > Hmm, BTW, I'm wondering why it is 288 not 285 or other specific
number...
> 
> I wasn't really sure if we can have any number there. I chose the
> closest one (288) which was already used by other platform.
> If there is no problem to use 285 itself then I can resend with that
> number. Please let me know.
> 
If there is no reason, please don't use bigger value than necessary one.

Thanks,
Kukjin
