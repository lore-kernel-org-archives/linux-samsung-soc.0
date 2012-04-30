From: Rob Lee <rob.lee@linaro.org>
Subject: Re: [PATCH] ARM: exynos: Adapt to cpuidle core time keeping and irq enable
Date: Mon, 30 Apr 2012 11:43:18 -0500
Message-ID: <CAMXH7KG_=oupDTe7vcbDdp6wb=gHc3s8Z4EwxVeJBPGDNC8FSQ@mail.gmail.com>
References: <1335355912-26063-1-git-send-email-amit.kachhap@linaro.org> <4F980DE6.1020504@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:46218 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797Ab2D3Qnl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 12:43:41 -0400
Received: by obbta14 with SMTP id ta14so4305735obb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Apr 2012 09:43:40 -0700 (PDT)
In-Reply-To: <4F980DE6.1020504@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

On Wed, Apr 25, 2012 at 9:44 AM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 04/25/2012 02:11 PM, Amit Daniel Kachhap wrote:
>>
>> This patch enables core cpuidle timekeeping and irq enabling and
>> remove those redundant parts from the exynos cpuidle drivers
>>
>> CC: Daniel Lezcano<daniel.lezcano@linaro.org>
>> CC: Robert Lee<rob.lee@linaro.org>
>> Signed-off-by: Amit Daniel<amit.kachhap@linaro.org>
>> ---
>> =C2=A0arch/arm/mach-exynos/cpuidle.c | =C2=A0 53
>> ++++-----------------------------------
>> =C2=A01 files changed, 6 insertions(+), 47 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpuidle.c
>> b/arch/arm/mach-exynos/cpuidle.c
>> index 33ab4e7..26dac28 100644
>> --- a/arch/arm/mach-exynos/cpuidle.c
>> +++ b/arch/arm/mach-exynos/cpuidle.c
>> @@ -20,6 +20,7 @@
>> =C2=A0#include<asm/smp_scu.h>
>> =C2=A0#include<asm/suspend.h>
>> =C2=A0#include<asm/unified.h>
>> +#include<asm/cpuidle.h>
>> =C2=A0#include<mach/regs-pmu.h>
>> =C2=A0#include<mach/pmu.h>
>>
>> @@ -34,22 +35,12 @@
>>
>> =C2=A0#define S5P_CHECK_AFTR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00xFCBA0D10
>>
>> -static int exynos4_enter_idle(struct cpuidle_device *dev,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct cpuidle_driver *drv,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index);
>> =C2=A0static int exynos4_enter_lowpower(struct cpuidle_device *dev,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpuidle_driver *drv,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int index);
>>
>> =C2=A0static struct cpuidle_state exynos4_cpuidle_set[] __initdata =3D=
 {
>> - =C2=A0 =C2=A0 =C2=A0 [0] =3D {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enter =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D exynos4_enter_i=
dle,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .exit_latency =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .target_residency=
 =C2=A0 =C2=A0 =C2=A0 =3D 100000,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D CPUIDLE_FLAG_TI=
ME_VALID,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "C0",
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .desc =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "ARM clock gating=
(WFI)",
>> - =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 [0] =3D ARM_CPUIDLE_WFI_STATE,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.enter =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D exynos4_ent=
er_lowpower,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.exit_latency=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 300,
>> @@ -63,8 +54,9 @@ static struct cpuidle_state exynos4_cpuidle_set[]
>> __initdata =3D {
>> =C2=A0static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_d=
evice);
>>
>> =C2=A0static struct cpuidle_driver exynos4_idle_driver =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
"exynos4_idle",
>> - =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
THIS_MODULE,
>> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "exynos4_idle",
>> + =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D THIS_MODULE,
>> + =C2=A0 =C2=A0 =C2=A0 .en_core_tk_irqen =C2=A0 =C2=A0 =C2=A0 =3D 1,
>> =C2=A0};
>>
>> =C2=A0/* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
>> @@ -103,13 +95,8 @@ static int exynos4_enter_core0_aftr(struct
>> cpuidle_device *dev,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpuidle_driver *drv,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int index)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct timeval before, after;
>> - =C2=A0 =C2=A0 =C2=A0 int idle_time;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long tmp;
>>
>> - =C2=A0 =C2=A0 =C2=A0 local_irq_disable();
>> - =C2=A0 =C2=A0 =C2=A0 do_gettimeofday(&before);
>> -
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0exynos4_set_wakeupmask();
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set value of power down register for a=
ftr mode */
>> @@ -150,34 +137,6 @@ static int exynos4_enter_core0_aftr(struct
>> cpuidle_device *dev,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear wakeup state register */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_writel(0x0, S5P_WAKEUP_STAT);
>>
>> - =C2=A0 =C2=A0 =C2=A0 do_gettimeofday(&after);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 local_irq_enable();
>> - =C2=A0 =C2=A0 =C2=A0 idle_time =3D (after.tv_sec - before.tv_sec) =
* USEC_PER_SEC +
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (af=
ter.tv_usec - before.tv_usec);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 dev->last_residency =3D idle_time;
>> - =C2=A0 =C2=A0 =C2=A0 return index;
>> -}
>> -
>> -static int exynos4_enter_idle(struct cpuidle_device *dev,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct cpuidle_driver *drv,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index)
>> -{
>> - =C2=A0 =C2=A0 =C2=A0 struct timeval before, after;
>> - =C2=A0 =C2=A0 =C2=A0 int idle_time;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 local_irq_disable();
>> - =C2=A0 =C2=A0 =C2=A0 do_gettimeofday(&before);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 cpu_do_idle();
>> -
>> - =C2=A0 =C2=A0 =C2=A0 do_gettimeofday(&after);
>> - =C2=A0 =C2=A0 =C2=A0 local_irq_enable();
>> - =C2=A0 =C2=A0 =C2=A0 idle_time =3D (after.tv_sec - before.tv_sec) =
* USEC_PER_SEC +
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (af=
ter.tv_usec - before.tv_usec);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 dev->last_residency =3D idle_time;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return index;
>> =C2=A0}
>>
>> @@ -192,7 +151,7 @@ static int exynos4_enter_lowpower(struct
>> cpuidle_device *dev,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_index =3D=
 drv->safe_state_index;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_index =3D=3D 0)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return exynos4_en=
ter_idle(dev, drv, new_index);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return arm_cpuidl=
e_simple_enter(dev, drv, new_index);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return exynos=
4_enter_core0_aftr(dev, drv, new_index);
>> =C2=A0}

Acked-by: Robert Lee <rob.lee@linaro.org>

>
>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> --
> =C2=A0<http://www.linaro.org/> Linaro.org =E2=94=82 Open source softw=
are for ARM SoCs
>
> Follow Linaro: =C2=A0<http://www.facebook.com/pages/Linaro> Facebook =
|
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
