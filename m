From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: CPUIDLE Support
Date: Tue, 15 Mar 2011 23:36:05 +0900
Message-ID: <AANLkTik2nRq9LsKjZSSFkV_-x=tnG4s3k-S1d651YGvW@mail.gmail.com>
References: <1299635302-27759-1-git-send-email-jc.lee@samsung.com>
	<011c01cbe318$df3d2e00$9db78a00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:43253 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757917Ab1COOgW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 10:36:22 -0400
Received: by wya21 with SMTP id 21so592218wya.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Mar 2011 07:36:21 -0700 (PDT)
In-Reply-To: <011c01cbe318$df3d2e00$9db78a00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jaecheol Lee <jc.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Mar 15, 2011 at 10:57 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Jaecheol Lee wrote:
>>
>> This patch supports cpuidle framework for EXYNOS4210. Currently,
>> Only one idle state is possible to use, but more idle states can
>> be added following by this patch.
>>
>> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/Makefile =A0| =A0 =A01 +
>> =A0arch/arm/mach-exynos4/cpuidle.c | =A0 87
>> +++++++++++++++++++++++++++++++++++++++
>> =A02 files changed, 88 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos4/cpuidle.c
>>
>> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
> exynos4/Makefile
>> index 461ae57..bf206fa 100644
>> --- a/arch/arm/mach-exynos4/Makefile
>> +++ b/arch/arm/mach-exynos4/Makefile
>> @@ -16,6 +16,7 @@ obj-$(CONFIG_CPU_EXYNOS4210) =A0 =A0 =A0 =A0+=3D c=
pu.o init.o
> clock.o
>> irq-combiner.o
>> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D cpu.o init.o clock.o irq-combin=
er.o
>> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o time.o gpiolib.o i=
rq-eint.o
>> dma.o
>> =A0obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D cpufreq.o
>> +obj-$(CONFIG_CPU_IDLE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D cpuidle.o
>>
>> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsmp.o
>> =A0obj-$(CONFIG_LOCAL_TIMERS) =A0 +=3D localtimer.o
>> diff --git a/arch/arm/mach-exynos4/cpuidle.c b/arch/arm/mach-
>> exynos4/cpuidle.c
>> new file mode 100644
>> index 0000000..a543a18
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos4/cpuidle.c
>> @@ -0,0 +1,87 @@
>> +/* linux/arch/arm/mach-exynos4/cpuidle.c
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/cpuidle.h>
>> +#include <linux/io.h>
>> +
>> +#include <asm/proc-fns.h>
>> +
>> +static int exynos4_enter_idle(struct cpuidle_device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpuidle=
_state *state);
>> +
>> +static struct cpuidle_state exynos4_cpuidle_set[] =3D {
>> + =A0 =A0 [0] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enter =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D exynos4_enter_idle,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .exit_latency =A0 =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .target_residency =A0 =A0 =A0 =3D 100000,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D CPUIDLE_FLAG_TIME_VALID,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "IDLE",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "ARM clock gating(WFI)",
>> + =A0 =A0 },
>> +};
>> +
>> +static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device=
);
>> +
>> +static struct cpuidle_driver exynos4_idle_driver =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "exynos4_idle",
>> + =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
>> +};
>> +
>> +static int exynos4_enter_idle(struct cpuidle_device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpuidle=
_state *state)
>> +{
>> + =A0 =A0 struct timeval before, after;
>> + =A0 =A0 int idle_time;
>> +
>> + =A0 =A0 local_irq_disable();
>> + =A0 =A0 do_gettimeofday(&before);
>> +
>> + =A0 =A0 cpu_do_idle();
>> +
>> + =A0 =A0 do_gettimeofday(&after);
>> + =A0 =A0 local_irq_enable();
>> + =A0 =A0 idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_SE=
C +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (after.tv_usec - before.tv_usec);
>> +
>> + =A0 =A0 return idle_time;
>> +}
>> +
>> +static int __init exynos4_init_cpuidle(void)
>> +{
>> + =A0 =A0 int i, max_cpuidle_state, cpu_id;
>> + =A0 =A0 struct cpuidle_device *device;
>> +
>> + =A0 =A0 cpuidle_register_driver(&exynos4_idle_driver);
>> +
>> + =A0 =A0 for_each_cpu(cpu_id, cpu_online_mask) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 device =3D &per_cpu(exynos4_cpuidle_device=
, cpu_id);
>> + =A0 =A0 =A0 =A0 =A0 =A0 device->cpu =3D cpu_id;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 device->state_count =3D (sizeof(exynos4_cp=
uidle_set) /
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0sizeof(struct
> cpuidle_state));
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 max_cpuidle_state =3D device->state_count;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < max_cpuidle_state; i++) =
{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&device->states[i],=
 &exynos4_cpuidle_set[i],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 sizeof(struct cpuidle_state));
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (cpuidle_register_device(device)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "CPUidle r=
egister device
> failed\n,");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +device_initcall(exynos4_init_cpuidle);
>> --
>> 1.7.1
>
> Cc'ed Kyungmin Park.
>
> Hmm...I'm thinking that we need more discussion on this CPUIDLE later=
,
> about method, IDLE states and so on.

It's not good decision. As cpufreq, support the basic cpuidle at
mainline kernel, and add it more states at later.
Except the state name "IDLE", I hope it will be changed to "C1" for
support cpuidle tool.

Mr. Lee will support the C states soon.

I'm okay with Mr. Lee patch.

Thank you,
Kyungmin Park
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
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
