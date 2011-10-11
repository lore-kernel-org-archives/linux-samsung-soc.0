From: Changhwan Youn <chaos.youn@samsung.com>
Subject: RE: [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
Date: Tue, 11 Oct 2011 21:22:58 +0900
Message-ID: <00b901cc8810$8353e730$89fbb590$%youn@samsung.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
 <1308555258-4322-6-git-send-email-chaos.youn@samsung.com>
 <4E8C61C4.9090709@arm.com> <00ec01cc83f1$81f84430$85e8cc90$%kim@samsung.com>
 <4E8D645D.4020601@arm.com> <4E8ECA1B.5010005@arm.com>
 <20111007151646.GA2398@mudshark.cambridge.arm.com> <4E92ECD1.2010303@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40947 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1JKMXB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 08:23:01 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSW00001IEBR000@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 21:22:59 +0900 (KST)
Received: from DOCHAOSYOUN01 ([12.23.121.151])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSW008PSIEAVF80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 21:22:59 +0900 (KST)
In-reply-to: <4E92ECD1.2010303@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <marc.zyngier@arm.com>, 'Will Deacon' <will.deacon@arm.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

Dear Marc and Will,

On Monday, October 10, 2011 10:02 PM, Marc Zyngier wrote:
> 
> On 07/10/11 16:16, Will Deacon wrote:
> > Hi Marc,
> >
> > On Fri, Oct 07, 2011 at 10:44:59AM +0100, Marc Zyngier wrote:
> >> So to make my suggestion completely clear, here's a patch I'm now
> >> carrying in my tree. It's only been test compiled on EXYNOS4, but works
> >> nicely on my 11MP. It turns both dist_base and cpu_base into per-cpu
> >> variables, removes these callbacks, removes your private copy of
> >> gic_cpu_init, and makes struct gic_chip_data private again.
> >>
> >> What do you think?
> >
> > This looks like the right sort of idea, although I'm deeply suspicious about
> > per-cpu base addresses for the GIC distributor. It would be nice if the
> > Samsung guys can elaborate on what's going on here. Few comments inline.
> 
> Yeah, this seem odd, specially as what's currently in mainline doesn't
> try to play tricks with the distributor. It looks like having a per-core
> distributor address is required for PPI usage on these SoCs, but the
> commit message is uninformative at best:
> 
> https://github.com/sfrothwell/linux-
> next/commit/637c2afa57ec9cd0ddc8879ea0cda4d8835ba71d#arch/arm/mach-exynos4/cpu.c
> 
> Again, comments from Samsung people would be much appreciated.

Your guess is right.
Exynos4 cannot support register banking, which means every CPU has
its own CPU base and Distributor base address.
Without the workaround I implemented, every CPU accesses the base address
for CPU0 and thus the interrupts for other CPUs cannot be handled properly.
 
> >> Subject: [PATCH] ARM: gic: allow GIC to support non-banked setups
> >>
> >> The GIC support code is heavily using the fact that hardware
> >> implementations are exposing banked registers. Unfortunately, it
> >> looks like at least one GIC implementation (EXYNOS4) offers both
> >> the distributor and the CPU interfaces at different addresses,
> >> depending on the CPU.
> >>
> >> This problem is solved by turning the distributor and CPU interface
> >> addresses into per-cpu variables. The EXYNOS4 code is updated not
> >> to mess with the GIC internals while handling interrupts, and
> >> struct gic_chip_data is back to being private.
> >>
> >> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> >> ---
> >>  arch/arm/common/gic.c               |   76 +++++++++++++++++++++++++++--------
> >>  arch/arm/include/asm/hardware/gic.h |   17 +------
> >>  arch/arm/mach-exynos4/cpu.c         |   14 ------
> >>  arch/arm/mach-exynos4/platsmp.c     |   28 ++-----------
> >>  4 files changed, 66 insertions(+), 69 deletions(-)
> >>
> >> diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
> >> index b574931..c7521dd 100644
> >> --- a/arch/arm/common/gic.c
> >> +++ b/arch/arm/common/gic.c
> >> @@ -37,6 +37,20 @@
> >>  #include <asm/mach/irq.h>
> >>  #include <asm/hardware/gic.h>
> >>
> >> +struct gic_chip_data {
> >> +	unsigned int irq_offset;
> >> +	void __percpu __iomem **dist_base;
> >> +	void __percpu __iomem **cpu_base;
> >> +#ifdef CONFIG_CPU_PM
> >> +	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
> >> +	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
> >> +	u32 saved_spi_target[DIV_ROUND_UP(1020, 4)];
> >> +	u32 __percpu *saved_ppi_enable;
> >> +	u32 __percpu *saved_ppi_conf;
> >> +#endif
> >> +	unsigned int gic_irqs;
> >> +};
> >
> > I think you can use DECLARE_PER_CPU(void __iomem *dist_base) etc. instead.
> 
> Unfortunately, you can't. That would be nice though... ;-)
> 
> >> +static void __cpuinit exynos4_secondary_init(unsigned int cpu)
> >>  {
> >>  	void __iomem *dist_base = S5P_VA_GIC_DIST +
> >> -				(gic_bank_offset * smp_processor_id());
> >> +				(gic_bank_offset * cpu_logical_map(cpu));
> >
> > Again, I'm deeply suspicious of this code :) Is there not a common memory
> > alias for the distributor across all of the CPUs?
> 
> Kukjin, could you please comment on the presence of a common memory
> region for the distributor? This seem quite odd...

Some registers in Distributor are banked for PPI and SGI support (banked interrupts).
The register for pending and enable status of these interrupts are 
banked.

Marc, I think the approach in your patch is much better than mine if it doesn't hurt
the performance of other platforms which use the common gic code.
I'll re-work the exynos4 interrupt code based on your patch though
I'm not sure that it's possible to be merged in merge window.

Kukjin, how do you think about this?

> Thanks,
> 
> 	M.
> --
> Jazz is not dead. It just smells funny...
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
