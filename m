From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] ARM: Samsung: Move timer irq numbers to end of linux
 irq space
Date: Wed, 12 Oct 2011 21:59:00 +0530
Message-ID: <CAJuYYwR3ncPygrYj-x4a5+axxp_zVFGmuWtmMDkwR9aVTGuL-Q@mail.gmail.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
	<1318234289-22041-2-git-send-email-thomas.abraham@linaro.org>
	<4E95BC01.8090805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:37013 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab1JLQ3B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 12:29:01 -0400
Received: by gyb13 with SMTP id 13so841243gyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 09:29:00 -0700 (PDT)
In-Reply-To: <4E95BC01.8090805@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 12 October 2011 21:40, Rob Herring <robherring2@gmail.com> wrote:
> On 10/10/2011 03:11 AM, Thomas Abraham wrote:
>> All of Samsung's s5p platforms have timer irqs statically mapped fro=
m linux
>> irq numbers 11 to 15. These timer irqs are moved to end of the stati=
cally
>> mapped linux irq space and the hardware irqs, which were statically =
mapped
>> starting from 32 is moved to start from 0. The NR_IRQS macro is cons=
olidated
>> for all the s5p platforms in this process.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos4/include/mach/entry-macro.S | =A0 =A01 -
>> =A0arch/arm/mach-exynos4/include/mach/irqs.h =A0 =A0 =A0 =A0| =A0 =A0=
3 +--
>> =A0arch/arm/mach-s5p64x0/include/mach/irqs.h =A0 =A0 =A0 =A0| =A0 =A0=
4 +---
>> =A0arch/arm/mach-s5pc100/include/mach/irqs.h =A0 =A0 =A0 =A0| =A0 =A0=
3 +--
>> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0 =A0| =A0 =A0=
3 +--
>> =A0arch/arm/plat-samsung/include/plat/irqs.h =A0 =A0 =A0 =A0| =A0 =A0=
7 +++++--
>> =A06 files changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/include/mach/entry-macro.S b/arch=
/arm/mach-exynos4/include/mach/entry-macro.S
>> index 4c9adbd..5c4fbcc 100644
>> --- a/arch/arm/mach-exynos4/include/mach/entry-macro.S
>> +++ b/arch/arm/mach-exynos4/include/mach/entry-macro.S
>> @@ -72,7 +72,6 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpcc =A0 \irqnr, \irqnr
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpne =A0 \irqnr, \tmp
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpcs =A0 \irqnr, \irqnr
>> - =A0 =A0 =A0 =A0 =A0 =A0 addne =A0 \irqnr, \irqnr, #32
>
>
> With this change, can't you now use the common entry-macro-gic.S?


The get_irqnr_preamble macro is quite different from that in
entry-macro-gic.S file. Maybe it is possible to use the common
entry-macro-gic.S file with some rework of exynos machine code.


