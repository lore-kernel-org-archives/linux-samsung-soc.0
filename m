From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 1/2] ARM: exynos: delete redundant HAVE_SCHED_CLOCK option
 in Kconfig
Date: Wed, 5 Sep 2012 17:05:28 +0800
Message-ID: <CAGsJ_4xCct_7H3oU6goNsXNqOxRZ57N_6qsAdoU37q1gLhUbTg@mail.gmail.com>
References: <1346406296-16223-1-git-send-email-Barry.Song@csr.com> <227101cd8aea$06a06e10$13e14a30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:42483 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765Ab2IEJFv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 05:05:51 -0400
Received: by lbbgj3 with SMTP id gj3so208781lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Sep 2012 02:05:50 -0700 (PDT)
In-Reply-To: <227101cd8aea$06a06e10$13e14a30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, olof@lixom.net
Cc: rob.herring@calxeda.com, workgroup.linux@csr.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Barry Song <Baohua.Song@csr.com>

2012/9/5 Kukjin Kim <kgene.kim@samsung.com>:
> Barry Song wrote:
>>
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> Signed-off-by: Barry Song <Baohua.Song@csr.com>
>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Kukjin, Thanks. i assume this will be taken by samsung tree. Who will
take care the other one:
http://www.spinics.net/lists/arm-kernel/msg191939.html

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>> ---
>>  arch/arm/mach-exynos/Kconfig |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index b5b4c8c..3fd4ab3 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -243,7 +243,6 @@ config MACH_UNIVERSAL_C210
>>       select CPU_EXYNOS4210
>>       select S5P_HRT
>>       select CLKSRC_MMIO
>> -     select HAVE_SCHED_CLOCK
>>       select S5P_GPIO_INT
>>       select S5P_DEV_FIMC0
>>       select S5P_DEV_FIMC1
>> --
>> 1.7.0.4

-barry
