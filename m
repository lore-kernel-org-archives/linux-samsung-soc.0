From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 7/7] ARM: Exynos4: Add clkdev support
Date: Sat, 28 May 2011 11:33:03 +0900
Message-ID: <BANLkTinOXSV3ZfrXs9BvFqJmhaOc6TjR9A@mail.gmail.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
	<1306509996-30280-8-git-send-email-thomas.ab@samsung.com>
	<BANLkTi=LQ2neqPe3Eobmx4Qx2rBQacCx8g@mail.gmail.com>
	<4DE05A85.4050201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:60326 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753652Ab1E1CdE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 22:33:04 -0400
Received: by vws1 with SMTP id 1so1711971vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 May 2011 19:33:03 -0700 (PDT)
In-Reply-To: <4DE05A85.4050201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Arnd Bergmann <arnd@arndb.de>

On Sat, May 28, 2011 at 11:14 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
>
>
> On 05/27/11 18:53, Kyungmin Park wrote:
>>
>> On Sat, May 28, 2011 at 12:26 AM, Thomas Abraham<thomas.ab@samsung.c=
om>
>> =A0wrote:
>>>
>>> Add clkdev support for Samsung's Exynos4 platform and fixes the
>>> incorrect clock name for the dw_mmc controller.
>>>
>>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>>> ---
>>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A01=
78
>>> +++++++++------------------
>>> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 +
>>> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
>>> =A04 files changed, 67 insertions(+), 121 deletions(-)
>>> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>
> (snip)
>
>>> diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h
>>> b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>> new file mode 100644
>>> index 0000000..1247f5e
>>> --- /dev/null
>>> +++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
>>> @@ -0,0 +1,7 @@
>>> +#ifndef __MACH_EXYNOS4_CLKDEV_H__
>>> +#define __MACH_EXYNOS4_CLKDEV_H__
>>> +
>>> +#define __clk_get(clk) ({ 1; })
>>> +#define __clk_put(clk) do { } while (0)
>>> +
>>> +#endif
>>
>> Looks good to me.
>>
>> One nitpick
>> How about to just create the one clkdev.h at plat-samsung with prope=
r
>> ifdef endif config.
>> I think don't need to create clkdev.h for each SoCs.
>
> No, basically the "mach/clkdev.h" should be added, please see
> arch/arm/include/asm/clkdev.h.

Okay it's required,
but also see the others.
http://git.infradead.org/linux-2.6.git/blob/HEAD:/arch/arm/mach-omap2/i=
nclude/mach/clkdev.h

   1 /*
   2  * arch/arm/mach-omap2/include/mach/clkdev.h
   3  */
   4
   5 #include <plat/clkdev.h>

Thank you,
Kyungmin Park
