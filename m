From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH] ARM: exynos4: Fix for stall in case of cpu hotplug or sleep
Date: Thu, 1 Dec 2011 20:23:10 +0530
Message-ID: <CADGdYn7jfFYkuoFX9J3NtNbgLHgagWHa3q3mehJU+gY_mg5EOw@mail.gmail.com>
References: <1321616752-1233-1-git-send-email-amit.kachhap@linaro.org>
	<047501ccb014$edda8f60$c98fae20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:41350 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754707Ab1LAOxM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 09:53:12 -0500
Received: by vcbfk14 with SMTP id fk14so1473069vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 06:53:11 -0800 (PST)
In-Reply-To: <047501ccb014$edda8f60$c98fae20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org, LAK <linux-arm-kernel@lists.infradead.org>

On Thu, Dec 1, 2011 at 4:05 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Amit Daniel Kachhap wrote:
>>
>> This patch adds remove_irq in place of disable_irq which is
>> correct equivalent function for setup_irq used in
>> exynos4_mct_tick_init.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> Tested-by: Inderpal Singh <inderpal.singh@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/mct.c | =A0 =A06 +++++-
>> =A01 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
>> index 97343df..959f251 100644
>> --- a/arch/arm/mach-exynos/mct.c
>> +++ b/arch/arm/mach-exynos/mct.c
>> @@ -428,9 +428,13 @@ int __cpuinit local_timer_setup(struct
>> clock_event_device *evt)
>>
>> =A0void local_timer_stop(struct clock_event_device *evt)
>> =A0{
>> + =A0 =A0 unsigned int cpu =3D smp_processor_id();
>> =A0 =A0 =A0 evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
>> =A0 =A0 =A0 if (mct_int_type =3D=3D MCT_INT_SPI)
>> - =A0 =A0 =A0 =A0 =A0 =A0 disable_irq(evt->irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (cpu =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 remove_irq(evt->irq, &mct_=
tick0_event_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 remove_irq(evt->irq, &mct_=
tick1_event_irq);
>
> Hmm, how about the cpu number is 2 or 3 on Quad-core?
> As you know, this should be used for all of EXYNOS SoCs.

This code change is specific for EXYNOS4210 where the MCT irq is SPI
type. Other exynos soc's (4412 etc) are not effected by this change.
I am adding the cpu stall log currently caused during cpu1 hotplug or
sleep/wakeup sequence. This commit fixes this.


root@localhost:~# echo 1 > /sys/devices/system/cpu/cpu1/online
CPU1: Booted secondary processor
Calibrating delay loop (skipped) already calibrated this CPU
CPU1: Unknown IPI message 0x1

INFO: rcu_sched detected stalls on CPUs/tasks: { 1} (detected by 0,
t=3D12002 jiffies)
[<c0015980>] (unwind_backtrace+0x0/0xfc) from [<c0075124>]
(__rcu_pending+0x45c/0x4d8)
[<c0075124>] (__rcu_pending+0x45c/0x4d8) from [<c0075250>]
(rcu_check_callbacks+0xb0/0x210)
[<c0075250>] (rcu_check_callbacks+0xb0/0x210) from [<c003f62c>]
(update_process_times+0x3c/0x50)
[<c003f62c>] (update_process_times+0x3c/0x50) from [<c005ee50>]
(tick_sched_timer+0x94/0xd0)
[<c005ee50>] (tick_sched_timer+0x94/0xd0) from [<c00527ac>]
(__run_hrtimer+0x44/0xd8)
[<c00527ac>] (__run_hrtimer+0x44/0xd8) from [<c0052af0>]
(hrtimer_interrupt+0x100/0x330)
[<c0052af0>] (hrtimer_interrupt+0x100/0x330) from [<c001f080>]
(exynos4_mct_tick_isr+0x50/0x68)
[<c001f080>] (exynos4_mct_tick_isr+0x50/0x68) from [<c006d438>]
(handle_irq_event_percpu+0x54/0x180)
[<c006d438>] (handle_irq_event_percpu+0x54/0x180) from [<c006d5a0>]
(handle_irq_event+0x3c/0x5c)
[<c006d5a0>] (handle_irq_event+0x3c/0x5c) from [<c00701a8>]
(handle_fasteoi_irq+0x9c/0x104)
[<c00701a8>] (handle_fasteoi_irq+0x9c/0x104) from [<c006cf0c>]
(generic_handle_irq+0x34/0x3c)
[<c006cf0c>] (generic_handle_irq+0x34/0x3c) from [<c000fde8>]
(handle_IRQ+0x58/0xb8)
[<c000fde8>] (handle_IRQ+0x58/0xb8) from [<c000e8ec>] (__irq_svc+0x6c/0=
xe8)
[<c000e8ec>] (__irq_svc+0x6c/0xe8) from [<c001edbc>]
(exynos4_enter_idle+0x2c/0x60)
[<c001edbc>] (exynos4_enter_idle+0x2c/0x60) from [<c01cfa7c>]
(cpuidle_idle_call+0xb8/0x12c)
[<c01cfa7c>] (cpuidle_idle_call+0xb8/0x12c) from [<c0010744>]
(cpu_idle+0xac/0xf4)
[<c0010744>] (cpu_idle+0xac/0xf4) from [<c02908f8>] (start_kernel+0x36c=
/0x378)
INFO: rcu_preempt detected stalls on CPUs/tasks: { 1} (detected by 0,
t=3D12002 jiffies)
[<c0015980>] (unwind_backtrace+0x0/0xfc) from [<c0075124>]
(__rcu_pending+0x45c/0x4d8)
[<c0075124>] (__rcu_pending+0x45c/0x4d8) from [<c00752ec>]
(rcu_check_callbacks+0x14c/0x210)
[<c00752ec>] (rcu_check_callbacks+0x14c/0x210) from [<c003f62c>]
(update_process_times+0x3c/0x50)
[<c003f62c>] (update_process_times+0x3c/0x50) from [<c005ee50>]
(tick_sched_timer+0x94/0xd0)
[<c005ee50>] (tick_sched_timer+0x94/0xd0) from [<c00527ac>]
(__run_hrtimer+0x44/0xd8)
[<c00527ac>] (__run_hrtimer+0x44/0xd8) from [<c0052af0>]
(hrtimer_interrupt+0x100/0x330)
[<c0052af0>] (hrtimer_interrupt+0x100/0x330) from [<c001f080>]
(exynos4_mct_tick_isr+0x50/0x68)
[<c001f080>] (exynos4_mct_tick_isr+0x50/0x68) from [<c006d438>]
(handle_irq_event_percpu+0x54/0x180)
[<c006d438>] (handle_irq_event_percpu+0x54/0x180) from [<c006d5a0>]
(handle_irq_event+0x3c/0x5c)
[<c006d5a0>] (handle_irq_event+0x3c/0x5c) from [<c00701a8>]
(handle_fasteoi_irq+0x9c/0x104)
[<c00701a8>] (handle_fasteoi_irq+0x9c/0x104) from [<c006cf0c>]
(generic_handle_irq+0x34/0x3c)
[<c006cf0c>] (generic_handle_irq+0x34/0x3c) from [<c000fde8>]
(handle_IRQ+0x58/0xb8)
[<c000fde8>] (handle_IRQ+0x58/0xb8) from [<c000e8ec>] (__irq_svc+0x6c/0=
xe8)
[<c000e8ec>] (__irq_svc+0x6c/0xe8) from [<c001edbc>]
(exynos4_enter_idle+0x2c/0x60)
[<c001edbc>] (exynos4_enter_idle+0x2c/0x60) from [<c01cfa7c>]
(cpuidle_idle_call+0xb8/0x12c)
[<c01cfa7c>] (cpuidle_idle_call+0xb8/0x12c) from [<c0010744>]
(cpu_idle+0xac/0xf4)
[<c0010744>] (cpu_idle+0xac/0xf4) from [<c02908f8>] (start_kernel+0x36c=
/0x378)

Thanks,
Amit Daniel

>
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_percpu_irq(IRQ_MCT_LOCALTIMER);
>> =A0}
>> --
>> 1.7.1
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
