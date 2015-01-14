From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: Add the support for
 Exynos 64bit SoC
Date: Wed, 14 Jan 2015 17:02:03 +0100
Message-ID: <54B692FB.7030703@linaro.org>
References: <1421213603-5020-1-git-send-email-cw00.choi@samsung.com> <54B69072.4080607@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:63925 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750920AbbANQCF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 11:02:05 -0500
Received: by mail-we0-f181.google.com with SMTP id q58so9623932wes.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2015 08:02:04 -0800 (PST)
In-Reply-To: <54B69072.4080607@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: tglx@linutronix.de, inki.dae@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>

On 01/14/2015 04:51 PM, Kukjin Kim wrote:
> On 01/14/15 14:33, Chanwoo Choi wrote:
>
> Hi,
>
> + Doug, Olof
>
>> This patch adds the support for Exynos 64bit SoC. The delay_timer is=
 only used
>> for Exynos 32bit SoC.
>>
> Yes, the Exynos MCT(Multi-Core Timer) is 64bit timer and it is availa=
ble
> on 64bit exynos SoC such as exynos7. But basically ARMv8 architecture=
 is
> including ARM ARCH timer (ARM Generic Timer) and exynos7 also has
> implemented it and additionally its access is faster than using memor=
y
> mapped register called SFR for MCT...so Doug submitted patch to use M=
CT
> on 32bit exynos SoCs before.
>
> I know using MCT on 64bit exynos is usefulness for Power Management a=
nd
> I need to talk to relevant guys in office again. If anything, I'll le=
t
> you know.

I will wait for your answer before digging more the patch.

Thanks
   -- Daniel

>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>> This patch set is tested on 64-bit Exynos SoC. I send only this patc=
h from
>> following patchst[1].
>> [1] https://lkml.org/lkml/2014/12/2/134
>>
>> Changes from v2:
>> - None
>> Changes from v1:
>> - Use CONFIG_ARM instead of CONFIG_ARM64
>>
>>   drivers/clocksource/Kconfig      | 1 -
>>   drivers/clocksource/exynos_mct.c | 4 ++++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconf=
ig
>> index fc01ec2..be38119 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -135,7 +135,6 @@ config CLKSRC_METAG_GENERIC
>>
>>   config CLKSRC_EXYNOS_MCT
>>   	def_bool y if ARCH_EXYNOS
>> -	depends on !ARM64
>>   	help
>>   	  Support for Multi Core Timer controller on Exynos SoCs.
>>
>> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/=
exynos_mct.c
>> index 9403061..b840ea1 100644
>> --- a/drivers/clocksource/exynos_mct.c
>> +++ b/drivers/clocksource/exynos_mct.c
>> @@ -223,6 +223,7 @@ static u64 notrace exynos4_read_sched_clock(void=
)
>>   	return exynos4_read_count_32();
>>   }
>>
>> +#if defined(CONFIG_ARM)
>>   static struct delay_timer exynos4_delay_timer;
>>
>>   static cycles_t exynos4_read_current_timer(void)
>> @@ -231,14 +232,17 @@ static cycles_t exynos4_read_current_timer(voi=
d)
>>   			 "cycles_t needs to move to 32-bit for ARM64 usage");
>>   	return exynos4_read_count_32();
>>   }
>> +#endif
>>
>>   static void __init exynos4_clocksource_init(void)
>>   {
>>   	exynos4_mct_frc_start();
>>
>> +#if defined(CONFIG_ARM)
>>   	exynos4_delay_timer.read_current_timer =3D &exynos4_read_current_=
timer;
>>   	exynos4_delay_timer.freq =3D clk_rate;
>>   	register_current_timer_delay(&exynos4_delay_timer);
>> +#endif
>>
>>   	if (clocksource_register_hz(&mct_frc, clk_rate))
>>   		panic("%s: can't register clocksource\n", mct_frc.name);


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
