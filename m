From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 2/7] ARM: S5P: Add GPIOlib gpio_to_irq for external
	interrupts
Date: Thu, 03 Jun 2010 15:14:53 +0900
Message-ID: <4C07485D.2020808@samsung.com>
References: <1275541299-25566-1-git-send-email-jy0922.shim@samsung.com>
 <1275541299-25566-2-git-send-email-jy0922.shim@samsung.com>
 <20100603054323.GZ4720@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60728 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932121Ab0FCGOz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jun 2010 02:14:55 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3F00A1ODCTBT@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 15:14:53 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3F0010NDCT01@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 15:14:53 +0900 (KST)
In-reply-to: <20100603054323.GZ4720@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

On 6/3/2010 2:43 PM, Ben Dooks wrote:
> On Thu, Jun 03, 2010 at 02:01:34PM +0900, Joonyoung Shim wrote:
>> This patch is to support gpio_to_irq() of GPIOlib for external
>> interrupts. The gpio_to_irq() calls s5p_gpiolib_eint_to_irq function.
> 
> How about each s3c_gpio_chip have a irq base in it?
>  

Good, then it can be arch and irq type(gpio, external)independent codes.

>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/plat-s5p/Makefile                     |    1 +
>>  arch/arm/plat-s5p/gpiolib.c                    |   35 ++++++++++++++++++++++++
>>  arch/arm/plat-samsung/include/plat/gpio-core.h |    2 +
>>  3 files changed, 38 insertions(+), 0 deletions(-)
>>  create mode 100644 arch/arm/plat-s5p/gpiolib.c
>>
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index 39c242b..f6e1a13 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -15,6 +15,7 @@ obj-				:=
>>  obj-y				+= dev-uart.o
>>  obj-y				+= cpu.o
>>  obj-y				+= clock.o
>> +obj-y				+= gpiolib.o
>>  obj-y				+= irq.o
>>  obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
>>  
>> diff --git a/arch/arm/plat-s5p/gpiolib.c b/arch/arm/plat-s5p/gpiolib.c
>> new file mode 100644
>> index 0000000..0c27a9d
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/gpiolib.c
>> @@ -0,0 +1,35 @@
>> +/*
>> + * linux/arch/arm/plat-s5p/gpiolib.c
>> + *
>> + * Copyright (C) 2010 Samsung Electronics Co.Ltd
>> + * Author: Joonyoung Shim <jy0922.shim@samsung.com>
>> + *
>> + * S5P - GPIOlib support
>> + *
>> + *  This program is free software; you can redistribute  it and/or modify it
>> + *  under  the terms of  the GNU General  Public License as published by the
>> + *  Free Software Foundation;  either version 2 of the  License, or (at your
>> + *  option) any later version.
>> + *
>> + */
>> +
>> +#include <linux/gpio.h>
>> +#include <mach/irqs.h>
>> +#include <mach/regs-gpio.h>
>> +
>> +/* be called from gpio_to_irq() for external interrupts */
>> +int s5p_gpiolib_eint_to_irq(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +	switch (chip->base) {
>> +	case EINT_GPIO_0(0):
>> +		return IRQ_EINT(offset);
>> +	case EINT_GPIO_1(0):
>> +		return IRQ_EINT(8 + offset);
>> +	case EINT_GPIO_2(0):
>> +		return IRQ_EINT(16 + offset);
>> +	case EINT_GPIO_3(0):
>> +		return IRQ_EINT(24 + offset);
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
>> index e358c7d..f6c5151 100644
>> --- a/arch/arm/plat-samsung/include/plat/gpio-core.h
>> +++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
>> @@ -121,6 +121,8 @@ extern void samsung_gpiolib_add_4bit2(struct s3c_gpio_chip *chip);
>>  /* exported for core SoC support to change */
>>  extern struct s3c_gpio_cfg s3c24xx_gpiocfg_default;
>>  
>> +extern int s5p_gpiolib_eint_to_irq(struct gpio_chip *chip, unsigned int offset);
>> +
>>  #ifdef CONFIG_S3C_GPIO_TRACK
>>  extern struct s3c_gpio_chip *s3c_gpios[S3C_GPIO_END];
>>  
>> -- 
>> 1.7.0.4
>>
> 
