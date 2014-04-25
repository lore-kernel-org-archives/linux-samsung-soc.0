From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/4] ARM: EXYNOS: Fix core ID used by platsmp and hotplug
 code
Date: Sat, 26 Apr 2014 00:47:51 +0200
Message-ID: <535AE617.9050202@gmail.com>
References: <1397832181-5153-1-git-send-email-t.figa@samsung.com>	<1397832181-5153-3-git-send-email-t.figa@samsung.com> <CANuQgHF9up5=8+cWgC+9cm-8Bf7sGcRBcg1DyXm-pbmK=EMgmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:58030 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940AbaDYWry (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 18:47:54 -0400
In-Reply-To: <CANuQgHF9up5=8+cWgC+9cm-8Bf7sGcRBcg1DyXm-pbmK=EMgmg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Chander,

On 20.04.2014 09:23, Chander Kashyap wrote:
> Hi Tomasz,
>
>
> On 18 April 2014 20:12, Tomasz Figa <t.figa@samsung.com> wrote:
>> When CPU topology is specified in device tree, cpu_logical_map() does
>> not return core ID anymore, but rather full MPIDR value. This breaks
>> existing calculation of PMU register offsets on Exynos SoCs.
>>
>> This patch fixes the problem by adjusting the code to use only core ID
>> bits of the value returned by cpu_logical_map() to allow CPU topology to
>> be specified in device tree on Exynos SoCs.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>   arch/arm/mach-exynos/hotplug.c | 10 ++++++----
>>   arch/arm/mach-exynos/platsmp.c | 31 ++++++++++++++++++-------------
>>   2 files changed, 24 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
>> index 7e0f31a..8a5f07d 100644
>> --- a/arch/arm/mach-exynos/hotplug.c
>> +++ b/arch/arm/mach-exynos/hotplug.c
>> @@ -92,11 +92,13 @@ static inline void cpu_leave_lowpower(void)
>>
>>   static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>>   {
>> +       u32 mpidr = cpu_logical_map(cpu);
>> +       u32 core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
>> +
>>          for (;;) {
>>
>> -               /* make cpu1 to be turned off at next WFI command */
>> -               if (cpu == 1)
>> -                       __raw_writel(0, S5P_ARM_CORE_CONFIGURATION(1));
>
> I think this macro is not yet in ML code.

What do you mean? The S5P_ARM_CORE_CONFIGURATION() macro is being added 
by patch 1/4.

Best regards,
Tomasz
