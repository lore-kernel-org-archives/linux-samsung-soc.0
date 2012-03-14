From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 08/12] ARM: EXYNOS: support EINT for EXYNOS4 and EXYNOS5
Date: Tue, 13 Mar 2012 23:33:44 -0700
Message-ID: <4F603BC8.3020900@samsung.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com> <1331652643-12626-9-git-send-email-kgene.kim@samsung.com> <20120314035203.GA2531@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:41866 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030340Ab2CNGdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 02:33:47 -0400
Received: by yenl12 with SMTP id l12so1440299yen.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 23:33:47 -0700 (PDT)
In-Reply-To: <20120314035203.GA2531@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, Eunki Kim <eunki_kim@samsung.com>

On 03/13/12 20:52, Olof Johansson wrote:
> Hi,
>
> A couple of comments below.
>
I agree, and will address comments from you.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>
> On Tue, Mar 13, 2012 at 08:30:39AM -0700, Kukjin Kim wrote:
>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
>> index 0b53018..72f21e4 100644
>> --- a/arch/arm/mach-exynos/common.c
>> +++ b/arch/arm/mach-exynos/common.c
>> @@ -777,39 +779,24 @@ static int exynos4_irq_eint_set_type(struct irq_data *data, unsigned int type)
>>   	mask = 0x7<<  shift;
>>
>>   	spin_lock(&eint_lock);
>> -	ctrl = __raw_readl(S5P_EINT_CON(EINT_REG_NR(data->irq)));
>> +	ctrl = __raw_readl(EINT_CON(exynos_eint_base, data->irq));
>>   	ctrl&= ~mask;
>>   	ctrl |= newvalue<<  shift;
>> -	__raw_writel(ctrl, S5P_EINT_CON(EINT_REG_NR(data->irq)));
>> +	__raw_writel(ctrl, EINT_CON(exynos_eint_base, data->irq));
>>   	spin_unlock(&eint_lock);
>>
>> -	switch (offs) {
>> -	case 0 ... 7:
>> -		s3c_gpio_cfgpin(EINT_GPIO_0(offs&  0x7), EINT_MODE);
>> -		break;
>> -	case 8 ... 15:
>> -		s3c_gpio_cfgpin(EINT_GPIO_1(offs&  0x7), EINT_MODE);
>> -		break;
>> -	case 16 ... 23:
>> -		s3c_gpio_cfgpin(EINT_GPIO_2(offs&  0x7), EINT_MODE);
>> -		break;
>> -	case 24 ... 31:
>> -		s3c_gpio_cfgpin(EINT_GPIO_3(offs&  0x7), EINT_MODE);
>> -		break;
>> -	default:
>> -		printk(KERN_ERR "No such irq number %d", offs);
>> -	}
>> +	s3c_gpio_cfgpin(irq_to_gpio(data->irq), S3C_GPIO_SFN(0xf));
>
> irq_to_gpio is going away, so it's not a good idea to add it under that name.
>
> Add a local function locally at the top of this file instead. and call
> it something else.
>
>> diff --git a/arch/arm/mach-exynos/include/mach/gpio.h b/arch/arm/mach-exynos/include/mach/gpio.h
>> index 80523ca..c09deb6 100644
>> --- a/arch/arm/mach-exynos/include/mach/gpio.h
>> +++ b/arch/arm/mach-exynos/include/mach/gpio.h
>> @@ -146,4 +146,33 @@ enum s5p_gpio_number {
>>   #define ARCH_NR_GPIOS		(EXYNOS4_GPZ(EXYNOS4_GPIO_Z_NR) +	\
>>   				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
>>
>> +#include<linux/types.h>
>> +#include<linux/err.h>
>> +#include<mach/irqs.h>
>> +#include<plat/cpu.h>
>> +
>> +static inline int irq_to_gpio(unsigned int irq)
>> +{
>> +	if (irq<  IRQ_EINT(0))
>> +		return -EINVAL;
>> +
>> +	irq -= IRQ_EINT(0);
>> +	if (irq<  8)
>> +		return soc_is_exynos5250() ?  EXYNOS5_GPX0(irq) :
>> +					 EXYNOS4_GPX0(irq);
>> +	irq -= 8;
>> +	if (irq<  8)
>> +		return soc_is_exynos5250() ?  EXYNOS5_GPX1(irq) :
>> +					 EXYNOS4_GPX1(irq);
>> +	irq -= 8;
>> +	if (irq<  8)
>> +		return soc_is_exynos5250() ?  EXYNOS5_GPX2(irq) :
>> +					 EXYNOS4_GPX2(irq);
>> +	irq -= 8;
>> +	if (irq<  8)
>> +		return soc_is_exynos5250() ?  EXYNOS5_GPX3(irq) :
>> +					 EXYNOS4_GPX3(irq);
>> +	return -EINVAL;
>> +}
>
> I think this would be cleaner as two small helpers and one check for SoC
> version instead.
