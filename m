From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 7/7] ARM: Exynos4: Add clkdev support
Date: Fri, 27 May 2011 19:14:29 -0700
Message-ID: <4DE05A85.4050201@samsung.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>	<1306509996-30280-8-git-send-email-thomas.ab@samsung.com> <BANLkTi=LQ2neqPe3Eobmx4Qx2rBQacCx8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:53991 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753675Ab1E1COe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 22:14:34 -0400
Received: by pvg12 with SMTP id 12so996373pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 May 2011 19:14:34 -0700 (PDT)
In-Reply-To: <BANLkTi=LQ2neqPe3Eobmx4Qx2rBQacCx8g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org



On 05/27/11 18:53, Kyungmin Park wrote:
> On Sat, May 28, 2011 at 12:26 AM, Thomas Abraham<thomas.ab@samsung.com>  wrote:
>> Add clkdev support for Samsung's Exynos4 platform and fixes the
>> incorrect clock name for the dw_mmc controller.
>>
>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>> ---
>>   arch/arm/Kconfig                            |    1 +
>>   arch/arm/mach-exynos4/clock.c               |  178 +++++++++------------------
>>   arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +
>>   arch/arm/mach-exynos4/time.c                |    2 +
>>   4 files changed, 67 insertions(+), 121 deletions(-)
>>   create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

(snip)

>> diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h b/arch/arm/mach-exynos4/include/mach/clkdev.h
>> new file mode 100644
>> index 0000000..1247f5e
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
>> @@ -0,0 +1,7 @@
>> +#ifndef __MACH_EXYNOS4_CLKDEV_H__
>> +#define __MACH_EXYNOS4_CLKDEV_H__
>> +
>> +#define __clk_get(clk) ({ 1; })
>> +#define __clk_put(clk) do { } while (0)
>> +
>> +#endif
>
> Looks good to me.
>
> One nitpick
> How about to just create the one clkdev.h at plat-samsung with proper
> ifdef endif config.
> I think don't need to create clkdev.h for each SoCs.

No, basically the "mach/clkdev.h" should be added, please see 
arch/arm/include/asm/clkdev.h.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
