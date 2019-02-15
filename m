From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: pm: fix HYP/SVC mode mismatch when MCPM is used
Date: Fri, 15 Feb 2019 11:23:28 +0100
Message-ID: <7548bc35-caef-0737-be39-5ddb8e097f67@samsung.com>
References: <CGME20190214143126eucas1p126506139ef72c1685654c8dac8957b3d@eucas1p1.samsung.com>
        <20190214143114.24356-1-m.szyprowski@samsung.com>
        <20190214165807.eq34njmunqhrdvxx@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214165807.eq34njmunqhrdvxx@shell.armlinux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


On 2019-02-14 17:58, Russell King - ARM Linux admin wrote:
> On Thu, Feb 14, 2019 at 03:31:14PM +0100, Marek Szyprowski wrote:
>> MCPM does a soft reset of the CPUs and uses common cpu_resume() routine to
>> perform low-level platform initialization. This results in a try to install
>> HYP stubs for the second time for each CPU and results in false HYP/SVC
>> mode mismatch detection. The HYP stubs are already installed at the
>> beginning of the kernel initialization on the boot CPU (head.S) or in the
>> secondary_startup() for other CPUs. To fix this issue MCPM code should use
>> a cpu_resume() routine without HYP stubs installation.
>>
>> This change fixes HYP/SVC mode mismatch on Samsung Exynos5422-based Odroid
>> XU3/XU4/HC1 boards.
>>
>> Fixes: 3721924c8154 ("ARM: 8081/1: MCPM: provide infrastructure to allow for MCPM loopback")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  arch/arm/common/mcpm_entry.c   |  2 +-
>>  arch/arm/include/asm/suspend.h |  1 +
>>  arch/arm/kernel/sleep.S        | 11 +++++++++++
>>  3 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/common/mcpm_entry.c b/arch/arm/common/mcpm_entry.c
>> index ad574d20415c..1b1b82b37ce0 100644
>> --- a/arch/arm/common/mcpm_entry.c
>> +++ b/arch/arm/common/mcpm_entry.c
>> @@ -381,7 +381,7 @@ static int __init nocache_trampoline(unsigned long _arg)
>>  	unsigned int cluster = MPIDR_AFFINITY_LEVEL(mpidr, 1);
>>  	phys_reset_t phys_reset;
>>  
>> -	mcpm_set_entry_vector(cpu, cluster, cpu_resume);
>> +	mcpm_set_entry_vector(cpu, cluster, cpu_resume_no_hyp);
>>  	setup_mm_for_reboot();
>>  
>>  	__mcpm_cpu_going_down(cpu, cluster);
>> diff --git a/arch/arm/include/asm/suspend.h b/arch/arm/include/asm/suspend.h
>> index 452bbdcbcc83..506314265c6f 100644
>> --- a/arch/arm/include/asm/suspend.h
>> +++ b/arch/arm/include/asm/suspend.h
>> @@ -10,6 +10,7 @@ struct sleep_save_sp {
>>  };
>>  
>>  extern void cpu_resume(void);
>> +extern void cpu_resume_no_hyp(void);
>>  extern void cpu_resume_arm(void);
>>  extern int cpu_suspend(unsigned long, int (*)(unsigned long));
>>  
>> diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
>> index a8257fc9cf2a..b856d183691e 100644
>> --- a/arch/arm/kernel/sleep.S
>> +++ b/arch/arm/kernel/sleep.S
>> @@ -122,6 +122,11 @@ ENDPROC(cpu_resume_after_mmu)
>>  
>>  #ifdef CONFIG_MMU
>>  	.arm
>> +#ifdef CONFIG_MCPM
>> +ENTRY(cpu_resume_no_hyp)
>> +ARM_BE8(setend be)			@ ensure we are in BE mode
>> +	b	0f
> What if the kernel is built for Thumb?  You'll be branching to thumb
> code at the '0' label - don't you need to do the same that
> cpu_resume_arm does below?

Maybe yes, but I don't get how did it work so far. Current version of
the cpu_resume() doesn't check the CPU ARM/Thumb mode. Such version is
used by MCPM, blSwitcher and various suspend/resume code from
arch/arm/mach-*. The mode check is in the cpu_resume_arm(), which is
used only by two SoC drivers in drivers/soc). Does it mean that most of
the current cpu_resume() users are wrong?

I've didn't try building Thumb kernel so far to check that.

>> +#endif
>>  ENTRY(cpu_resume_arm)
>>   THUMB(	badr	r9, 1f		)	@ Kernel is entered in ARM.
>>   THUMB(	bx	r9		)	@ If this is a Thumb-2 kernel,
>> @@ -135,6 +140,9 @@ ARM_BE8(setend be)			@ ensure we are in BE mode
>>  	bl	__hyp_stub_install_secondary
>>  #endif
>>  	safe_svcmode_maskall r1
>> +#ifdef CONFIG_MCPM
>> +0:
>> +#endif
> You don't need to conditionalise this.  I'd also use a symbol rather
> than a numeric label given that safe_svcmode_maskall is a macro that
> also uses numeric labels.

Okay.

>>  	mov	r1, #0
>>  	ALT_SMP(mrc p15, 0, r0, c0, c0, 5)
>>  	ALT_UP_B(1f)
>> @@ -163,6 +171,9 @@ ENDPROC(cpu_resume)
>>  
>>  #ifdef CONFIG_MMU
>>  ENDPROC(cpu_resume_arm)
>> +#endif
>> +#ifdef CONFIG_MCPM
>> +ENDPROC(cpu_resume_no_hyp)
>>  #endif
>>  
>>  	.align 2
>> -- 
>> 2.17.1

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