>
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
>>
>> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/ma=
ch-exynos4/include/mach/irqs.h
>> index dfd4b7e..43087c3 100644
>> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
>> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
>> @@ -163,7 +163,6 @@
>> =A0#define IRQ_GPIO2_NR_GROUPS =A09
>> =A0#define IRQ_GPIO_END =A0 =A0 =A0 =A0 (S5P_GPIOINT_BASE + S5P_GPIO=
INT_COUNT)
>>
>> -/* Set the default NR_IRQS */
>> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_GPI=
O_END + 64)
>> +#define IRQ_TIMER_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (IRQ_GPIO_END + =
64)
>>
>> =A0#endif /* __ASM_ARCH_IRQS_H */
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/irqs.h b/arch/arm/ma=
ch-s5p64x0/include/mach/irqs.h
>> index 53982db..bea73cc 100644
>> --- a/arch/arm/mach-s5p64x0/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5p64x0/include/mach/irqs.h
>> @@ -141,8 +141,6 @@
>>
>> =A0#define IRQ_EINT_GROUP(grp, x) =A0 =A0 =A0 (IRQ_EINT_GROUP##grp##=
_BASE + (x))
>>
>> -/* Set the default NR_IRQS */
>> -
>> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_EIN=
T_GROUP8_BASE + IRQ_EINT_GROUP8_NR + 1)
>> +#define IRQ_TIMER_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (IRQ_EINT_GROUP8=
_BASE + IRQ_EINT_GROUP8_NR + 1)
>>
>> =A0#endif /* __ASM_ARCH_IRQS_H */
>> diff --git a/arch/arm/mach-s5pc100/include/mach/irqs.h b/arch/arm/ma=
ch-s5pc100/include/mach/irqs.h
>> index d2eb475..3a9d300 100644
>> --- a/arch/arm/mach-s5pc100/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pc100/include/mach/irqs.h
>> @@ -104,8 +104,7 @@
>> =A0#define S5P_GPIOINT_BASE =A0 =A0 (IRQ_EINT(31) + 1)
>> =A0#define S5P_GPIOINT_GROUP_MAXNR =A0 =A0 =A021
>>
>> -/* Set the default NR_IRQS */
>> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_EIN=
T(31) + S5P_GPIOINT_COUNT + 1)
>> +#define IRQ_TIMER_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (IRQ_EINT(31) + =
S5P_GPIOINT_COUNT + 1)
>>
>> =A0/* Compatibility */
>> =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 IRQ_LCD0
>> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/ma=
ch-s5pv210/include/mach/irqs.h
>> index 5e0de3a..df3173a 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
>> @@ -125,8 +125,7 @@
>> =A0#define S5P_GPIOINT_BASE =A0 =A0 (IRQ_EINT(31) + 1)
>> =A0#define S5P_GPIOINT_GROUP_MAXNR =A0 =A0 =A022
>>
>> -/* Set the default NR_IRQS */
>> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_EIN=
T(31) + S5P_GPIOINT_COUNT + 1)
>> +#define IRQ_TIMER_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (IRQ_EINT(31) + =
S5P_GPIOINT_COUNT + 1)
>>
>> =A0/* Compatibility */
>> =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 IRQ_LCD0
>> diff --git a/arch/arm/plat-samsung/include/plat/irqs.h b/arch/arm/pl=
at-samsung/include/plat/irqs.h
>> index 08d1a7e..b8918b3 100644
>> --- a/arch/arm/plat-samsung/include/plat/irqs.h
>> +++ b/arch/arm/plat-samsung/include/plat/irqs.h
>> @@ -22,7 +22,7 @@
>> =A0 * mulitple of 32 to allow the common code to work
>> =A0 */
>>
>> -#define S5P_IRQ_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 (32)
>> +#define S5P_IRQ_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0)
>
> Just remove this.

Ok.

>
>>
>> =A0#define S5P_IRQ(x) =A0 =A0 =A0 =A0 =A0 ((x) + S5P_IRQ_OFFSET)
>>
>> @@ -44,13 +44,14 @@
>> =A0#define S5P_IRQ_VIC2(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VIC2_BASE=
 + (x))
>> =A0#define S5P_IRQ_VIC3(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VIC3_BASE=
 + (x))
>>
>> -#define S5P_TIMER_IRQ(x) =A0 =A0 (11 + (x))
>> +#define S5P_TIMER_IRQ(x) =A0 =A0 (IRQ_TIMER_BASE + (x))
>>
>> =A0#define IRQ_TIMER0 =A0 =A0 =A0 =A0 =A0 S5P_TIMER_IRQ(0)
>> =A0#define IRQ_TIMER1 =A0 =A0 =A0 =A0 =A0 S5P_TIMER_IRQ(1)
>> =A0#define IRQ_TIMER2 =A0 =A0 =A0 =A0 =A0 S5P_TIMER_IRQ(2)
>> =A0#define IRQ_TIMER3 =A0 =A0 =A0 =A0 =A0 S5P_TIMER_IRQ(3)
>> =A0#define IRQ_TIMER4 =A0 =A0 =A0 =A0 =A0 S5P_TIMER_IRQ(4)
>> +#define IRQ_TIMER_COUNT =A0 =A0 =A0 =A0 =A0 =A0 =A0(5)
>>
>> =A0#define IRQ_EINT(x) =A0 =A0 =A0 =A0 =A0((x) < 16 ? ((x) + S5P_EIN=
T_BASE1) \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 : ((x) - 16 + S5P_EINT_BASE2))
>> @@ -77,4 +78,6 @@
>> =A0#define S5P_IRQ_TYPE_EDGE_RISING =A0 =A0 (0x03)
>> =A0#define S5P_IRQ_TYPE_EDGE_BOTH =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x04)
>>
>> +#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_TIM=
ER_BASE + IRQ_TIMER_COUNT)
>> +
>> =A0#endif /* __PLAT_SAMSUNG_IRQS_H */
>
> Really these timer irqs should be converted to irq domains and be
> dynamically allocated in the linux irq space, but this is at least a
> step in the right direction.

Ok.

Thanks for your comments.

Regards,
Thomas.

>
> Rob
>
