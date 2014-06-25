From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: exynos: Modify pm code to check for cortex A9 rather
 than the SoC
Date: Wed, 25 Jun 2014 20:02:09 +0900
Message-ID: <02c501cf9064$e8d164c0$ba742e40$@samsung.com>
References: <1400814061-12813-1-git-send-email-a.kesavan@samsung.com>
 <CAM4voa=3zzo-2KbjDtBOca+uJeSxT2OYpi+rJuSGsDg-vo7GYA@mail.gmail.com>
 <20140624161114.GW32514@n2100.arm.linux.org.uk>
 <CAM4voak4ZD0OHWoto7j2TyYBmpaWH3JH4ug3+hsxeL+WUhE9jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33593 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751413AbaFYLCL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:02:11 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Q000SU1BLLD30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 20:02:09 +0900 (KST)
In-reply-to: <CAM4voak4ZD0OHWoto7j2TyYBmpaWH3JH4ug3+hsxeL+WUhE9jA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <kesavan.abhilash@gmail.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>

Abhilash Kesavan wrote:
> 
> Hi Russell and Tomasz,
> 
> +Arnd
> On Tue, Jun 24, 2014 at 9:41 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Mon, Jun 16, 2014 at 09:37:14AM +0530, Abhilash Kesavan wrote:
> >> Hi Kukjin,
> >>
> >> On Fri, May 23, 2014 at 8:31 AM, Abhilash Kesavan <a.kesavan@samsung.com>
> wrote:
> >> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> >>
> >> Do you have any comments on this patch ?
> >
> > I do.
> >
> >> > diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> >> > index d10c351..6dd4a11 100644
> >> > --- a/arch/arm/mach-exynos/pm.c
> >> > +++ b/arch/arm/mach-exynos/pm.c
> >> > @@ -300,7 +300,7 @@ static int exynos_pm_suspend(void)
> >> >         tmp = (S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0);
> >> >         __raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
> >> >
> >> > -       if (!soc_is_exynos5250())
> >> > +       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
> >> >                 exynos_cpu_save_register();
> > ...
> >> > @@ -334,7 +334,7 @@ static void exynos_pm_resume(void)
> >> >         if (exynos_pm_central_resume())
> >> >                 goto early_wakeup;
> >> >
> >> > -       if (!soc_is_exynos5250())
> >> > +       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
> >> >                 exynos_cpu_restore_register();
> >
> > It is invalid to check just the part number.  The part number on its
> > own is meaningless without taking account of the implementor.  Both
> > the implementor and the part number should be checked at each of these
> > sites.
> Thanks for pointing this out. I was not aware of  the implementor id
> check requirement.
> >
> > Another point: exynos have taken it upon themselves to add code which
> > saves various ARM core registers.  This is a bad idea, it brings us
> > back to the days where every platform did their own suspend implementations.
> >
> > CPU level registers should be handled by CPU level code, not by platform
> > code.  Is there a reason why this can't be added to the Cortex-A9
> > support code in proc-v7.S ?
> >
Got it. Thanks for pointing out.

> >> > @@ -353,7 +353,7 @@ static void exynos_pm_resume(void)
> >> >
> >> >         s3c_pm_do_restore_core(exynos_core_save,
> ARRAY_SIZE(exynos_core_save));
> >> >
> >> > -       if (!soc_is_exynos5250())
> >> > +       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
> >> >                 scu_enable(S5P_VA_SCU);
> >> >
> >> >  early_wakeup:
> >> > @@ -440,15 +440,18 @@ static int exynos_cpu_pm_notifier(struct
> notifier_block *self,
> >> >         case CPU_PM_ENTER:
> >> >                 if (cpu == 0) {
> >> >                         exynos_pm_central_suspend();
> >> > -                       exynos_cpu_save_register();
> >> > +                       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
> >> > +                               exynos_cpu_save_register();
> >> >                 }
> >> >                 break;
> >> >
> >> >         case CPU_PM_EXIT:
> >> >                 if (cpu == 0) {
> >> > -                       if (!soc_is_exynos5250())
> >> > +                       if (read_cpuid_part_number() ==
> >> > +                                       ARM_CPU_PART_CORTEX_A9) {
> >> >                                 scu_enable(S5P_VA_SCU);
> >> > -                       exynos_cpu_restore_register();
> >> > +                               exynos_cpu_restore_register();
> >> > +                       }
> >> >                         exynos_pm_central_resume();
> >> >                 }
> >> >                 break;
> >
> > And presumably with the CPU level code dealing with those registers,
> > you don't need the calls to save and restore these registers in this
> > notifier.
> Regarding save/restore of these registers, I could send out a patch
> cleaning these out once Shawn's patch gets merged. I'd need some help
> testing it out on Exynos4 boards though. For now, is it OK if I just
> update to the new function ?
> >
> > Which, by the way, is probably illegal to run as it runs in a read-
> > lock code path and with the SCU disabled.  As you're calling
> > scu_enable() that means you're non-coherent with the other CPUs,
> > and therefore locks don't work.
> >
> > I think this code is very broken and wrongly architected, and shows
> > that we're continuing to make the same mistakes that we made all
> > through the 2000s with platforms doing their own crap rather than
> > properly thinking about this stuff.
> I see that you have sent a patch out that ensures both part and
> implementor number are checked. Currently, my patch has been applied
> to the fixes branch of the arm-soc tree and I wanted to know how to
> proceed (without it there is a crash on the 5420):
> Should I request Arnd to drop it (if possible) and send out a new
> patch using your updated function ?
> 
Oops, Abhilash please send new fix on top of the current patch.

Thanks,
Kukjin
