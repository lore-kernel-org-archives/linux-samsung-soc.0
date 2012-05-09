From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: Adapt to cpuidle core time keeping and irq
 enable
Date: Wed, 09 May 2012 20:53:36 +0900
Message-ID: <019801cd2dda$5dbbc680$19335380$%kim@samsung.com>
References: <1335355912-26063-1-git-send-email-amit.kachhap@linaro.org>
 <4F980DE6.1020504@linaro.org>
 <CAMXH7KG_=oupDTe7vcbDdp6wb=gHc3s8Z4EwxVeJBPGDNC8FSQ@mail.gmail.com>
 <CADGdYn6KLNA+EG4DCmvP_ZohORe0LjtUi+7m0DTxcjgqwUC1HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12127 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757180Ab2EILxh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 07:53:37 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R00C6A7P0OU30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 20:53:36 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R005IK7PBJ850@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 20:53:36 +0900 (KST)
In-reply-to: <CADGdYn6KLNA+EG4DCmvP_ZohORe0LjtUi+7m0DTxcjgqwUC1HQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'amit kachhap' <amit.kachhap@gmail.com>
Cc: 'Rob Lee' <rob.lee@linaro.org>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org

amit kachhap wrote:
>=20
> Hi Mr Kukjin,
>=20
> Any comment or update about this patch?
>=20
I'm not sure we don't need to check the idle_time?
Others, looks ok to me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Regards,
> Amit Daniel
>=20
> On Mon, Apr 30, 2012 at 10:13 PM, Rob Lee <rob.lee@linaro.org> wrote:
> > On Wed, Apr 25, 2012 at 9:44 AM, Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> >> On 04/25/2012 02:11 PM, Amit Daniel Kachhap wrote:
> >>>
> >>> This patch enables core cpuidle timekeeping and irq enabling and
> >>> remove those redundant parts from the exynos cpuidle drivers
> >>>
> >>> CC: Daniel Lezcano<daniel.lezcano@linaro.org>
> >>> CC: Robert Lee<rob.lee@linaro.org>
> >>> Signed-off-by: Amit Daniel<amit.kachhap@linaro.org>
> >>> ---
> >>>  arch/arm/mach-exynos/cpuidle.c |   53
> >>> ++++-----------------------------------
> >>>  1 files changed, 6 insertions(+), 47 deletions(-)
> >>>
> >>> diff --git a/arch/arm/mach-exynos/cpuidle.c
> >>> b/arch/arm/mach-exynos/cpuidle.c
> >>> index 33ab4e7..26dac28 100644
> >>> --- a/arch/arm/mach-exynos/cpuidle.c
> >>> +++ b/arch/arm/mach-exynos/cpuidle.c
> >>> @@ -20,6 +20,7 @@
> >>>  #include<asm/smp_scu.h>
> >>>  #include<asm/suspend.h>
> >>>  #include<asm/unified.h>
> >>> +#include<asm/cpuidle.h>
> >>>  #include<mach/regs-pmu.h>
> >>>  #include<mach/pmu.h>
> >>>
> >>> @@ -34,22 +35,12 @@
> >>>
> >>>  #define S5P_CHECK_AFTR                0xFCBA0D10
> >>>
> >>> -static int exynos4_enter_idle(struct cpuidle_device *dev,
> >>> -                       struct cpuidle_driver *drv,
> >>> -                             int index);
> >>>  static int exynos4_enter_lowpower(struct cpuidle_device *dev,
> >>>                                struct cpuidle_driver *drv,
> >>>                                int index);
> >>>
> >>>  static struct cpuidle_state exynos4_cpuidle_set[] __initdata =3D=
 {
> >>> -       [0] =3D {
> >>> -               .enter                  =3D exynos4_enter_idle,
> >>> -               .exit_latency           =3D 1,
> >>> -               .target_residency       =3D 100000,
> >>> -               .flags                  =3D CPUIDLE_FLAG_TIME_VAL=
ID,
> >>> -               .name                   =3D "C0",
> >>> -               .desc                   =3D "ARM clock gating(WFI=
)",
> >>> -       },
> >>> +       [0] =3D ARM_CPUIDLE_WFI_STATE,
> >>>        [1] =3D {
> >>>                .enter                  =3D exynos4_enter_lowpower=
,
> >>>                .exit_latency           =3D 300,
> >>> @@ -63,8 +54,9 @@ static struct cpuidle_state exynos4_cpuidle_set=
[]
> >>> __initdata =3D {
> >>>  static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_dev=
ice);
> >>>
> >>>  static struct cpuidle_driver exynos4_idle_driver =3D {
> >>> -       .name           =3D "exynos4_idle",
> >>> -       .owner          =3D THIS_MODULE,
> >>> +       .name                   =3D "exynos4_idle",
> >>> +       .owner                  =3D THIS_MODULE,
> >>> +       .en_core_tk_irqen       =3D 1,
> >>>  };
> >>>
> >>>  /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
> >>> @@ -103,13 +95,8 @@ static int exynos4_enter_core0_aftr(struct
> >>> cpuidle_device *dev,
> >>>                                struct cpuidle_driver *drv,
> >>>                                int index)
> >>>  {
> >>> -       struct timeval before, after;
> >>> -       int idle_time;
> >>>        unsigned long tmp;
> >>>
> >>> -       local_irq_disable();
> >>> -       do_gettimeofday(&before);
> >>> -
> >>>        exynos4_set_wakeupmask();
> >>>
> >>>        /* Set value of power down register for aftr mode */
> >>> @@ -150,34 +137,6 @@ static int exynos4_enter_core0_aftr(struct
> >>> cpuidle_device *dev,
> >>>        /* Clear wakeup state register */
> >>>        __raw_writel(0x0, S5P_WAKEUP_STAT);
> >>>
> >>> -       do_gettimeofday(&after);
> >>> -
> >>> -       local_irq_enable();
> >>> -       idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_S=
EC +
> >>> -                   (after.tv_usec - before.tv_usec);
> >>> -
> >>> -       dev->last_residency =3D idle_time;
> >>> -       return index;
> >>> -}
> >>> -
> >>> -static int exynos4_enter_idle(struct cpuidle_device *dev,
> >>> -                               struct cpuidle_driver *drv,
> >>> -                               int index)
> >>> -{
> >>> -       struct timeval before, after;
> >>> -       int idle_time;
> >>> -
> >>> -       local_irq_disable();
> >>> -       do_gettimeofday(&before);
> >>> -
> >>> -       cpu_do_idle();
> >>> -
> >>> -       do_gettimeofday(&after);
> >>> -       local_irq_enable();
> >>> -       idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_S=
EC +
> >>> -                   (after.tv_usec - before.tv_usec);
> >>> -
> >>> -       dev->last_residency =3D idle_time;
> >>>        return index;
> >>>  }
> >>>
> >>> @@ -192,7 +151,7 @@ static int exynos4_enter_lowpower(struct
> >>> cpuidle_device *dev,
> >>>                new_index =3D drv->safe_state_index;
> >>>
> >>>        if (new_index =3D=3D 0)
> >>> -               return exynos4_enter_idle(dev, drv, new_index);
> >>> +               return arm_cpuidle_simple_enter(dev, drv, new_ind=
ex);
> >>>        else
> >>>                return exynos4_enter_core0_aftr(dev, drv, new_inde=
x);
> >>>  }
> >
> > Acked-by: Robert Lee <rob.lee@linaro.org>
> >
> >>
> >>
> >> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >>
> >> --
> >>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source softwar=
e for ARM
> SoCs
> >>
> >> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> >> <http://twitter.com/#!/linaroorg> Twitter |
> >> <http://www.linaro.org/linaro-blog/> Blog
> >>
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
