From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v8] ARM: EXYNOS: Use MCPM call-backs to support S2R on Exynos5420
Date: Mon, 6 Oct 2014 13:59:24 +0200
Message-ID: <CABxcv=m4vTgD8a7746NqUUPxBC6mgJpSJudN1RjBGzfJpZkgBQ@mail.gmail.com>
References: <1412089142-12056-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voa=oZmqCf5=nD54cbi_fa4iHYh1nvOC0nt9hE=mQmhb3yw@mail.gmail.com>
	<CABxcv==nvb2HtxdEU-WBkXM1sSQVuawjHenZ42D2ZhHzu_VZpQ@mail.gmail.com>
	<CAM4voamLVYsJJ=OayDD0+Y4FRBQw6_ksAsJNejwzAhY3r9Dnvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:55186 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387AbaJFL70 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 07:59:26 -0400
Received: by mail-wi0-f175.google.com with SMTP id d1so4319399wiv.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2014 04:59:24 -0700 (PDT)
In-Reply-To: <CAM4voamLVYsJJ=OayDD0+Y4FRBQw6_ksAsJNejwzAhY3r9Dnvw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hello Abhilash,

On Mon, Oct 6, 2014 at 11:08 AM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:
>>>> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
>>>> index adb36a8..222aa3c 100644
>>>> --- a/arch/arm/mach-exynos/platsmp.c
>>>> +++ b/arch/arm/mach-exynos/platsmp.c
>>>> @@ -137,6 +137,18 @@ void exynos_cpu_power_down(int cpu)
>>>>   */
>>>>  void exynos_cpu_power_up(int cpu)
>>>>  {
>>>> +       if (cpu == 0 && (of_machine_is_compatible("samsung,exynos5420") ||
>>>> +               of_machine_is_compatible("samsung,exynos5800"))) {
>>>> +               /*
>>>> +                * Bypass power down for CPU0 during suspend. Check for
>>>> +                * the SYS_PWR_REG value to decide if we are suspending
>>>> +                * the system.
>>>> +                */
>>>> +               int val = __raw_readl(pmu_base_addr +
>>>> +                               EXYNOS5_ARM_CORE0_SYS_PWR_REG);
>>>> +               if (!(val & S5P_CORE_LOCAL_PWR_EN))
>>>> +                       return;
>>>> +       }
>>>>         pmu_raw_writel(S5P_CORE_LOCAL_PWR_EN,
>>>>                         EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>>>>  }
>>>
>>> The above block of code should be in exynos_cpu_power_down(). Can you
>>> re-test s2r after modifying it ? I have to convert a __raw_readl to
>>> pmu_raw_readl in this patch as well. Once Vikas re-works the base s2r
>>> patch I will re-post a v9.
>>>
>>
>> Thanks, for the information but unfortunately even after this change I
>> still have the issue reported in [0]. I also removed the lines from
>> exynos5420_pm_resume() that you asked Vikash [1].
>
> I have just tested this on the 5420 that I have and it resumes fine.
> The difference could be in the bootloader we are using. I'll send out
> details of my current setup so that you can cross-check if everything
> is the same.

Thanks a lot for sending me the patches you are using to test.

But after looking at the differences I noticed that your patches are
not removing the lines that set the CPU0 low power states at the start
of exynos5420_pm_resume() as you asked Vikas [1] but instead your
version of this patch does not have the code that does the same
operation after the early_wakeup label like is made in $subject.

IOW, this [2] is what I had to change on top of $subject to have s2r
working. After that change, both suspending to ram and resuming due
the RTC IRQ alarm being triggered and the core pm_test case works well
on my Exynos5420 Peach Pit.

>
> Regards,
> Abhilash

Best regards,
Javier

[0]: http://www.spinics.net/lists/arm-kernel/msg367615.html
[1]: http://www.spinics.net/lists/linux-samsung-soc/msg37561.html
[2]: http://pastebin.com/raw.php?i=XSxJH3Ys
