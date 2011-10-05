From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
Date: Wed, 05 Oct 2011 14:55:16 +0100
Message-ID: <4E8C61C4.9090709@arm.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com> <1308555258-4322-6-git-send-email-chaos.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:41416 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752658Ab1JENyy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Oct 2011 09:54:54 -0400
In-Reply-To: <1308555258-4322-6-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>

Hi Changhwan,

On 20/06/11 08:34, Changhwan Youn wrote:
> For full support of power modes, this patch adds implementation
> external GIC on EXYNOS4.
> 
> External GIC of Exynos4 cannot support register banking so
> several interrupt related code for CPU1 should be different
> from that of CPU0.

I just realized that patch has made it to mainline... Unfortunately, it
seems quite broken to me:

> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> ---
>  arch/arm/mach-exynos4/cpu.c                      |   10 ++++++++
>  arch/arm/mach-exynos4/include/mach/entry-macro.S |    5 ++++
>  arch/arm/mach-exynos4/include/mach/map.h         |    1 +
>  arch/arm/mach-exynos4/platsmp.c                  |   27 +++++++++++++++++++++-
>  4 files changed, 42 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index fa33294..40a866c 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -16,6 +16,7 @@
>  
>  #include <asm/proc-fns.h>
>  #include <asm/hardware/cache-l2x0.h>
> +#include <asm/hardware/gic.h>
>  
>  #include <plat/cpu.h>
>  #include <plat/clock.h>
> @@ -159,11 +160,20 @@ void __init exynos4_init_clocks(int xtal)
>  	exynos4_setup_clocks();
>  }
>  
> +static void exynos4_gic_irq_eoi(struct irq_data *d)
> +{
> +	struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
> +
> +	gic_data->cpu_base = S5P_VA_GIC_CPU +
> +			    (EXYNOS4_GIC_BANK_OFFSET * smp_processor_id());

Here, you're overwriting a field that is shared among *all* the
interrupts in the system.  What if an interrupt comes up on another CPU?
If you look at the implementation of gic_eoi_irq(), you'll definitely
see the race.

> +}
> +
>  void __init exynos4_init_irq(void)
>  {
>  	int irq;
>  
>  	gic_init(0, IRQ_LOCALTIMER, S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
> +	gic_arch_extn.irq_eoi = exynos4_gic_irq_eoi;

And here you're abusing the GIC extension feature.

I've also had a look at -next, and this has been extended further to
support 4412. The problem with that is without banking, you're painfully
working around the GIC driver. At that stage, I wonder if you wouldn't
be better off with a separate driver instead of abusing the existing one...

	M.
-- 
Jazz is not dead. It just smells funny...
