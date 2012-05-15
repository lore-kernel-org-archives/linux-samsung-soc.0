From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/20] ARM: Samsung: Add support for Exynos5250 Rev1.0
Date: Tue, 15 May 2012 17:41:21 +0900
Message-ID: <07f901cd3276$80ce5cf0$826b16d0$%kim@samsung.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43953 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210Ab2EOIlU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 04:41:20 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M420037L2SVV5B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:41:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M42007922ST8W40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:41:18 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Thomas Abraham wrote:
> >
> > This patch series adds support for Samsung's Exynos5250 Rev1.0. It
> > includes
> > fixes for device tree support, updates for rev1.0 silicon and device tree
> > discovery for combiner and wakeup interrupt controller. This patch series
> > depricates the existing support for Exynos5250 Rev0.0.
> >
> > This patchset is based and tested on top of v3.4-rc5.
> >
> > Boojin Kim (1):
> >   ARM: EXYNOS: Support DMA for EXYNOS5250 SoC
> >
> > Changhwan Youn (2):
> >   ARM: EXYNOS: Modify the GIC physical address for static io-mapping
> >   ARM: EXYNOS: Redefine IRQ_MCT_L0,1 definition
> >
> > Kisoo Yu (1):
> >   ARM: EXYNOS: Add pre-divider and fout mux clocks for bpll and mpll
> >
> > Kukjin Kim (2):
> >   ARM: EXYNOS: fix ctrlbit for exynos5_clk_pdma1
> >   ARM: EXYNOS: update irqs for EXYNOS5250 evt1
> >
> > Sangsu Park (1):
> >   ARM: EXYNOS: add GPC4 bank instance
> >
> > Thomas Abraham (13):
> >   ARM: EXYNOS: Add watchdog timer clock instance
> >   ARM: Exynos: Remove a new bus_type instance for Exynos5
> >   of/irq: fix interrupt parent lookup procedure
> >   of/irq: add retry support for interrupt controller tree initialization
> >   ARM: Exynos: Add irq_domain support for interrupt combiner
> >   ARM: Exynos: Add device tree support for interrupt combiner
> >   ARM: Exynos: Simplify the wakeup interrupt setup code
> >   ARM: Exynos: Add irq_domain support for gpio wakeup interrupts
> >   ARM: Exynos: Remove arch_initcall for wakeup interrupt initialization
> >   ARM: Exynos: Add device tree support for gpio wakeup interrupt
> > controller
> >   ARM: dts: Update device tree source files for EXYNOS5250
> >   ARM: Exynos5: Add combiner, wakeup interrupt controller and ethernet
> > nodes
> >   ARM: Exynos5: Add AUXDATA for i2c controllers
> >
> >  .../bindings/arm/samsung/interrupt-combiner.txt    |   52 +++
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   63 ++++
> >  arch/arm/boot/dts/exynos5250.dtsi                  |   99 ++++--
> >  arch/arm/mach-exynos/Kconfig                       |    7 +-
> >  arch/arm/mach-exynos/Makefile                      |    2 +-
> >  arch/arm/mach-exynos/clock-exynos5.c               |   80 +++++-
> >  arch/arm/mach-exynos/common.c                      |  338 ++++++++++++++------
> >  arch/arm/mach-exynos/dma.c                         |  129 +++++++--
> >  arch/arm/mach-exynos/include/mach/gpio.h           |    9 +-
> >  arch/arm/mach-exynos/include/mach/irqs.h           |   40 ++-
> >  arch/arm/mach-exynos/include/mach/map.h            |    4 +-
> >  arch/arm/mach-exynos/include/mach/regs-clock.h     |    2 +
> >  arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
> >  arch/arm/mach-exynos/mach-exynos5-dt.c             |    4 +
> >  arch/arm/mach-exynos/mct.c                         |   17 +-
> >  arch/arm/mach-exynos/pm.c                          |    2 +-
> >  arch/arm/plat-s5p/clock.c                          |   11 -
> >  arch/arm/plat-samsung/Kconfig                      |    2 +-
> >  arch/arm/plat-samsung/include/plat/cpu.h           |    2 +-
> >  arch/arm/plat-samsung/include/plat/dma-pl330.h     |    1 +
> >  drivers/gpio/gpio-samsung.c                        |   11 +-
> >  drivers/of/irq.c                                   |   29 ++-
> >  22 files changed, 698 insertions(+), 210 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/samsung/interrupt-combiner.txt
> >
> > --
> > 1.7.5.4
> 
> Hi,
> 
> Basically, it's ok to me on 1st~9th patches except #7 as I commented. Will apply them but need to
> update #7. And I will look at the others again. If any comments, let you know.
> 
Hi,

Looks ok to me but some patches, #10 and #11 patches need to get the ack from Grant. And the #14 to #17 and #19 patches have a
dependency on that. However now other patches which are including my re-work can be applied, so I will.

Thomas, please address comments from Olof on 18th patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
