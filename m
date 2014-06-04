From: Santosh Shukla <santosh.shukla@linaro.org>
Subject: Re: [PATCH] ARM: Exynos : Fix build error with thumb2
Date: Wed, 4 Jun 2014 13:37:04 +0530
Message-ID: <CA+iXiiO8ED9rdyxXh9ooDhb9OcBRH52acbqA7cgGX9kvgYaCXg@mail.gmail.com>
References: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>
	<20140602101023.GB3855@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:44081 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339AbaFDIHI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 04:07:08 -0400
Received: by mail-wi0-f175.google.com with SMTP id f8so7853052wiw.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2014 01:07:06 -0700 (PDT)
In-Reply-To: <20140602101023.GB3855@e103592.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Martin <Dave.Martin@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux@arm.linux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "t.figa" <t.figa@samsung.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On 2 June 2014 15:40, Dave Martin <Dave.Martin@arm.com> wrote:
> On Mon, May 26, 2014 at 09:23:45PM +0530, Santosh Shukla wrote:
>> From: santosh shukla <santosh.shukla@linaro.org>
>>
>> Add non-global symbol .LLl2x0_regs_phys to avoid build break in thumb2 mode.
>>
>> IIUC, arm assembler fail to load value of "global" variable
>> l2xo_regs_phys for thum2 mode and wrapping it in non-global symbol like
>> .Ll2x0_regs_phys solves the build break issue.
>>
>> arch/arm/mach-exynos/sleep.S: Assembler messages:
>> arch/arm/mach-exynos/sleep.S:57: Error: invalid immediate for address
>> calculation (value = 0x00000004)
>>
>> fix inspired from [1]
>>
>> [1] https://lkml.org/lkml/2010/3/31/235
>>
>> Signed-off-by: santosh shukla <santosh.shukla@linaro.org>
>
> Reviewed-by: Dave Martin <Dave.Martin@arm.com>
>

Thanks.

Hi Kukjin, if this patch ok with you then can you pick it up.

> The binutils folks insist that this is not a bug in gas.  (I disagreed, but
> it's a grey area.)  This is the established pattern for working round this
> issue -- looks fine to me.
>
> Cheers
> ---Dave
>
>
>> ---
>>  arch/arm/mach-exynos/sleep.S |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/sleep.S b/arch/arm/mach-exynos/sleep.S
>> index a2613e9..dc8c6b6 100644
>> --- a/arch/arm/mach-exynos/sleep.S
>> +++ b/arch/arm/mach-exynos/sleep.S
>> @@ -54,7 +54,7 @@ ENTRY(exynos_cpu_resume)
>>       ldr     r1, =CPU_CORTEX_A9
>>       cmp     r0, r1
>>       bne     skip_l2_resume
>> -     adr     r0, l2x0_regs_phys
>> +     adr     r0, .Ll2x0_regs_phys
>>       ldr     r0, [r0]
>>       cmp     r0, #0
>>       beq     skip_l2_resume
>> @@ -79,6 +79,8 @@ skip_l2_resume:
>>       b       cpu_resume
>>  ENDPROC(exynos_cpu_resume)
>>  #ifdef CONFIG_CACHE_L2X0
>> +
>> +.Ll2x0_regs_phys:
>>       .globl l2x0_regs_phys
>>  l2x0_regs_phys:
>>       .long   0
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> linaro-kernel mailing list
>> linaro-kernel@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-kernel
