From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH v2 7/7] ARM: Exynos4: Add clkdev support
Date: Sat, 28 May 2011 09:09:44 +0530
Message-ID: <BANLkTi=w+5Yv7dqyBQzZW24i6MfqP2-h+Q@mail.gmail.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
	<1306509996-30280-8-git-send-email-thomas.ab@samsung.com>
	<BANLkTi=LQ2neqPe3Eobmx4Qx2rBQacCx8g@mail.gmail.com>
	<4DE05A85.4050201@samsung.com>
	<BANLkTinOXSV3ZfrXs9BvFqJmhaOc6TjR9A@mail.gmail.com>
	<BANLkTikVj7crwc53PWvzJ5DMKevMbeiPJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:54659 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755362Ab1E1Djp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 23:39:45 -0400
Received: by gwaa18 with SMTP id a18so937052gwa.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 May 2011 20:39:45 -0700 (PDT)
In-Reply-To: <BANLkTikVj7crwc53PWvzJ5DMKevMbeiPJg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Arnd Bergmann <arnd@arndb.de>

On Sat, May 28, 2011 at 8:06 AM, Kyungmin Park <kmpark@infradead.org> w=
rote:
> On Sat, May 28, 2011 at 11:33 AM, Kyungmin Park <kmpark@infradead.org=
> wrote:
>> On Sat, May 28, 2011 at 11:14 AM, Kukjin Kim <kgene.kim@samsung.com>=
 wrote:
>>>
>>>
>>> On 05/27/11 18:53, Kyungmin Park wrote:
>>>>
>>>> On Sat, May 28, 2011 at 12:26 AM, Thomas Abraham<thomas.ab@samsung=
=2Ecom>
>>>> =A0wrote:
>>>>>
>>>>> Add clkdev support for Samsung's Exynos4 platform and fixes the
>>>>> incorrect clock name for the dw_mmc controller.
>>>>>
>>>>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>>>>> ---
>>>>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>>>>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
178
>>>>> +++++++++------------------
>>>>> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 +
>>>>> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +
>>>>> =A04 files changed, 67 insertions(+), 121 deletions(-)
>>>>> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>>>
>>> (snip)
>>>
>>>>> diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>>> b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>>> new file mode 100644
>>>>> index 0000000..1247f5e
>>>>> --- /dev/null
>>>>> +++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>>> @@ -0,0 +1,7 @@
>>>>> +#ifndef __MACH_EXYNOS4_CLKDEV_H__
>>>>> +#define __MACH_EXYNOS4_CLKDEV_H__
>>>>> +
>>>>> +#define __clk_get(clk) ({ 1; })
>>>>> +#define __clk_put(clk) do { } while (0)
>>>>> +
>>>>> +#endif
>>>>
>>>> Looks good to me.
>>>>
>>>> One nitpick
>>>> How about to just create the one clkdev.h at plat-samsung with pro=
per
>>>> ifdef endif config.
>>>> I think don't need to create clkdev.h for each SoCs.
>>>
>>> No, basically the "mach/clkdev.h" should be added, please see
>>> arch/arm/include/asm/clkdev.h.
>>
>> Okay it's required,
>> but also see the others.
>> http://git.infradead.org/linux-2.6.git/blob/HEAD:/arch/arm/mach-omap=
2/include/mach/clkdev.h
>>
>> =A0 1 /*
>> =A0 2 =A0* arch/arm/mach-omap2/include/mach/clkdev.h
>> =A0 3 =A0*/
>> =A0 4
>> =A0 5 #include <plat/clkdev.h>
>
> and
> http://git.infradead.org/linux-2.6.git/blob/HEAD:/arch/arm/plat-omap/=
include/plat/clkdev.h
>
> =A0 1 #ifndef __MACH_CLKDEV_H
> =A0 2 #define __MACH_CLKDEV_H
> =A0 3
> =A0 4 static inline int __clk_get(struct clk *clk)
> =A0 5 {
> =A0 6 =A0 =A0 =A0 =A0 return 1;
> =A0 7 }
> =A0 8
> =A0 9 static inline void __clk_put(struct clk *clk)
> =A010 {
> =A011 }
> =A012
> =A013 #endif
>
> To Arnd,
>
> in case of ARM, it has almost same form. then how about to move the
> arm generic one?
>>

We also need to consider the case in which a platform requires a
custom implementation of __clk_get and __clk_put. In that case, will a
single clkdev.h suffice?

Thanks,
Thomas.

>> Thank you,
>> Kyungmin Park
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
