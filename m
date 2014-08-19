From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: Exynos: remove arm diagnostic and power register
 save/restore code
Date: Tue, 19 Aug 2014 11:52:22 +0200
Message-ID: <2193450.Ihy0kb3U7o@amdc1032>
References: <1407738165-10139-1-git-send-email-k.chander@samsung.com>
 <CADWw7OiqK+4_uXtPnkS4zL2nBMw08en9venrupFMfqrsWevVJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10746 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbaHSJwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 05:52:37 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NAJ00KR4SRNFV30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Aug 2014 18:52:35 +0900 (KST)
In-reply-to: <CADWw7OiqK+4_uXtPnkS4zL2nBMw08en9venrupFMfqrsWevVJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <k.chander@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>


Hi,

On Tuesday, August 19, 2014 02:58:31 PM Chander Kashyap wrote:
> On Mon, Aug 11, 2014 at 11:52 AM, Chander Kashyap <k.chander@samsung.com> wrote:
> > As save/restore of arm "diagnostic" and "power" registers is handled by
> > generic code, so remove the same.
> >
> > Signed-off-by: Chander Kashyap <k.chander@samsung.com>
> > ---
> >  arch/arm/mach-exynos/pm.c |   54 ++-------------------------------------------
> >  1 file changed, 2 insertions(+), 52 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> > index 18646b7..af99c55 100644
> > --- a/arch/arm/mach-exynos/pm.c
> > +++ b/arch/arm/mach-exynos/pm.c
> > @@ -134,45 +134,6 @@ void exynos_enter_aftr(void)
> >         exynos_sys_powerdown_conf(SYS_AFTR);
> >  }
> >
> > -/* For Cortex-A9 Diagnostic and Power control register */
> > -static unsigned int save_arm_register[2];
> > -
> > -static void exynos_cpu_save_register(void)
> > -{
> > -       unsigned long tmp;
> > -
> > -       /* Save Power control register */
> > -       asm ("mrc p15, 0, %0, c15, c0, 0"
> > -            : "=r" (tmp) : : "cc");
> > -
> > -       save_arm_register[0] = tmp;
> > -
> > -       /* Save Diagnostic register */
> > -       asm ("mrc p15, 0, %0, c15, c0, 1"
> > -            : "=r" (tmp) : : "cc");
> > -
> > -       save_arm_register[1] = tmp;
> > -}
> > -
> > -static void exynos_cpu_restore_register(void)
> > -{
> > -       unsigned long tmp;
> > -
> > -       /* Restore Power control register */
> > -       tmp = save_arm_register[0];
> > -
> > -       asm volatile ("mcr p15, 0, %0, c15, c0, 0"
> > -                     : : "r" (tmp)
> > -                     : "cc");
> > -
> > -       /* Restore Diagnostic register */
> > -       tmp = save_arm_register[1];
> > -
> > -       asm volatile ("mcr p15, 0, %0, c15, c0, 1"
> > -                     : : "r" (tmp)
> > -                     : "cc");
> > -}
> > -
> >  static int exynos_cpu_suspend(unsigned long arg)
> >  {
> >  #ifdef CONFIG_CACHE_L2X0
> > @@ -238,9 +199,6 @@ static int exynos_pm_suspend(void)
> >         tmp = (S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0);
> >         pmu_raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
> >
> > -       if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
> > -               exynos_cpu_save_register();
> > -
> >         return 0;
> >  }
> >
> > @@ -272,9 +230,6 @@ static void exynos_pm_resume(void)
> >         if (exynos_pm_central_resume())
> >                 goto early_wakeup;
> >
> > -       if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
> > -               exynos_cpu_restore_register();
> > -
> >         /* For release retention */
> >
> >         pmu_raw_writel((1 << 28), S5P_PAD_RET_MAUDIO_OPTION);
> > @@ -376,19 +331,14 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
> >
> >         switch (cmd) {
> >         case CPU_PM_ENTER:
> > -               if (cpu == 0) {
> > +               if (cpu == 0)
> >                         exynos_pm_central_suspend();
> > -                       if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
> > -                               exynos_cpu_save_register();
> > -               }
> >                 break;
> >
> >         case CPU_PM_EXIT:
> >                 if (cpu == 0) {
> > -                       if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
> > +                       if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
> >                                 scu_enable(S5P_VA_SCU);
> > -                               exynos_cpu_restore_register();
> > -                       }
> >                         exynos_pm_central_resume();
> >                 }
> >                 break;
> 
> Hi Kukjin,
> Can you take this patch?

Your cleanup patch won't apply to the current kernels becaouse
exynos_cpu_pm_notifier() has been removed.  Please resfresh it.

While refreshing it please rebase it on top of my PM_SLEEP=n build
fixes:

  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35430.html

Please also update patch description to point to the generic code
that does arm diagnostic and power register save/restore code.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
