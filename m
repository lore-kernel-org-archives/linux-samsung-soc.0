From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 2/8] ARM: S5PV310: Add new CPU initialization support
Date: Sat, 17 Jul 2010 12:52:01 +0900
Message-ID: <AANLkTinaYfk_FrMvwec61r-oUh2V91B9vXcxasyLhqcO@mail.gmail.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
	<1279270714-15146-3-git-send-email-kgene.kim@samsung.com>
	<20100716115219.GD17952@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:37245 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755688Ab0GQDwC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 23:52:02 -0400
Received: by pvc7 with SMTP id 7so1060746pvc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2010 20:52:01 -0700 (PDT)
In-Reply-To: <20100716115219.GD17952@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

To Ben,

Now you are working on make a single kernel for s5p series at your git.
The v310 or c210 chip also included in these works.

Previous time Marek sent the mail if you are busy with other works, he
can help it.

Give your opinions.

TO Changhwan or Kukjin

Did you see the ben's work? If yes, can you make it similar way?

Thank you,
Kyungmin Park


On Fri, Jul 16, 2010 at 8:52 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jul 16, 2010 at 05:58:28PM +0900, Kukjin Kim wrote:
>> diff --git a/arch/arm/mach-s5pv310/platsmp.c b/arch/arm/mach-s5pv310=
/platsmp.c
>> new file mode 100644
>> index 0000000..9325ac2
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv310/platsmp.c
>> @@ -0,0 +1,212 @@
>> +/* linux/arch/arm/mach-s5pv310/platsmp.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * Cloned from linux/arch/arm/mach-realview/platsmp.c
>> + *
>> + * =A0Copyright (C) 2002 ARM Ltd.
>> + * =A0All Rights Reserved
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +#include <linux/init.h>
>> +#include <linux/errno.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/smp.h>
>> +#include <linux/io.h>
>> +
>> +#include <asm/cacheflush.h>
>> +#include <mach/hardware.h>
>> +#include <asm/mach-types.h>
>> +#include <asm/localtimer.h>
>> +#include <asm/unified.h>
>> +
>> +#include <asm/smp_scu.h>
>> +#include <mach/regs-clock.h>
>> +
>> +extern void s5pv310_secondary_startup(void);
>> +
>> +/*
>> + * control for which core is the next to come out of the secondary
>> + * boot "holding pen"
>> + */
>> +volatile int __cpuinitdata pen_release =3D -1;
>> +
>> +static void __iomem *scu_base_addr(void)
>> +{
>> + =A0 =A0 return (void __iomem *)(S5P_VA_SCU);
>> +}
>> +
>> +static inline unsigned int get_core_count(void)
>> +{
>> + =A0 =A0 void __iomem *scu_base =3D scu_base_addr();
>> + =A0 =A0 if (scu_base)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return scu_get_core_count(scu_base);
>> + =A0 =A0 return 1;
>> +}
>> +
>> +static DEFINE_SPINLOCK(boot_lock);
>> +
>> +void __cpuinit platform_secondary_init(unsigned int cpu)
>> +{
>> + =A0 =A0 trace_hardirqs_off();
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* if any interrupts are already enabled for the primary
>> + =A0 =A0 =A0* core (e.g. timer irq), then they will not have been e=
nabled
>> + =A0 =A0 =A0* for us: do so
>> + =A0 =A0 =A0*/
>> + =A0 =A0 gic_cpu_init(0, gic_cpu_base_addr);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* let the primary processor know we're out of the
>> + =A0 =A0 =A0* pen, then head off into the C entry point
>> + =A0 =A0 =A0*/
>> + =A0 =A0 pen_release =3D -1;
>> + =A0 =A0 smp_wmb();
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Synchronise with the boot thread.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 spin_lock(&boot_lock);
>> + =A0 =A0 spin_unlock(&boot_lock);
>> +}
>> +
>> +int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *=
idle)
>> +{
>> + =A0 =A0 unsigned long timeout;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* set synchronisation state between this boot processor
>> + =A0 =A0 =A0* and the secondary one
>> + =A0 =A0 =A0*/
>> + =A0 =A0 spin_lock(&boot_lock);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* The secondary processor is waiting to be released fro=
m
>> + =A0 =A0 =A0* the holding pen - release it, then wait for it to fla=
g
>> + =A0 =A0 =A0* that it has been released by resetting pen_release.
>> + =A0 =A0 =A0*
>> + =A0 =A0 =A0* Note that "pen_release" is the hardware CPU ID, where=
as
>> + =A0 =A0 =A0* "cpu" is Linux's internal ID.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 pen_release =3D cpu;
>> + =A0 =A0 flush_cache_all();
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* XXX
>> + =A0 =A0 =A0*
>> + =A0 =A0 =A0* This is a later addition to the booting protocol: the
>> + =A0 =A0 =A0* bootMonitor now puts secondary cores into WFI, so
>> + =A0 =A0 =A0* poke_milo() no longer gets the cores moving; we need
>> + =A0 =A0 =A0* to send a soft interrupt to wake the secondary core.
>> + =A0 =A0 =A0* Use smp_cross_call() for this, since there's little
>> + =A0 =A0 =A0* point duplicating the code here
>> + =A0 =A0 =A0*/
>> + =A0 =A0 smp_cross_call(cpumask_of(cpu));
>> +
>> + =A0 =A0 timeout =3D jiffies + (1 * HZ);
>> + =A0 =A0 while (time_before(jiffies, timeout)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 smp_rmb();
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pen_release =3D=3D -1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 udelay(10);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* now the secondary core is starting up let it run its
>> + =A0 =A0 =A0* calibrations, then wait for it to finish
>> + =A0 =A0 =A0*/
>> + =A0 =A0 spin_unlock(&boot_lock);
>> +
>> + =A0 =A0 return pen_release !=3D -1 ? -ENOSYS : 0;
>> +}
>> +
>> +static void __init poke_milo(void)
>> +{
>> + =A0 =A0 /* nobody is to be released from the pen yet */
>> + =A0 =A0 pen_release =3D -1;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Write the address of secondary startup into the syste=
m-wide flags
>> + =A0 =A0 =A0* register. The BootMonitor waits for this register to =
become
>> + =A0 =A0 =A0* non-zero.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 __raw_writel(BSYM(virt_to_phys(s5pv310_secondary_startup))=
, S5P_INFORM0);
>> +
>> + =A0 =A0 mb();
>> +}
>> +
>> +/*
>> + * Initialise the CPU possible map early - this describes the CPUs
>> + * which may be present or become present in the system.
>> + */
>> +void __init smp_init_cpus(void)
>> +{
>> + =A0 =A0 unsigned int i, ncores =3D get_core_count();
>> +
>> + =A0 =A0 for (i =3D 0; i < ncores; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_cpu_possible(i, true);
>> +}
>> +
>> +void __init smp_prepare_cpus(unsigned int max_cpus)
>> +{
>> + =A0 =A0 unsigned int ncores =3D get_core_count();
>> + =A0 =A0 unsigned int cpu =3D smp_processor_id();
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 /* sanity check */
>> + =A0 =A0 if (ncores =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Realview: strange CM count=
 of 0? Default to 1\n");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 ncores =3D 1;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (ncores > NR_CPUS) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Realview: no. of cores (%d=
) greater than configured "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"maximum of %d - clipping\n=
",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ncores, NR_CPUS);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ncores =3D NR_CPUS;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 smp_store_cpu_info(cpu);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* are we trying to boot more cores than exist?
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (max_cpus > ncores)
>> + =A0 =A0 =A0 =A0 =A0 =A0 max_cpus =3D ncores;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Initialise the present map, which describes the set o=
f CPUs
>> + =A0 =A0 =A0* actually populated at the present time.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 for (i =3D 0; i < max_cpus; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_cpu_present(i, true);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Initialise the SCU if there are more than one CPU and=
 let
>> + =A0 =A0 =A0* them know where to start. Note that, on modern versio=
ns of
>> + =A0 =A0 =A0* MILO, the "poke" doesn't actually do anything until e=
ach
>> + =A0 =A0 =A0* individual core is sent a soft interrupt to get it ou=
t of
>> + =A0 =A0 =A0* WFI
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (max_cpus > 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* Enable the local timer or broadcast d=
evice for the
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* boot CPU, but only if we have more th=
an one CPU.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 percpu_timer_setup();
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 scu_enable(scu_base_addr());
>> + =A0 =A0 =A0 =A0 =A0 =A0 poke_milo();
>> + =A0 =A0 }
>> +}
>
> Please can you model this on the Versatile Express platsmp.c rather t=
han
> the Realview platsmp.c ?
>
> The Realview platsmp.c implementation contains a lot of left-overs fr=
om
> the initial Integrator-based SMP implementation which we really shoul=
dn't
> be carrying endlessly forward.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
