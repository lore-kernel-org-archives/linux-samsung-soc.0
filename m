From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH V2 1/5] ARM: exynos4: Add support for AFTR mode cpuidle state
Date: Fri, 11 Nov 2011 16:42:31 +0530
Message-ID: <CAK44p20w1RN8APYLiAbxv_vK9p4UUUHM8zO_Xa2x06YVEE+a6g@mail.gmail.com>
References: <1320992977-11589-1-git-send-email-amit.kachhap@linaro.org>
	<1320992977-11589-2-git-send-email-amit.kachhap@linaro.org>
	<20111111101753.GA6292@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:62792 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751547Ab1KKLMc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Nov 2011 06:12:32 -0500
Received: by ggnb2 with SMTP id b2so4042327ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2011 03:12:31 -0800 (PST)
In-Reply-To: <20111111101753.GA6292@e102568-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@linaro.org" <patches@linaro.org>

On 11 November 2011 15:47, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com=
> wrote:
> Hi Amit,
>
> On Fri, Nov 11, 2011 at 06:29:33AM +0000, Amit Daniel Kachhap wrote:
>> This patch adds support for AFTR(ARM OFF TOP RUNNING) mode in
>> cpuidle driver for EXYNOS4210. L2 cache keeps their data in this mod=
e.
>> This patch adds the code to the latest interfaces to
>> save/restore CPU state inclusive of CPU PM notifiers, l2
>> resume and cpu_suspend/resume.
>>
>> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/cpuidle.c =A0 =A0 =A0 =A0 =A0| =A0148 ++++++=
++++++++++++++++++++++++-
>> =A0arch/arm/mach-exynos/include/mach/pmu.h | =A0 =A02 +
>> =A02 files changed, 146 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/c=
puidle.c
>> index c6485d3..857ccc6 100644
>> --- a/arch/arm/mach-exynos/cpuidle.c
>> +++ b/arch/arm/mach-exynos/cpuidle.c
>> @@ -12,13 +12,31 @@
>> =A0#include <linux/module.h>
>> =A0#include <linux/init.h>
>> =A0#include <linux/cpuidle.h>
>> +#include <linux/cpu_pm.h>
>
> Included but not used, why ? Is GIC state kept in AFTR ? Even if it
> is, VFP state is certainly gone, so you must call the notifiers anywa=
y.
>
>> =A0#include <linux/io.h>
>> -
>> +#include <linux/suspend.h>
>> +#include <linux/err.h>
>> =A0#include <asm/proc-fns.h>
>> +#include <asm/smp_scu.h>
>> +#include <asm/suspend.h>
>> +#include <asm/unified.h>
>> +#include <mach/regs-pmu.h>
>> +#include <mach/pmu.h>
>> +
>> +#include <plat/exynos4.h>
>> +#include <plat/cpu.h>
>> +
>> +#define REG_DIRECTGO_ADDR =A0 =A0(samsung_rev() =3D=3D EXYNOS4210_R=
EV_1_1 ? \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_INFORM=
7 : (S5P_VA_SYSRAM + 0x24))
>> +#define REG_DIRECTGO_FLAG =A0 =A0(samsung_rev() =3D=3D EXYNOS4210_R=
EV_1_1 ? \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_INFORM=
6 : (S5P_VA_SYSRAM + 0x20))
>>
>> =A0static int exynos4_enter_idle(struct cpuidle_device *dev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpuidle_driver *d=
rv,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index);
>> +static int exynos4_enter_lowpower(struct cpuidle_device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpu=
idle_driver *drv,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index)=
;
>>
>> =A0static struct cpuidle_state exynos4_cpuidle_set[] =3D {
>> =A0 =A0 =A0 [0] =3D {
>> @@ -26,9 +44,17 @@ static struct cpuidle_state exynos4_cpuidle_set[]=
 =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .exit_latency =A0 =A0 =A0 =A0 =A0 =3D 1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .target_residency =A0 =A0 =A0 =3D 100000=
,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D CPUIDLE_FLAG_TIME_VALID,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "IDLE",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "C0",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "ARM clock gating(WFI)",
>> =A0 =A0 =A0 },
>> + =A0 =A0 [1] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enter =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D exynos4_enter_lowpower,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .exit_latency =A0 =A0 =A0 =A0 =A0 =3D 300,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .target_residency =A0 =A0 =A0 =3D 100000,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D CPUIDLE_FLAG_TIME_VALID,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "C1",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "ARM power down",
>> + =A0 =A0 },
>> =A0};
>>
>> =A0static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_devi=
ce);
>> @@ -38,9 +64,95 @@ static struct cpuidle_driver exynos4_idle_driver =
=3D {
>> =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
>> =A0};
>>
>> +/* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
>> +static void exynos4_set_wakeupmask(void)
>> +{
>> + =A0 =A0 __raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
>> +}
>> +
>> +static unsigned int g_pwr_ctrl, g_diag_reg;
>> +
>> +static void save_cpu_arch_register(void)
>> +{
>> + =A0 =A0 /*read power control register*/
>> + =A0 =A0 asm("mrc p15, 0, %0, c15, c0, 0" : "=3Dr"(g_pwr_ctrl) : : =
"cc");
>> + =A0 =A0 /*read diagnostic register*/
>> + =A0 =A0 asm("mrc p15, 0, %0, c15, c0, 1" : "=3Dr"(g_diag_reg) : : =
"cc");
>> + =A0 =A0 return;
>> +}
>> +
>> +static void restore_cpu_arch_register(void)
>> +{
>> + =A0 =A0 /*write power control register*/
>> + =A0 =A0 asm("mcr p15, 0, %0, c15, c0, 0" : : "r"(g_pwr_ctrl) : "cc=
");
>> + =A0 =A0 /*write diagnostic register*/
>> + =A0 =A0 asm("mcr p15, 0, %0, c15, c0, 1" : : "r"(g_diag_reg) : "cc=
");
>> + =A0 =A0 return;
>> +}
>> +
>> +static int idle_finisher(unsigned long flags)
>> +{
>> + =A0 =A0 cpu_do_idle();
>> + =A0 =A0 return 1;
>> +}
>> +
>> +static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpu=
idle_driver *drv,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index)
>> +{
>> + =A0 =A0 struct timeval before, after;
>> + =A0 =A0 int idle_time;
>> + =A0 =A0 unsigned long tmp;
>> +
>> + =A0 =A0 local_irq_disable();
>> + =A0 =A0 do_gettimeofday(&before);
>> +
>> + =A0 =A0 exynos4_set_wakeupmask();
>> +
>> + =A0 =A0 /* Set value of power down register for aftr mode */
>> + =A0 =A0 exynos4_sys_powerdown_conf(SYS_AFTR);
>> +
>> + =A0 =A0 save_cpu_arch_register();
>> +
>
> You must call the notifiers here, at least cpu_pm_enter();

Yes lorenzo, cpu_pm_enter may be needed although it does GIC_CPU
save/restore which may not be needed.
Thanks for the review.

>
>> + =A0 =A0 /* Setting Central Sequence Register for power down mode *=
/
>> + =A0 =A0 tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
>> + =A0 =A0 tmp &=3D ~S5P_CENTRAL_LOWPWR_CFG;
>> + =A0 =A0 __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
>> +
>> + =A0 =A0 cpu_suspend(0, idle_finisher);
>> +
>> + =A0 =A0 scu_enable(S5P_VA_SCU);
>> +
>
> Again, you need to resume (VFP, if GIC is kept) through notifiers her=
e,
> I do not understand why that code has been removed.
>
> Lorenzo
>
>
