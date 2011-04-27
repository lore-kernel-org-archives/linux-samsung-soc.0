From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: S3C64XX: Remove gpio-bank-X header files
Date: Wed, 27 Apr 2011 11:43:09 +0900
Message-ID: <4DB782BD.9020205@samsung.com>
References: <1303465894-16870-1-git-send-email-jy0922.shim@samsung.com>
 <052c01cc047a$5cb8d500$162a7f00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60407 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757169Ab1D0CnO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Apr 2011 22:43:14 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKA00HU4I7WYCC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 11:43:10 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKA00BQQI7YEM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 11:43:10 +0900 (KST)
In-reply-to: <052c01cc047a$5cb8d500$162a7f00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kmpark@infradead.org

On 2011-04-27 =EC=98=A4=EC=A0=84 10:27, Kukjin Kim wrote:
> Joonyoung Shim wrote:
>>
>> The gpio-bank-X header files of S3C64XX have defines which can be
>> substituted by more common API, so they can be removed. This is comp=
ile
>> tested only.
>>
>> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
>> ---
>>   arch/arm/mach-s3c64xx/dev-spi.c                  |   20 ++----
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-a.h |   48 ----------=
----
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-b.h |   60 ----------=
-------
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-c.h |   53 ----------=
-----
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-d.h |   49 ----------=
----
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-e.h |   44 ----------=
---
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-f.h |   71
> --------------------
>> -
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-g.h |   42 ----------=
--
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-h.h |   74
> --------------------
>> --
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-i.h |   40 ----------=
--
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-j.h |   36 ----------=
-
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-n.h |   54 ----------=
------
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-o.h |   70
> --------------------
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-p.h |   69
> --------------------
>>   arch/arm/mach-s3c64xx/include/mach/gpio-bank-q.h |   46 ----------=
---
>>   arch/arm/mach-s3c64xx/mach-smdk6410.c            |    1 -
>>   arch/arm/mach-s3c64xx/pm.c                       |   35 +++++-----=
-
>>   arch/arm/mach-s3c64xx/setup-i2c0.c               |    7 +--
>>   arch/arm/mach-s3c64xx/setup-i2c1.c               |    7 +--
>>   arch/arm/mach-s3c64xx/sleep.S                    |    8 ++-
>>   20 files changed, 34 insertions(+), 800 deletions(-)
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-a.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-b.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-c.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-d.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-e.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-f.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-g.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-h.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-i.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-j.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-n.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-o.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-p.=
h
>>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-q.=
h
>>
>
> Hi,
>
> Oh, great.
>
> I also tried to remove useless gpio header files :) and it is in my d=
ev/gpio
> branch. But I think, this is better.
> Anyway there are small comments.
>
> (snip)
>
>>   void s3c_pm_debug_smdkled(u32 set, u32 clear)
>>   {
>> -	unsigned long flags;
>> -	u32 reg;
>> -
>> -	local_irq_save(flags);
>> -	reg =3D __raw_readl(S3C64XX_GPNCON);
>> -	reg&=3D ~(S3C64XX_GPN_CONMASK(12) | S3C64XX_GPN_CONMASK(13) |
>> -		 S3C64XX_GPN_CONMASK(14) | S3C64XX_GPN_CONMASK(15));
>> -	reg |=3D S3C64XX_GPN_OUTPUT(12) | S3C64XX_GPN_OUTPUT(13) |
>> -	       S3C64XX_GPN_OUTPUT(14) | S3C64XX_GPN_OUTPUT(15);
>> -	__raw_writel(reg, S3C64XX_GPNCON);
>> -
>> -	reg =3D __raw_readl(S3C64XX_GPNDAT);
>> -	reg&=3D ~(clear<<  12);
>> -	reg |=3D set<<  12;
>> -	__raw_writel(reg, S3C64XX_GPNDAT);
>> -
>> -	local_irq_restore(flags);
>> +	int i;
>> +
>> +	for (i =3D 0; i<  4; i++) {
>> +		if (clear&  (1<<  i))
>> +			gpio_direction_output(S3C64XX_GPN(12 + i), 0);
>> +		if (set&  (1<<  i))
>> +			gpio_direction_output(S3C64XX_GPN(12 + i), 1);
>> +	}
>
> Hmm...
>
> According to comments in gpio_direction_{input,output}, it isn't call=
ed more
> than once...but it can be called twice in your code. And need
> local_irq_{save,restore} around them.
>

OK, gpio_set_value will need here instead of gpio_diretion_output.

> So how about keeping old codes here? In addtion, as you know, need to=
 keep
> definitions of S3C64XX_GPNxxx now :(
>

I won't keep old codes, it can replace fully.

Thanks.
