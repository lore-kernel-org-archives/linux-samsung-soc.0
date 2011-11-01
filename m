From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: ARM: Exynos4: Enable device tree support for GIC controller
Date: Tue,  1 Nov 2011 06:31:26 +0530
Message-ID: <1320109289-2730-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:51577 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933536Ab1KABBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Oct 2011 21:01:51 -0400
Received: by gyb13 with SMTP id 13so6484701gyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2011 18:01:50 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Changes since v1:
- Dropped device tree support for interrupt combiner controller from this patchset.
  Some rework in the interrupt combiner controller code is required to address
  the irq domain related comments from Grant Likely and hence those changes will
  be in another patchset.
- As suggested by Grant Likely, linux virq number 0 is left unused.

This patchset adds device tree support for GIC controller in Exynos4 SoC.

Patch 1 moves the statically mapped timer irqs 11 to 15 to the end of the
statically mapped linux irq space for Exynos4 platforms.

For Exynos4 platforms, the five hardware timer irqs are connected to GIC
at some hardware irq number (in exynos it is GIC_ID 69 to 73 for five timers).
When any of these hardware interrupt occurs, its interrupt handler calls
generic_handle_irq() with linux irq number 11/12/13/14/15 for timer 0/1/2/3/4
as the parameter. The code that needs to be notified about the timer interrupts
would have already registered its handler for either of the interrupts 11 to 15.

Instead of using linux irq number 11 to 15 to which consumers of timer interrupt
attach their handler, this interrupt range is moved to the end of linux irq
space used. So there will be no interrupts statically mapped between 0 to 31.

The GIC hardware interrupts, which were previously statically mapped to
start from linux irq 32 are now moved to start from linux irq 0. In case of
exynos, GIC_ID[0] (which is SGI[0]) which was previously at linux irq 32, will
not be at linux irq 0. This was required to use Rob Herring's GIC OF bindings
patches for Exynos4.

Patch 2 adds a interceptor for all ioremap calls targeted towards any of the
statically remapped memory region. This was required because the GIC OF
binding's patchset ioremaps the GIC memory-mapped regions in the gic_of_init()
function. Without this patch, there would be two separate remap for GIC
controller, one statically remapped and the other dynamically remapped by the
gic_of_init() function. The patch will eventually be superseded by Nicolas
Pitre's vmalloc patch series.

Patch 3 adds device tree support for GIC controllers on Exynos4. For GIC
controller, this patch is based on Rob Herring's,
"[PATCH 0/3] GIC OF bindings" patchset.

This patchset is based on the following tree:
git://git.linaro.org/git/people/arnd/arm-soc.git   branch: for-next

Thomas Abraham (3):
  ARM: Exynos4: Move timer irq numbers to end of linux irq space
  ARM: Exynos4: Add ioremap interceptor for statically remapped regions
  ARM: Exynos4: Enable conversion of GIC dt irq specifier to linux virq

 arch/arm/mach-exynos4/cpu.c                      |   33 +++++++++++++++++++++-
 arch/arm/mach-exynos4/include/mach/entry-macro.S |    1 -
 arch/arm/mach-exynos4/include/mach/io.h          |    5 +++
 arch/arm/mach-exynos4/include/mach/irqs.h        |    8 +++--
 arch/arm/mach-s5p64x0/include/mach/irqs.h        |    2 +
 arch/arm/mach-s5pc100/include/mach/irqs.h        |    2 +
 arch/arm/mach-s5pv210/include/mach/irqs.h        |    2 +
 arch/arm/plat-samsung/include/plat/irqs.h        |    3 +-
 8 files changed, 50 insertions(+), 6 deletions(-)
