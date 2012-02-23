From: Rob Lee <rob.lee@linaro.org>
Subject: Re: [PATCH V6 1/5] ARM: exynos: Add support AFTR mode on EXYNOS4210
Date: Thu, 23 Feb 2012 00:24:10 -0600
Message-ID: <CAMXH7KHTgzY7XZ=4rOxsu-Ra8SRTOsCg=YWOLBD1QDTskRbygw@mail.gmail.com>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
	<1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:38491 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533Ab2BWGYL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Feb 2012 01:24:11 -0500
Received: by iacb35 with SMTP id b35so1092461iac.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 22:24:11 -0800 (PST)
In-Reply-To: <1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

> =A0static struct cpuidle_state exynos4_cpuidle_set[] =3D {
> =A0 =A0 =A0 =A0[0] =3D {
> @@ -27,9 +47,17 @@ static struct cpuidle_state exynos4_cpuidle_set[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.exit_latency =A0 =A0 =A0 =A0 =A0 =3D =
1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.target_residency =A0 =A0 =A0 =3D 1000=
00,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D CPUIDLE_FLAG_TIME_VALID,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "IDLE",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "C0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =3D "ARM clock gating(WFI)",
> =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enter =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=3D exynos4_enter_lowpower,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .exit_latency =A0 =A0 =A0 =A0 =A0 =3D 3=
00,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .target_residency =A0 =A0 =A0 =3D 10000=
0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=3D CPUIDLE_FLAG_TIME_VALID,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "C1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D "ARM power down",
> + =A0 =A0 =A0 },
> =A0};

It looks like you could make this __initdata because your are copying
this state data over to the cpuidle_driver object during
initialization.

>
> =A0static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_devic=
e);
> @@ -39,9 +67,100 @@ static struct cpuidle_driver exynos4_idle_driver =
=3D {
> =A0 =A0 =A0 =A0.owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> =A0};
>
> +/* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
> +static void exynos4_set_wakeupmask(void)
> +{
> + =A0 =A0 =A0 __raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
> +}
> +
> +static unsigned int g_pwr_ctrl, g_diag_reg;
> +
> +static void save_cpu_arch_register(void)
> +{
> + =A0 =A0 =A0 /*read power control register*/
> + =A0 =A0 =A0 asm("mrc p15, 0, %0, c15, c0, 0" : "=3Dr"(g_pwr_ctrl) :=
 : "cc");
> + =A0 =A0 =A0 /*read diagnostic register*/
> + =A0 =A0 =A0 asm("mrc p15, 0, %0, c15, c0, 1" : "=3Dr"(g_diag_reg) :=
 : "cc");
