From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/4] ARM: EXYNOS: Fix definitions of S5P_ARM_CORE_* registers
Date: Sat, 19 Apr 2014 16:47:33 +0900
Message-ID: <CAGTfZH1Lg=2thqGSgyTehzM_UO1meyOcdXcn-b0AJnrm9dgwXQ@mail.gmail.com>
References: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
	<1397832181-5153-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:43470 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267AbaDSHre (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Apr 2014 03:47:34 -0400
In-Reply-To: <1397832181-5153-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Tomasz,

On Fri, Apr 18, 2014 at 11:42 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> On SoCs with more than 2 cores there are more than 2 S5P_ARM_CORE_*
> registers that can be addressed with fixed stride of 0x80. This patch
> renames the definitions of S5P_ARM_CORE1_* registers to be S5P_ARM_CORE_*
> and make them take physical core ID as argument to calculate register
> address.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/hotplug.c  | 2 +-
>  arch/arm/mach-exynos/platsmp.c  | 6 +++---
>  arch/arm/mach-exynos/regs-pmu.h | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
> index 5eead53..7e0f31a 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c
> @@ -96,7 +96,7 @@ static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>
>                 /* make cpu1 to be turned off at next WFI command */
>                 if (cpu == 1)
> -                       __raw_writel(0, S5P_ARM_CORE1_CONFIGURATION);
> +                       __raw_writel(0, S5P_ARM_CORE_CONFIGURATION(1));

Exynos4412 has quad cores. If turn off third/fourth core, this patch
could not turn off third/fourth cores.

Why didn't you use cpu number for argument of
S5P_ARM_CORE_CONFIGURATION() as following?
- __raw_writel(0, S5P_ARM_CORE_CONFIGURATION(cpu));

>
>                 /*
>                  * here's the WFI
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 03e5e9f..7b7de4b 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -107,14 +107,14 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>          */
>         write_pen_release(phys_cpu);
>
> -       if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
> +       if (!(__raw_readl(S5P_ARM_CORE_STATUS(1)) & S5P_CORE_LOCAL_PWR_EN)) {
>                 __raw_writel(S5P_CORE_LOCAL_PWR_EN,
> -                            S5P_ARM_CORE1_CONFIGURATION);
> +                            S5P_ARM_CORE_CONFIGURATION(1));

ditto.

>
>                 timeout = 10;
>
>                 /* wait max 10 ms until cpu1 is on */
> -               while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> +               while ((__raw_readl(S5P_ARM_CORE_STATUS(1))

ditto.

Best regards,
Chanwoo Choi
