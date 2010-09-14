From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] ARM: S5PC210: Set the common L2 cache configurations
Date: Tue, 14 Sep 2010 18:56:09 +0900
Message-ID: <AANLkTikwSX706ZdeW0RFNq5DaQXRaN7GcYacNiTSvcXi@mail.gmail.com>
References: <20100911053115.GA23209@july>
	<017301cb53f1$f57f3750$e07da5f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:44313 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752517Ab0INJ4K convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Sep 2010 05:56:10 -0400
Received: by wyf22 with SMTP id 22so7216580wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2010 02:56:09 -0700 (PDT)
In-Reply-To: <017301cb53f1$f57f3750$e07da5f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Sep 14, 2010 at 6:48 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kyungmin Park wrote:
>>
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> S5PC210 has PL310 1MiB L2 cache.
>> It uses the optimized data & tag latency and also enable the prefetc=
h.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv310/cpu.c | =A0 19 +++++++++++++++++++
>> =A01 files changed, 19 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu=
=2Ec
>> index e5b261a..b50312e 100644
>> --- a/arch/arm/mach-s5pv310/cpu.c
>> +++ b/arch/arm/mach-s5pv310/cpu.c
>> @@ -15,6 +15,7 @@
>> =A0#include <asm/mach/irq.h>
>>
>> =A0#include <asm/proc-fns.h>
>> +#include <asm/hardware/cache-l2x0.h>
>>
>> =A0#include <plat/cpu.h>
>> =A0#include <plat/clock.h>
>> @@ -121,6 +122,24 @@ static int __init s5pv310_core_init(void)
>>
>> =A0core_initcall(s5pv310_core_init);
>>
>> +static int __init s5pv310_init_cache(void)
>> +{
>> +#ifdef CONFIG_CACHE_L2X0
>> + =A0 =A0 void __iomem *p =3D S5P_VA_L2CC;
>> +
>> + =A0 =A0 /* TAG, =A0Data latency control */
>> + =A0 =A0 writel(0x110, p + L2X0_TAG_LATENCY_CTRL);
>
> Please use '__raw_writel' instead of 'writel' here...
why?
>
>> + =A0 =A0 writel(0x110, p + L2X0_DATA_LATENCY_CTRL);
>> +
>> + =A0 =A0 /* L2 cache prefetch control */
>> + =A0 =A0 writel(0x6, p + L2X0_PREFETCH_CTRL);
>
> As I know, there is more suitable value which has been tested.
> It means should be changed...but now it is under testing.
I know but almost same effect. 0x3000'000x is set by at AUX_CTRL. and
0x7 is not fully tested.
I mean 0x3000'0006 and 0x6 is same.
>
>> +
>> + =A0 =A0 l2x0_init(p, 0x3C070001, 0xC200FFFF);
>> +#endif
>> + =A0 =A0 return 0;
>> +}
>> +early_initcall(s5pv310_init_cache);
>> +
>> =A0int __init s5pv310_init(void)
>> =A0{
>> =A0 =A0 =A0 printk(KERN_INFO "S5PV310: Initializing architecture\n")=
;
>> --
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
