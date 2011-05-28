From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 7/7] ARM: Exynos4: Add clkdev support
Date: Sat, 28 May 2011 11:36:21 +0900
Message-ID: <BANLkTikVj7crwc53PWvzJ5DMKevMbeiPJg@mail.gmail.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
	<1306509996-30280-8-git-send-email-thomas.ab@samsung.com>
	<BANLkTi=LQ2neqPe3Eobmx4Qx2rBQacCx8g@mail.gmail.com>
	<4DE05A85.4050201@samsung.com>
	<BANLkTinOXSV3ZfrXs9BvFqJmhaOc6TjR9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:52983 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754464Ab1E1CgX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 22:36:23 -0400
Received: by vxi39 with SMTP id 39so1720440vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 May 2011 19:36:22 -0700 (PDT)
In-Reply-To: <BANLkTinOXSV3ZfrXs9BvFqJmhaOc6TjR9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Arnd Bergmann <arnd@arndb.de>

On Sat, May 28, 2011 at 11:33 AM, Kyungmin Park <kmpark@infradead.org> =
wrote:
> On Sat, May 28, 2011 at 11:14 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>>
>>
>> On 05/27/11 18:53, Kyungmin Park wrote:
>>>
>>> On Sat, May 28, 2011 at 12:26 AM, Thomas Abraham<thomas.ab@samsung.=
com>
>>> =A0wrote:
>>>>
>>>> Add clkdev support for Samsung's Exynos4 platform and fixes the
>>>> incorrect clock name for the dw_mmc controller.
>>>>
>>>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>>>> ---
>>>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>>>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
178
>>>> +++++++++------------------
>>>> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 +
>>>> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
>>>> =A04 files changed, 67 insertions(+), 121 deletions(-)
>>>> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>>
>> (snip)
>>
>>>> diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>> b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>> new file mode 100644
>>>> index 0000000..1247f5e
>>>> --- /dev/null
>>>> +++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>>> @@ -0,0 +1,7 @@
>>>> +#ifndef __MACH_EXYNOS4_CLKDEV_H__
>>>> +#define __MACH_EXYNOS4_CLKDEV_H__
>>>> +
>>>> +#define __clk_get(clk) ({ 1; })
>>>> +#define __clk_put(clk) do { } while (0)
>>>> +
>>>> +#endif
>>>
>>> Looks good to me.
>>>
>>> One nitpick
>>> How about to just create the one clkdev.h at plat-samsung with prop=
er
>>> ifdef endif config.
>>> I think don't need to create clkdev.h for each SoCs.
>>
>> No, basically the "mach/clkdev.h" should be added, please see
>> arch/arm/include/asm/clkdev.h.
>
> Okay it's required,
> but also see the others.
> http://git.infradead.org/linux-2.6.git/blob/HEAD:/arch/arm/mach-omap2=
/include/mach/clkdev.h
>
> =A0 1 /*
> =A0 2 =A0* arch/arm/mach-omap2/include/mach/clkdev.h
> =A0 3 =A0*/
> =A0 4
> =A0 5 #include <plat/clkdev.h>

and
http://git.infradead.org/linux-2.6.git/blob/HEAD:/arch/arm/plat-omap/in=
clude/plat/clkdev.h

   1 #ifndef __MACH_CLKDEV_H
   2 #define __MACH_CLKDEV_H
   3
   4 static inline int __clk_get(struct clk *clk)
   5 {
   6         return 1;
   7 }
   8
   9 static inline void __clk_put(struct clk *clk)
  10 {
  11 }
  12
  13 #endif

To Arnd,

in case of ARM, it has almost same form. then how about to move the
arm generic one?
>
> Thank you,
> Kyungmin Park
>