> + =A0 =A0 =A0 return;
> +}
> +
> +static void restore_cpu_arch_register(void)
> +{
> + =A0 =A0 =A0 /*write power control register*/
> + =A0 =A0 =A0 asm("mcr p15, 0, %0, c15, c0, 0" : : "r"(g_pwr_ctrl) : =
"cc");
> + =A0 =A0 =A0 /*write diagnostic register*/
> + =A0 =A0 =A0 asm("mcr p15, 0, %0, c15, c0, 1" : : "r"(g_diag_reg) : =
"cc");
> + =A0 =A0 =A0 return;
> +}
> +
> +static int idle_finisher(unsigned long flags)
> +{
> + =A0 =A0 =A0 cpu_do_idle();
> + =A0 =A0 =A0 return 1;
> +}
> +
> +static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
cpuidle_driver *drv,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ind=
ex)
> +{
> + =A0 =A0 =A0 struct timeval before, after;
> + =A0 =A0 =A0 int idle_time;
> + =A0 =A0 =A0 unsigned long tmp;
> +
> + =A0 =A0 =A0 local_irq_disable();
> + =A0 =A0 =A0 do_gettimeofday(&before);
> +
> + =A0 =A0 =A0 exynos4_set_wakeupmask();
> +
> + =A0 =A0 =A0 /* Set value of power down register for aftr mode */
> + =A0 =A0 =A0 exynos4_sys_powerdown_conf(SYS_AFTR);
> +
> + =A0 =A0 =A0 __raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO=
_ADDR);
> + =A0 =A0 =A0 __raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
> +
> + =A0 =A0 =A0 save_cpu_arch_register();
> +
> + =A0 =A0 =A0 /* Setting Central Sequence Register for power down mod=
e */
> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
> + =A0 =A0 =A0 tmp &=3D ~S5P_CENTRAL_LOWPWR_CFG;
> + =A0 =A0 =A0 __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
> +
> + =A0 =A0 =A0 cpu_pm_enter();
> + =A0 =A0 =A0 cpu_suspend(0, idle_finisher);
> +
> + =A0 =A0 =A0 scu_enable(S5P_VA_SCU);
> + =A0 =A0 =A0 cpu_pm_exit();
> +
> + =A0 =A0 =A0 restore_cpu_arch_register();
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If PMU failed while entering sleep mode, WFI will =
be
> + =A0 =A0 =A0 =A0* ignored by PMU and then exiting cpu_do_idle().
> + =A0 =A0 =A0 =A0* S5P_CENTRAL_LOWPWR_CFG bit will not be set automat=
ically
> + =A0 =A0 =A0 =A0* in this situation.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
> + =A0 =A0 =A0 if (!(tmp & S5P_CENTRAL_LOWPWR_CFG)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D S5P_CENTRAL_LOWPWR_CFG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFI=
GURATION);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Clear wakeup state register */
> + =A0 =A0 =A0 __raw_writel(0x0, S5P_WAKEUP_STAT);
> +
> + =A0 =A0 =A0 do_gettimeofday(&after);
> +
> + =A0 =A0 =A0 local_irq_enable();
> + =A0 =A0 =A0 idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER=
_SEC +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (after.tv_usec - before.tv_usec=
);
> +
> + =A0 =A0 =A0 dev->last_residency =3D idle_time;
> + =A0 =A0 =A0 return index;
> +}
> +
> =A0static int exynos4_enter_idle(struct cpuidle_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=
 cpuidle_driver *drv,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ind=
ex)
> =A0{
> =A0 =A0 =A0 =A0struct timeval before, after;
> =A0 =A0 =A0 =A0int idle_time;
> @@ -60,6 +179,22 @@ static int exynos4_enter_idle(struct cpuidle_devi=
ce *dev,
> =A0 =A0 =A0 =A0return index;
> =A0}
>
> +static int exynos4_enter_lowpower(struct cpuidle_device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
cpuidle_driver *drv,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ind=
ex)
> +{
> + =A0 =A0 =A0 int new_index =3D index;
> +
> + =A0 =A0 =A0 /* This mode only can be entered when other core's are =
offline */
> + =A0 =A0 =A0 if (num_online_cpus() > 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_index =3D drv->safe_state_index;
> +
> + =A0 =A0 =A0 if (new_index =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return exynos4_enter_idle(dev, drv, new=
_index);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return exynos4_enter_core0_aftr(dev, dr=
v, new_index);
> +}
> +
> =A0static int __init exynos4_init_cpuidle(void)
> =A0{
> =A0 =A0 =A0 =A0int i, max_cpuidle_state, cpu_id;
> @@ -74,19 +209,25 @@ static int __init exynos4_init_cpuidle(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(&drv->states[i], &exynos4_cpuid=
le_set[i],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof=
(struct cpuidle_state));
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 drv->safe_state_index =3D 0;
> =A0 =A0 =A0 =A0cpuidle_register_driver(&exynos4_idle_driver);
>
> =A0 =A0 =A0 =A0for_each_cpu(cpu_id, cpu_online_mask) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device =3D &per_cpu(exynos4_cpuidle_de=
vice, cpu_id);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device->cpu =3D cpu_id;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 device->state_count =3D drv->state_coun=
t;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cpu_id =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device->state_count =3D=
 (sizeof(exynos4_cpuidle_set) /
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct cpuidle_state));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device->state_count =3D=
 1; =A0 =A0 =A0 =A0/* Support IDLE only */
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (cpuidle_register_device(device)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "CPUid=
le register device failed\n,");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
> =A0device_initcall(exynos4_init_cpuidle);
> diff --git a/arch/arm/mach-exynos/include/mach/pmu.h b/arch/arm/mach-=
exynos/include/mach/pmu.h
> index 632dd56..e76b7fa 100644
> --- a/arch/arm/mach-exynos/include/mach/pmu.h
> +++ b/arch/arm/mach-exynos/include/mach/pmu.h
> @@ -22,11 +22,13 @@ enum sys_powerdown {
> =A0 =A0 =A0 =A0NUM_SYS_POWERDOWN,
> =A0};
>
> +extern unsigned long l2x0_regs_phys;
> =A0struct exynos4_pmu_conf {
> =A0 =A0 =A0 =A0void __iomem *reg;
> =A0 =A0 =A0 =A0unsigned int val[NUM_SYS_POWERDOWN];
> =A0};
>
> =A0extern void exynos4_sys_powerdown_conf(enum sys_powerdown mode);
> +extern void s3c_cpu_resume(void);
>
> =A0#endif /* __ASM_ARCH_PMU_H */
> --
> 1.7.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
