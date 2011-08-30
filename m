From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH] CPUFREQ: ARM Exynos4210 PM/Suspend Compatibility with
 Different Bootloaders
Date: Tue, 30 Aug 2011 13:40:43 +0900
Message-ID: <CAJ0PZbRKEF4uELY_VVbisx9oKc1JePp8HQ2n+081iXGAx0_qQQ@mail.gmail.com>
References: <1313664316-15440-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1313664316-15440-1-git-send-email-myungjoo.ham@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Dave Jones <davej@redhat.com>, Jaecheol Lee <jc.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, myungjoo.ham@gmail.com, dg77.kim@samsung.com, Axel Lin <axel.lin@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Adding Kgene to the recipient list.


Please note that even without the cases using different bootloader, we
might have cases where CPUFREQ calling the target function right
before syscore suspend or right after syscore resume where we might
fail at the target function.

Anyway, I guess CPUFREQ'd be better use suspend callbacks that are
earlier than syscore (preferably somewhere before dpm_suspend or at
dpm_suspend) because CPUFREQ's target callback uses other device
drivers, but this could be just a case of S5PV210 and Exynos4210.


Cheers,
MyungJoo

On Thu, Aug 18, 2011 at 7:45 PM, MyungJoo Ham <myungjoo.ham@samsung.com=
> wrote:
> We have various bootloaders for Exynos4210 machines. Some of they
> set the ARM core frequency at boot time even when the boot is a resum=
e
> from suspend-to-RAM. Such changes may create inconsistency in the
> data of CPUFREQ driver and have incurred hang issues with suspend-to-=
RAM.
>
> This patch enables to save and restore CPU frequencies with pm-notifi=
er and
> sets the frequency at the initial (boot-time) value so that there wou=
ldn't
> be any inconsistency between bootloader and kernel. This patch does n=
ot
> use CPUFREQ's suspend/resume callbacks because they are syscore-ops, =
which
> do not allow to use mutex that is being used by regulators that are u=
sed by
> the target function.
>
> This also prevents any CPUFREQ transitions during suspend-resume cont=
ext,
> which could be dangerous at noirq-context along with regulator framew=
ork.
>
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0drivers/cpufreq/exynos4210-cpufreq.c | =A0106 ++++++++++++++++++++=
++++++++++++-
> =A01 files changed, 102 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/e=
xynos4210-cpufreq.c
> index b7c3a84..101898a 100644
> --- a/drivers/cpufreq/exynos4210-cpufreq.c
> +++ b/drivers/cpufreq/exynos4210-cpufreq.c
> @@ -17,6 +17,8 @@
> =A0#include <linux/slab.h>
> =A0#include <linux/regulator/consumer.h>
> =A0#include <linux/cpufreq.h>
> +#include <linux/notifier.h>
> +#include <linux/suspend.h>
>
> =A0#include <mach/map.h>
> =A0#include <mach/regs-clock.h>
> @@ -36,6 +38,10 @@ static struct regulator *int_regulator;
> =A0static struct cpufreq_freqs freqs;
> =A0static unsigned int memtype;
>
> +static unsigned int locking_frequency;
> +static bool frequency_locked;
> +static DEFINE_MUTEX(cpufreq_lock);
> +
> =A0enum exynos4_memory_type {
> =A0 =A0 =A0 =A0DDR2 =3D 4,
> =A0 =A0 =A0 =A0LPDDR2,
> @@ -405,22 +411,32 @@ static int exynos4_target(struct cpufreq_policy=
 *policy,
> =A0{
> =A0 =A0 =A0 =A0unsigned int index, old_index;
> =A0 =A0 =A0 =A0unsigned int arm_volt, int_volt;
> + =A0 =A0 =A0 int err =3D -EINVAL;
>
> =A0 =A0 =A0 =A0freqs.old =3D exynos4_getspeed(policy->cpu);
>
> + =A0 =A0 =A0 mutex_lock(&cpufreq_lock);
> +
> + =A0 =A0 =A0 if (frequency_locked && target_freq !=3D locking_freque=
ncy) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -EAGAIN;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0if (cpufreq_frequency_table_target(policy, exynos4_fre=
q_table,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 freqs.old, relation, &old_index))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> =A0 =A0 =A0 =A0if (cpufreq_frequency_table_target(policy, exynos4_fre=
q_table,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 target_freq, relation, &index))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> +
> + =A0 =A0 =A0 err =3D 0;
>
> =A0 =A0 =A0 =A0freqs.new =3D exynos4_freq_table[index].frequency;
> =A0 =A0 =A0 =A0freqs.cpu =3D policy->cpu;
>
> =A0 =A0 =A0 =A0if (freqs.new =3D=3D freqs.old)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> =A0 =A0 =A0 =A0/* get the voltage value */
> =A0 =A0 =A0 =A0arm_volt =3D exynos4_volt_table[index].arm_volt;
> @@ -447,10 +463,16 @@ static int exynos4_target(struct cpufreq_policy=
 *policy,
>
> =A0 =A0 =A0 =A0cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
>
> - =A0 =A0 =A0 return 0;
> +out:
> + =A0 =A0 =A0 mutex_unlock(&cpufreq_lock);
> + =A0 =A0 =A0 return err;
> =A0}
>
> =A0#ifdef CONFIG_PM
> +/*
> + * These suspend/resume are used as syscore_ops, it is already too
> + * late to set regulator voltages at this stage.
> + */
> =A0static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy)
> =A0{
> =A0 =A0 =A0 =A0return 0;
> @@ -462,6 +484,78 @@ static int exynos4_cpufreq_resume(struct cpufreq=
_policy *policy)
> =A0}
> =A0#endif
>
> +/**
> + * exynos4_cpufreq_pm_notifier - block CPUFREQ's activities in suspe=
nd-resume
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 context
> + * @notifier
> + * @pm_event
> + * @v
> + *
> + * While frequency_locked =3D=3D true, target() ignores every freque=
ncy but
> + * locking_frequency. The locking_frequency value is the initial fre=
quency,
> + * which is set by the bootloader. In order to eliminate possible
> + * inconsistency in clock values, we save and restore frequencies du=
ring
> + * suspend and resume and block CPUFREQ activities. Note that the st=
andard
> + * suspend/resume cannot be used as they are too deep (syscore_ops) =
for
> + * regulator actions.
> + */
> +static int exynos4_cpufreq_pm_notifier(struct notifier_block *notifi=
er,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0unsigned long pm_event, void *v)
> +{
> + =A0 =A0 =A0 struct cpufreq_policy *policy =3D cpufreq_cpu_get(0); /=
* boot CPU */
> + =A0 =A0 =A0 static unsigned int saved_frequency;
> + =A0 =A0 =A0 unsigned int temp;
> +
> + =A0 =A0 =A0 mutex_lock(&cpufreq_lock);
> + =A0 =A0 =A0 switch (pm_event) {
> + =A0 =A0 =A0 case PM_SUSPEND_PREPARE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (frequency_locked)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 frequency_locked =3D true;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (locking_frequency) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 saved_frequency =3D exy=
nos4_getspeed(0);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&cpufreq_l=
ock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_target(policy, =
locking_frequency,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0CPUFREQ_RELATION_H);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&cpufreq_loc=
k);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PM_POST_SUSPEND:
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (saved_frequency) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* While frequency_lo=
cked, only locking_frequency
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* is valid for targe=
t(). In order to use
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* saved_frequency wh=
ile keeping frequency_locked,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* we temporarly over=
write locking_frequency.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 temp =3D locking_freque=
ncy;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 locking_frequency =3D s=
aved_frequency;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&cpufreq_l=
ock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_target(policy, =
locking_frequency,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0CPUFREQ_RELATION_H);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&cpufreq_loc=
k);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 locking_frequency =3D t=
emp;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 frequency_locked =3D false;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +out:
> + =A0 =A0 =A0 mutex_unlock(&cpufreq_lock);
> +
> + =A0 =A0 =A0 return NOTIFY_OK;
> +}
> +
> +static struct notifier_block exynos4_cpufreq_nb =3D {
> + =A0 =A0 =A0 .notifier_call =3D exynos4_cpufreq_pm_notifier,
> +};
> +
> =A0static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
> =A0{
> =A0 =A0 =A0 =A0policy->cur =3D policy->min =3D policy->max =3D exynos=
4_getspeed(policy->cpu);
> @@ -501,6 +595,8 @@ static int __init exynos4_cpufreq_init(void)
> =A0 =A0 =A0 =A0if (IS_ERR(cpu_clk))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return PTR_ERR(cpu_clk);
>
> + =A0 =A0 =A0 locking_frequency =3D exynos4_getspeed(0);
> +
> =A0 =A0 =A0 =A0moutcore =3D clk_get(NULL, "moutcore");
> =A0 =A0 =A0 =A0if (IS_ERR(moutcore))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> @@ -540,6 +636,8 @@ static int __init exynos4_cpufreq_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "%s: memtype=3D 0x%x=
\n", __func__, memtype);
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 register_pm_notifier(&exynos4_cpufreq_nb);
> +
> =A0 =A0 =A0 =A0return cpufreq_register_driver(&exynos4_driver);
>
> =A0out:
> --
> 1.7.4.1
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
