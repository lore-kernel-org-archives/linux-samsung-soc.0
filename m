From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
Date: Wed, 23 Jun 2010 16:50:32 +0900
Message-ID: <004601cb12a8$c869e560$593db020$%kim@samsung.com>
References: <4C11F4CA.10802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60998 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141Ab0FWHui (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 03:50:38 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4G00F50J4CAJ70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 16:50:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4G003H9J4CSC@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 16:50:36 +0900 (KST)
In-reply-to: <4C11F4CA.10802@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, ben-linux@fluff.org
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Joonyoung Shim wrote:
> 
> This patch v2 set is to support gpio interrupts of samsung s5p cpus, and
> the GPIOlib gpio_to_irq goes to plat-samsung gpiolib, so patch v2 set
> has four commit smaller than v1.
> 
> Changes since v1:
> - Add irq_base to s3c_gpio_chip struct
> - GPIOlib gpio_to_irq() is implemented to samsung_gpiolib_to_irq() of
>   plat-samsung gpiolib
> 
> Joonyoung Shim (4):
>       ARM: S5PV210: Add gpio interrupt support
>       ARM: S5PC100: Use S5P gpio interrupts interface
>       ARM: S5PC100: Move external interrupt defines
>       ARM: SAMSUNG: Add GPIOlib gpio_to_irq
> 
>  arch/arm/mach-s5pc100/Makefile                 |    2 +-
>  arch/arm/mach-s5pc100/gpiolib.c                |   70 ++-----
>  arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -
>  arch/arm/mach-s5pc100/include/mach/irqs.h      |   18 ++-
>  arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +
>  arch/arm/mach-s5pc100/irq-gpio.c               |  266
------------------------
>  arch/arm/mach-s5pv210/gpiolib.c                |   18 ++-
>  arch/arm/mach-s5pv210/include/mach/irqs.h      |   16 ++-
>  arch/arm/plat-s5p/Makefile                     |    2 +-
>  arch/arm/plat-s5p/irq-gpioint.c                |  208 ++++++++++++++++++
>  arch/arm/plat-samsung/gpiolib.c                |    9 +
>  arch/arm/plat-samsung/include/plat/gpio-core.h |    6 +
>  12 files changed, 295 insertions(+), 334 deletions(-)
>  delete mode 100644 arch/arm/mach-s5pc100/irq-gpio.c
>  create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
> 

I am sure this patchset is working code, but Ben had made suggestion about
'sparse irq'...
It is because there are too many gpio interrupts and having support of all
of them is unnecessary as realistically only few of them maybe used.
In fact in SMDK board there is no use of gpio in interrupt mode.

Ben, I remember your suggestion for using 'sparse irq' for handling gpio
interrupts.
And in fact, sparse irq implementation can be beneficial to many other
boards...
Could you please explain about that?


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
