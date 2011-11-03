From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 4/5] [CPUFREQ] EXYNOS4210: Add DVS lock feature for other driver
Date: Thu, 3 Nov 2011 14:28:37 +0900
Message-ID: <CAJ0PZbSoN-Zx16Kqh5bSAhV+rvwiZQBfwuGe9waH3HJZOg0mUA@mail.gmail.com>
References: <005701cc995c$fc66d3a0$f5347ae0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45701 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466Ab1KCF2i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 01:28:38 -0400
In-Reply-To: <005701cc995c$fc66d3a0$f5347ae0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, Jongpill Lee <boyko.lee@samsung.com>, SangWook Ju <sw.ju@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>

On Wed, Nov 2, 2011 at 9:43 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch adds DVS lock feature for other driver and pm/
> reboot notifier to enhance stability.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: SangWook Ju <sw.ju@samsung.com>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/include/mach/cpufreq.h | =A0 39 ++++++
> =A0drivers/cpufreq/exynos4210-cpufreq.c =A0 =A0 =A0 =A0 | =A0174
> +++++++++++++++++++++++++-
> =A02 files changed, 207 insertions(+), 6 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/cpufreq.h
>
> diff --git a/arch/arm/mach-exynos4/include/mach/cpufreq.h
> b/arch/arm/mach-exynos4/include/mach/cpufreq.h
> new file mode 100644
> index 0000000..7e00931
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/include/mach/cpufreq.h
> @@ -0,0 +1,39 @@
> +/* linux/arch/arm/mach-exynos4/include/mach/cpufreq.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * EXYNOS4 - CPUFreq support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/*
> + * CPU frequency level index for using cpufreq lock API
> + * This should be same with cpufreq_frequency_table
> + */
> +enum cpufreq_level_request {
> + =A0 =A0 =A0 CPU_L0, =A0 =A0 =A0 =A0 /* 1200MHz */
> + =A0 =A0 =A0 CPU_L1, =A0 =A0 =A0 =A0 /* 1000MHz */
> + =A0 =A0 =A0 CPU_L2, =A0 =A0 =A0 =A0 /* 800MHz */
> + =A0 =A0 =A0 CPU_L3, =A0 =A0 =A0 =A0 /* 500MHz */
> + =A0 =A0 =A0 CPU_L4, =A0 =A0 =A0 =A0 /* 200MHz */
> + =A0 =A0 =A0 CPU_LEVEL_END,
> +};
> +
> +enum cpufreq_lock_ID {
> + =A0 =A0 =A0 DVFS_LOCK_ID_G2D, =A0 =A0 =A0 /* G2D */
> + =A0 =A0 =A0 DVFS_LOCK_ID_TV, =A0 =A0 =A0 =A0/* TV */
> + =A0 =A0 =A0 DVFS_LOCK_ID_MFC, =A0 =A0 =A0 /* MFC */
> + =A0 =A0 =A0 DVFS_LOCK_ID_USB, =A0 =A0 =A0 /* USB */
> + =A0 =A0 =A0 DVFS_LOCK_ID_CAM, =A0 =A0 =A0 /* CAM */
> + =A0 =A0 =A0 DVFS_LOCK_ID_PM, =A0 =A0 =A0 =A0/* PM */
> + =A0 =A0 =A0 DVFS_LOCK_ID_USER, =A0 =A0 =A0/* USER */
> + =A0 =A0 =A0 DVFS_LOCK_ID_END,
> +};
> +
> +int exynos4_cpufreq_lock(unsigned int nId,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum cpufreq_level_requ=
est cpufreq_level);
> +void exynos4_cpufreq_lock_free(unsigned int nId);
> diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
> b/drivers/cpufreq/exynos4210-cpufreq.c
> index 246f9e2..30e1949 100644
> --- a/drivers/cpufreq/exynos4210-cpufreq.c
> +++ b/drivers/cpufreq/exynos4210-cpufreq.c
> @@ -17,14 +17,21 @@
> =A0#include <linux/slab.h>
> =A0#include <linux/regulator/consumer.h>
> =A0#include <linux/cpufreq.h>
> +#include <linux/suspend.h>
> +#include <linux/reboot.h>
>
> =A0#include <mach/map.h>
> =A0#include <mach/regs-clock.h>
> =A0#include <mach/regs-mem.h>
> +#include <mach/cpufreq.h>
>
> =A0#include <plat/clock.h>
> =A0#include <plat/pm.h>
>
> +static bool exynos4_cpufreq_init_done;
> +static DEFINE_MUTEX(set_freq_lock);
> +static DEFINE_MUTEX(set_cpu_freq_lock);
> +
> =A0static struct clk *cpu_clk;
> =A0static struct clk *moutcore;
> =A0static struct clk *mout_mpll;
> @@ -53,6 +60,12 @@ static struct cpufreq_frequency_table
> exynos4_freq_table[] =3D {
> =A0 =A0 =A0 =A0{0, CPUFREQ_TABLE_END},
> =A0};
>
> +/* This defines are for cpufreq lock */
> +#define CPUFREQ_MIN_LEVEL =A0 =A0 =A0(CPUFREQ_LEVEL_END - 1)
> +unsigned int cpufreq_lock_id;
> +unsigned int cpufreq_lock_val[DVFS_LOCK_ID_END];
> +unsigned int cpufreq_lock_level =3D CPUFREQ_MIN_LEVEL;
> +
> =A0static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END][7] =3D {
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Clock divider value for following
> @@ -272,22 +285,31 @@ static int exynos4_target(struct cpufreq_policy
> *policy,
> =A0{
> =A0 =A0 =A0 =A0unsigned int index, old_index;
> =A0 =A0 =A0 =A0unsigned int arm_volt;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 mutex_lock(&set_freq_lock);
>
> =A0 =A0 =A0 =A0freqs.old =3D exynos4_getspeed(policy->cpu);
>
> =A0 =A0 =A0 =A0if (cpufreq_frequency_table_target(policy, exynos4_fre=
q_table,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0freqs.old, relation, &old_index))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0freqs.old, relation, &old_index))
> {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0if (cpufreq_frequency_table_target(policy, exynos4_fre=
q_table,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0target_freq, relation, &index))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0target_freq, relation, &index)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0freqs.new =3D exynos4_freq_table[index].frequency;
> =A0 =A0 =A0 =A0freqs.cpu =3D policy->cpu;
>
> - =A0 =A0 =A0 if (freqs.new =3D=3D freqs.old)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 if (freqs.new =3D=3D freqs.old) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* get the voltage value */
> =A0 =A0 =A0 =A0arm_volt =3D exynos4_volt_table[index].arm_volt;
> @@ -311,8 +333,98 @@ static int exynos4_target(struct cpufreq_policy
> *policy,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0regulator_set_voltage(arm_regulator, a=
rm_volt, arm_volt);
> =A0 =A0 =A0 =A0}
>
> +out:
> + =A0 =A0 =A0 mutex_unlock(&set_freq_lock);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +atomic_t exynos4_cpufreq_lock_count;
> +
> +int exynos4_cpufreq_lock(unsigned int id,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum cpufreq_level_request cpufreq_leve=
l)
> +{
> + =A0 =A0 =A0 int i, old_idx =3D 0;
> + =A0 =A0 =A0 unsigned int freq_old, freq_new, arm_volt;
> +
> + =A0 =A0 =A0 if (!exynos4_cpufreq_init_done)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 if (cpufreq_lock_id & (1 << id)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s:Device [%d] already=
 locked cpufreq\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, =A0id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 mutex_lock(&set_cpu_freq_lock);
> + =A0 =A0 =A0 cpufreq_lock_id |=3D (1 << id);
> + =A0 =A0 =A0 cpufreq_lock_val[id] =3D cpufreq_level;
> +
> + =A0 =A0 =A0 /* If the requested cpufreq is higher than current min =
frequency */
> + =A0 =A0 =A0 if (cpufreq_level < cpufreq_lock_level)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_lock_level =3D cpufreq_level;
> +
> + =A0 =A0 =A0 mutex_unlock(&set_cpu_freq_lock);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If current frequency is lower than requested freq,
> + =A0 =A0 =A0 =A0* it needs to update
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 mutex_lock(&set_freq_lock);
> + =A0 =A0 =A0 freq_old =3D exynos4_getspeed(0);
> + =A0 =A0 =A0 freq_new =3D exynos4_freq_table[cpufreq_level].frequenc=
y;
> + =A0 =A0 =A0 if (freq_old < freq_new) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Find out current level index */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0 ; i < CPUFREQ_LEVEL_END ; =
i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (freq_old =3D=3D exy=
nos4_freq_table[i].frequency) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 old_idx=
 =3D exynos4_freq_table[i].index;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (i =3D=3D (CP=
UFREQ_LEVEL_END - 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(=
KERN_ERR "%s: Level not found\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 __func__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_u=
nlock(&set_freq_lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return =
-EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continu=
e;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freqs.old =3D freq_old;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freqs.new =3D freq_new;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFR=
EQ_PRECHANGE);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* get the voltage value */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm_volt =3D exynos4_volt_table[cpufreq=
_level].arm_volt;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_set_voltage(arm_regulator, ar=
m_volt,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm_vol=
t);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_set_frequency(old_idx, cpufreq_=
level);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFR=
EQ_POSTCHANGE);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 mutex_unlock(&set_freq_lock);
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +EXPORT_SYMBOL_GPL(exynos4_cpufreq_lock);
> +
> +void exynos4_cpufreq_lock_free(unsigned int id)
> +{
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 if (!exynos4_cpufreq_init_done)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 mutex_lock(&set_cpu_freq_lock);
> + =A0 =A0 =A0 cpufreq_lock_id &=3D ~(1 << id);
> + =A0 =A0 =A0 cpufreq_lock_val[id] =3D CPUFREQ_MIN_LEVEL;
> + =A0 =A0 =A0 cpufreq_lock_level =3D CPUFREQ_MIN_LEVEL;
> + =A0 =A0 =A0 if (cpufreq_lock_id) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < DVFS_LOCK_ID_END; i++=
) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cpufreq_lock_val[i]=
 < cpufreq_lock_level)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq=
_lock_level =3D cpufreq_lock_val[i];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 mutex_unlock(&set_cpu_freq_lock);
> +}
> +EXPORT_SYMBOL_GPL(exynos4_cpufreq_lock_free);
>
> =A0#ifdef CONFIG_PM
> =A0static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy)
> @@ -326,6 +438,31 @@ static int exynos4_cpufreq_resume(struct cpufreq=
_policy
> *policy)
> =A0}
> =A0#endif
>
> +static int exynos4_cpufreq_notifier_event(struct notifier_block *thi=
s,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long event, void *ptr)
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 switch (event) {
> + =A0 =A0 =A0 case PM_SUSPEND_PREPARE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D exynos4_cpufreq_lock(DVFS_LOCK_=
ID_PM, CPU_L0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NOTIFY_BAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("PM_SUSPEND_PREPARE for CPUFRE=
Q\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NOTIFY_OK;
> + =A0 =A0 =A0 case PM_POST_RESTORE:
> + =A0 =A0 =A0 case PM_POST_SUSPEND:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("PM_POST_SUSPEND for CPUFREQ\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_cpufreq_lock_free(DVFS_LOCK_ID_=
PM);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NOTIFY_OK;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block exynos4_cpufreq_notifier =3D {
> + =A0 =A0 =A0 .notifier_call =3D exynos4_cpufreq_notifier_event,
> +};
> +
> =A0static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
> =A0{
> =A0 =A0 =A0 =A0policy->cur =3D policy->min =3D policy->max =3D
> exynos4_getspeed(policy->cpu);
> @@ -351,6 +488,23 @@ static int exynos4_cpufreq_cpu_init(struct
> cpufreq_policy *policy)
> =A0 =A0 =A0 =A0return cpufreq_frequency_table_cpuinfo(policy, exynos4=
_freq_table);
> =A0}
>
> +static int exynos4_cpufreq_reboot_notifier_call(struct notifier_bloc=
k
> *this,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long code, void *_cmd)
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 ret =3D exynos4_cpufreq_lock(DVFS_LOCK_ID_PM, CPU_L0);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NOTIFY_BAD;
> +
> + =A0 =A0 =A0 printk(KERN_INFO "REBOOT Notifier for CPUFREQ\n");
> + =A0 =A0 =A0 return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block exynos4_cpufreq_reboot_notifier =3D {
> + =A0 =A0 =A0 .notifier_call =3D exynos4_cpufreq_reboot_notifier_call=
,
> +};
> +
> =A0static struct cpufreq_driver exynos4_driver =3D {
> =A0 =A0 =A0 =A0.flags =A0 =A0 =A0 =A0 =A0=3D CPUFREQ_STICKY,
> =A0 =A0 =A0 =A0.verify =A0 =A0 =A0 =A0 =3D exynos4_verify_speed,
> @@ -391,6 +545,11 @@ static int __init exynos4_cpufreq_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_vdd_arm;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 register_pm_notifier(&exynos4_cpufreq_notifier);
> + =A0 =A0 =A0 register_reboot_notifier(&exynos4_cpufreq_reboot_notifi=
er);
> +
> + =A0 =A0 =A0 exynos4_cpufreq_init_done =3D true;
> +
> =A0 =A0 =A0 =A0tmp =3D __raw_readl(S5P_CLKDIV_CPU);
>
> =A0 =A0 =A0 =A0for (i =3D L0; i < =A0CPUFREQ_LEVEL_END; i++) {
> @@ -420,6 +579,9 @@ static int __init exynos4_cpufreq_init(void)
>
> =A0 =A0 =A0 =A0return 0;
> =A0err_cpufreq:
> + =A0 =A0 =A0 unregister_reboot_notifier(&exynos4_cpufreq_reboot_noti=
fier);
> + =A0 =A0 =A0 unregister_pm_notifier(&exynos4_cpufreq_notifier);
> +
> =A0 =A0 =A0 =A0if (!IS_ERR(arm_regulator))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0regulator_put(arm_regulator);
>
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Except for the case of PM (suspend/reset), it appears that this
feature is something that is meant to be supported by qos
(<linux/pm_qos.h>).
Couldn't we simply use the QoS feature to support locking frequency
above some specific levels? With QoS, I guess the implementation
becomes more general and straightforward.
Although we will probably need to use "CPU_DMA_LATENCY" for this case,
I think it isn't awefully difficult to use DMA-Latency as the metric.

One concern about this is that we are hereby enforcing all the related
device drivers stuck with Exynos4210 only unless others also use
"cpufreq_lock_ID" and its friends.

Cheers!
MyungJoo.

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
