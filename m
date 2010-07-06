From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
Date: Tue, 06 Jul 2010 16:40:17 +0900
Message-ID: <4C32DDE1.8070906@samsung.com>
References: <4C11F4CA.10802@samsung.com>
 <004601cb12a8$c869e560$593db020$%kim@samsung.com>
 <000101cb1427$e88bfec0$b9a3fc40$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30980 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754540Ab0GFHkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 03:40:19 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L540067JLB5D730@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 16:40:17 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L54000YMLB5JX@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 16:40:17 +0900 (KST)
In-reply-to: <000101cb1427$e88bfec0$b9a3fc40$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 6/25/2010 2:33 PM, Marek Szyprowski wrote:
> Hello,
> 
> On Wednesday, June 23, 2010 9:51 AM Kukjin Kim wrote:
> 
>> Joonyoung Shim wrote:
>>> This patch v2 set is to support gpio interrupts of samsung s5p cpus, and
>>> the GPIOlib gpio_to_irq goes to plat-samsung gpiolib, so patch v2 set
>>> has four commit smaller than v1.
>>>
>>> Changes since v1:
>>> - Add irq_base to s3c_gpio_chip struct
>>> - GPIOlib gpio_to_irq() is implemented to samsung_gpiolib_to_irq() of
>>>   plat-samsung gpiolib
>>>
>>> Joonyoung Shim (4):
>>>       ARM: S5PV210: Add gpio interrupt support
>>>       ARM: S5PC100: Use S5P gpio interrupts interface
>>>       ARM: S5PC100: Move external interrupt defines
>>>       ARM: SAMSUNG: Add GPIOlib gpio_to_irq
>>>
>>>  arch/arm/mach-s5pc100/Makefile                 |    2 +-
>>>  arch/arm/mach-s5pc100/gpiolib.c                |   70 ++-----
>>>  arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -
>>>  arch/arm/mach-s5pc100/include/mach/irqs.h      |   18 ++-
>>>  arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +
>>>  arch/arm/mach-s5pc100/irq-gpio.c               |  266
>> ------------------------
>>>  arch/arm/mach-s5pv210/gpiolib.c                |   18 ++-
>>>  arch/arm/mach-s5pv210/include/mach/irqs.h      |   16 ++-
>>>  arch/arm/plat-s5p/Makefile                     |    2 +-
>>>  arch/arm/plat-s5p/irq-gpioint.c                |  208 ++++++++++++++++++
>>>  arch/arm/plat-samsung/gpiolib.c                |    9 +
>>>  arch/arm/plat-samsung/include/plat/gpio-core.h |    6 +
>>>  12 files changed, 295 insertions(+), 334 deletions(-)
>>>  delete mode 100644 arch/arm/mach-s5pc100/irq-gpio.c
>>>  create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
>>>
>> I am sure this patchset is working code, but Ben had made suggestion about
>> 'sparse irq'...
>> It is because there are too many gpio interrupts and having support of all
>> of them is unnecessary as realistically only few of them maybe used.
> 
> Right. Ben suggested to create a pool for gpio interrupts (for example 16
> interrupts) and selectively assign them in machine startup code to those
> gpio pins that really need it.
> 
> The problem is that such solution is not yet ready and we really need the
> gpio interrupt functionality for our boards (Aquila and GONI). 
> 
> Maybe these current patches could be merged now, and then, once the new
> solution is prepared, the gpio interrupt support get converted to selective
> registering?
> 

I agree with Marek.

Ben and Kukjin, how do you think about this?

> S5PC100 already has gpio interrupt support.
>  
>> In fact in SMDK board there is no use of gpio in interrupt mode.
> 
> We are talking about support for Samsung S5PV210/S5PC110 SoCs in the Linux
> mainline kernel, not the support for only SMDK boards. GPIO interrupts is
> a feature of the SoC not a particular board.
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
