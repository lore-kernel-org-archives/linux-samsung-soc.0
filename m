From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 3/4] misc: exynos-chipid: Add Exynos Chipid driver support
Date: Mon, 05 May 2014 18:28:49 +0900
Message-ID: <536759D1.4000001@samsung.com>
References: <1399097500-4052-1-git-send-email-pankaj.dubey@samsung.com>
 <1399097500-4052-4-git-send-email-pankaj.dubey@samsung.com>
 <1399276631.15737.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1399276631.15737.1.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, Arnd Bergmann <arnd@arndb.de>, t.figa@samsung.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/05/2014 04:57 PM, Krzysztof Kozlowski wrote:
> On sob, 2014-05-03 at 15:11 +0900, Pankaj Dubey wrote:
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 7eb4b69..48c8fb5 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -55,3 +55,4 @@ obj-$(CONFIG_SRAM)		+= sram.o
>>   obj-y				+= mic/
>>   obj-$(CONFIG_GENWQE)		+= genwqe/
>>   obj-$(CONFIG_ECHO)		+= echo/
>> +obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o
>> diff --git a/drivers/misc/exynos-chipid.c b/drivers/misc/exynos-chipid.c
>> new file mode 100644
>> index 0000000..eb23339
>> --- /dev/null
>> +++ b/drivers/misc/exynos-chipid.c
>> @@ -0,0 +1,83 @@
>> +/*
>> + * Copyright (c) 2014-2015 Samsung Electronics Co., Ltd.
>> + *	      http://www.samsung.com/
> I wonder why this is copyrighted in the future (2015)?

Thanks for pointing out, will correct it in next version.

>
> Best regards,
> Krzysztof
>
>
>


-- 
Best Regards,
Pankaj Dubey
