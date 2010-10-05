From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 3/3] ARM: S5PC210: Set the common L2 cache configurations
Date: Tue, 5 Oct 2010 18:06:19 +0900
Message-ID: <AANLkTinb3u6fmrQvxY=JOtyY9Q+oaM8vzhwJNdao4Y+D@mail.gmail.com>
References: <20100930074959.GA11798@july>
	<001f01cb6469$f65aa370$e30fea50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35594 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754363Ab0JEJGU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 05:06:20 -0400
Received: by pzk34 with SMTP id 34so1554851pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 02:06:19 -0700 (PDT)
In-Reply-To: <001f01cb6469$f65aa370$e30fea50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Oct 5, 2010 at 5:47 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
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
>
> It would be helpful that could use more detailed function name like
> s5pv310_l2x0_cache_init().
>
>> +{
>> +#ifdef CONFIG_CACHE_L2X0
>> + =A0 =A0 void __iomem *p =3D S5P_VA_L2CC;
>> +
>> + =A0 =A0 /* TAG, =A0Data latency control */
>> + =A0 =A0 writel(0x110, p + L2X0_TAG_LATENCY_CTRL);
>> + =A0 =A0 writel(0x110, p + L2X0_DATA_LATENCY_CTRL);
>
> I still thinking, __raw_writel is more suitable here...
> Because no need to add barriers between each write here.

I think It's micro optimization.
>
>> +
>> + =A0 =A0 /* L2 cache prefetch control */
>> + =A0 =A0 writel(0x30000007, p + L2X0_PREFETCH_CTRL);
>> +
>> + =A0 =A0 l2x0_init(p, 0x3C070001, 0xC200FFFF);
>
> 0x7C070001 is better...or should be?...because it is for early write
> response.
> I think need it for optimization...so please change it.
Send the official documents, At the latest Info. LSI said it's no
performance gain at there.
>
> And it'd better if you could add PL310(L2 cache controller) power con=
trol
> here.
> It can help to reduce power consumption.
>
>> +#endif
>> + =A0 =A0 return 0;
>> +}
>> +early_initcall(s5pv310_init_cache);
>> +
>
> And in my opinion, following format is better even if do not consider=
 the
> coding-style.
> Because if not defined CACHE_L2X0, no need to add empty function into
> early_initcall().
>
> #ifdef CONFIG_CACHE_L2X0
> static int __init s5pv310_l2x0_cache_init(void)
> {
>
> /* */
>
> =A0 =A0 =A0 =A0return 0;
> }
> early_initcall(s5p_l2x0_cache_init);
> #endif
>
>
>> =A0int __init s5pv310_init(void)
>> =A0{
>> =A0 =A0 =A0 printk(KERN_INFO "S5PV310: Initializing architecture\n")=
;
>> --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
