From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: S5P: Added default pll values for APLL
	800/1000MHz
Date: Sat, 17 Jul 2010 12:10:42 +0900
Message-ID: <AANLkTiliHDKDO_QIAW9xKGVaDtrzotYFH1lxAICnIXbo@mail.gmail.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
	<012f01cb24e1$85628920$90279b60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:59356 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755590Ab0GQDKn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 23:10:43 -0400
Received: by pvc7 with SMTP id 7so1052164pvc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2010 20:10:42 -0700 (PDT)
In-Reply-To: <012f01cb24e1$85628920$90279b60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Fri, Jul 16, 2010 at 9:22 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> CPUFREQ of S5PV210 uses different APLL settings and we provide
>> such values for CPUFREQ at pll.h. We have been using differently
>> between EVT0 and EVT1 machines. Although this version of kernel
>> assumes that the CPU is EVT1, users may use code for EVT0 later.
>>
>> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
>> ARMCLK, APLL should be 800MHz.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/plat-s5p/include/plat/pll.h | =A0 =A08 ++++++++
>> =A01 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
> b/arch/arm/plat-s5p/include/plat/pll.h
>> index 7db3227..3112aba 100644
>> --- a/arch/arm/plat-s5p/include/plat/pll.h
>> +++ b/arch/arm/plat-s5p/include/plat/pll.h
>> @@ -21,6 +21,14 @@
>>
>> =A0#include <asm/div64.h>
>>
>> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
>
> Actually, EVT0 is not real chip and not for mass production.
> So don't use in here.

But we got too many board and want to use it. ARM core is also has
some workaround to fix internal bug. so you can regard it.

config S5PC110_WORKAROUND
    help
        Early s5pc110 has some errata blah blah ... To fix it you can e=
nable it.

Thank you,
Kyungmin Park

>
>> +#define PLL45XX_APLL_VAL_1000 =A0 =A0 =A0 =A0(1 << 31) | (0xfa<<16)=
 | (0x6<<8) |
> (0x1)
>> +#define PLL45XX_APLL_VAL_800 (1 << 31) | (0xc8<<16) | (0x6<<8) | (0=
x1)
>> +#else
>> +#define PLL45XX_APLL_VAL_1000 =A0 =A0 =A0 =A0(1 << 31) | (125<<16) =
| (3<<8) | (1)
>> +#define PLL45XX_APLL_VAL_800 (1 << 31) | (100<<16) | (3<<8) | (1)
>> +#endif
>> +
>> =A0enum pll45xx_type_t {
>> =A0 =A0 =A0 pll_4500,
>> =A0 =A0 =A0 pll_4502,
>> --
>
> And...I got the below result from scripts/checkpatch.pl.
>
> --
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #27: FILE: arch/arm/plat-s5p/include/plat/pll.h:25:
> +#define PLL45XX_APLL_VAL_1000 =A0(1 << 31) | (0xfa<<16) | (0x6<<8) |=
 (0x1)
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #28: FILE: arch/arm/plat-s5p/include/plat/pll.h:26:
> +#define PLL45XX_APLL_VAL_800 =A0 (1 << 31) | (0xc8<<16) | (0x6<<8) |=
 (0x1)
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #30: FILE: arch/arm/plat-s5p/include/plat/pll.h:28:
> +#define PLL45XX_APLL_VAL_1000 =A0(1 << 31) | (125<<16) | (3<<8) | (1=
)
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #31: FILE: arch/arm/plat-s5p/include/plat/pll.h:29:
> +#define PLL45XX_APLL_VAL_800 =A0 (1 << 31) | (100<<16) | (3<<8) | (1=
)
>
> total: 4 errors, 0 warnings, 14 lines checked
>
> --
>
> I already said to you about that :-(
> See the Documentation/SubmittingPatches...
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
