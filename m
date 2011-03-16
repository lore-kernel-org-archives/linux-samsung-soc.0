From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: CPUIDLE Support
Date: Wed, 16 Mar 2011 15:01:53 +0900
Message-ID: <001901cbe39f$a9518bb0$fbf4a310$%kim@samsung.com>
References: <1299635302-27759-1-git-send-email-jc.lee@samsung.com>
 <011c01cbe318$df3d2e00$9db78a00$%kim@samsung.com>
 <AANLkTik2nRq9LsKjZSSFkV_-x=tnG4s3k-S1d651YGvW@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29199 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446Ab1CPGCB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 02:02:01 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI4004EXZFBQEF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Mar 2011 15:01:59 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI400DQPZFA9T@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Mar 2011 15:01:59 +0900 (KST)
In-reply-to: <AANLkTik2nRq9LsKjZSSFkV_-x=tnG4s3k-S1d651YGvW@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Tue, Mar 15, 2011 at 10:57 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > Jaecheol Lee wrote:
> >>
> >> This patch supports cpuidle framework for EXYNOS4210. Currently,
> >> Only one idle state is possible to use, but more idle states can
> >> be added following by this patch.
> >>
> >> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> >> ---
> >> =A0arch/arm/mach-exynos4/Makefile =A0| =A0 =A01 +
> >> =A0arch/arm/mach-exynos4/cpuidle.c | =A0 87
> >> +++++++++++++++++++++++++++++++++++++++
> >> =A02 files changed, 88 insertions(+), 0 deletions(-)
> >> =A0create mode 100644 arch/arm/mach-exynos4/cpuidle.c
> >>
> >> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
> > exynos4/Makefile
> >> index 461ae57..bf206fa 100644
> >> --- a/arch/arm/mach-exynos4/Makefile
> >> +++ b/arch/arm/mach-exynos4/Makefile
> >> @@ -16,6 +16,7 @@ obj-$(CONFIG_CPU_EXYNOS4210) =A0 =A0 =A0 =A0+=3D=
 cpu.o init.o
> > clock.o
> >> irq-combiner.o
> >> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D cpu.o init.o clock.o irq-comb=
iner.o
> >> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o time.o gpiolib.o
irq-eint.o
> >> dma.o
> >> =A0obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D cpufreq=
=2Eo
> >> +obj-$(CONFIG_CPU_IDLE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D cpuidle.o
> >>
> >> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsmp=
=2Eo
> >> =A0obj-$(CONFIG_LOCAL_TIMERS) =A0 +=3D localtimer.o
> >> diff --git a/arch/arm/mach-exynos4/cpuidle.c b/arch/arm/mach-
> >> exynos4/cpuidle.c
> >> new file mode 100644
> >> index 0000000..a543a18
> >> --- /dev/null
> >> +++ b/arch/arm/mach-exynos4/cpuidle.c
> >> @@ -0,0 +1,87 @@
> >> +/* linux/arch/arm/mach-exynos4/cpuidle.c
> >> + *
> >> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> >> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> >> + *
> >> + * This program is free software; you can redistribute it and/or
modify
> >> + * it under the terms of the GNU General Public License version 2=
 as
> >> + * published by the Free Software Foundation.
> >> +*/
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/init.h>
> >> +#include <linux/cpuidle.h>
> >> +#include <linux/io.h>
> >> +
> >> +#include <asm/proc-fns.h>
> >> +
> >> +static int exynos4_enter_idle(struct cpuidle_device *dev,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpuid=
le_state *state);
> >> +
> >> +static struct cpuidle_state exynos4_cpuidle_set[] =3D {
> >> + =A0 =A0 [0] =3D {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .enter =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D exynos4_enter_idle,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .exit_latency =A0 =A0 =A0 =A0 =A0 =3D 1,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .target_residency =A0 =A0 =A0 =3D 100000=
,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D CPUIDLE_FLAG_TIME_VALID,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "IDLE",
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "ARM clock gating(WFI)",
> >> + =A0 =A0 },
> >> +};
> >> +
> >> +static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_devi=
ce);
> >> +
> >> +static struct cpuidle_driver exynos4_idle_driver =3D {
> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "exynos4_idle",
> >> + =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> >> +};
> >> +
> >> +static int exynos4_enter_idle(struct cpuidle_device *dev,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpuid=
le_state *state)
> >> +{
> >> + =A0 =A0 struct timeval before, after;
> >> + =A0 =A0 int idle_time;
> >> +
> >> + =A0 =A0 local_irq_disable();
> >> + =A0 =A0 do_gettimeofday(&before);
> >> +
> >> + =A0 =A0 cpu_do_idle();
> >> +
> >> + =A0 =A0 do_gettimeofday(&after);
> >> + =A0 =A0 local_irq_enable();
> >> + =A0 =A0 idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_=
SEC +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (after.tv_usec - before.tv_usec)=
;
> >> +
> >> + =A0 =A0 return idle_time;
> >> +}
> >> +
> >> +static int __init exynos4_init_cpuidle(void)
> >> +{
> >> + =A0 =A0 int i, max_cpuidle_state, cpu_id;
> >> + =A0 =A0 struct cpuidle_device *device;
> >> +
> >> + =A0 =A0 cpuidle_register_driver(&exynos4_idle_driver);
> >> +
> >> + =A0 =A0 for_each_cpu(cpu_id, cpu_online_mask) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 device =3D &per_cpu(exynos4_cpuidle_devi=
ce, cpu_id);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 device->cpu =3D cpu_id;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 device->state_count =3D (sizeof(exynos4_=
cpuidle_set) /
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0sizeof(struct
> > cpuidle_state));
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 max_cpuidle_state =3D device->state_coun=
t;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < max_cpuidle_state; i++=
) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&device->states[i=
],
&exynos4_cpuidle_set[i],
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 sizeof(struct cpuidle_state));
> >> + =A0 =A0 =A0 =A0 =A0 =A0 }
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 if (cpuidle_register_device(device)) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "CPUidle=
 register device
> > failed\n,");
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 }
> >> + =A0 =A0 }
> >> + =A0 =A0 return 0;
> >> +}
> >> +
> >> +device_initcall(exynos4_init_cpuidle);
> >> --
> >> 1.7.1
> >
> > Cc'ed Kyungmin Park.
> >
> > Hmm...I'm thinking that we need more discussion on this CPUIDLE lat=
er,
> > about method, IDLE states and so on.
>=20
> It's not good decision. As cpufreq, support the basic cpuidle at
> mainline kernel, and add it more states at later.
> Except the state name "IDLE", I hope it will be changed to "C1" for
> support cpuidle tool.
>=20
> Mr. Lee will support the C states soon.
>=20
> I'm okay with Mr. Lee patch.

Yeah, if required, we can update it later.

Ok, his code looks ok to me.
Will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
