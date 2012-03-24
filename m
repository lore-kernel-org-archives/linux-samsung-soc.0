From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 0/4] ARM: Exynos4: Add irq domain and device tree support
 for wakeup interrupts
Date: Sat, 24 Mar 2012 15:11:11 +0530
Message-ID: <1332582075-16204-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55861 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753143Ab2CXJge (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Mar 2012 05:36:34 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1D00MA7UOX92F0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Mar 2012 18:36:33 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1D00D9XUORGL60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Mar 2012 18:36:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

Changes since v3:
- Rebased the patches to the latest kgene/for-next branch which now includes
  Exynos5 support as well. In this process, there are some significant changes,
  when compared to v3 version of this patchset, related to device tree support
  in patch 4/4 and code simplification in patch 1/4. Since v3 of this series
  was acked by Rob Herring, I have added the his Ack for patches 2/4 and
  3/4 but not in patches 1/4 and 4/4 (due to the new set of changes).

- Patch 4/4 includes modifications which are required to support Exynos5
  wakeup interrupt controller that has two interrupt parents (gic and
  interrupt combiner).

Changes since v2:
- Reworked irq domain support based on v5 of the irq_domain generalization
  patches.

Changes since v1: (only patch 4/4 has changes)
- Fixes based on Rob's comments:
  a. Fixed the function prototype of exynos4_init_irq_eint(void)
  b. Included interrupt-parent as an optional property for wakeup interrupt
      controller node.

Samsung Exynos4 includes 32 external wakeup interrupt sources. The first 16
of these interrupts are connected to GIC SPI[31:16]. The last 16 of these
interrupts are grouped together into one interrupt and connected to GIC
SPI[32].

Samsung Exynos5 also includes 32 external wakeup interrupt sources. The first
16 of these interrupts are connected to interrupt combiner controller. The
last 16 of these interrupts are grouped together into one interrupt and
connected to GIC SPI[32].

This patchset adds irq domain and device tree support for these interrupts.
Since there are users of fixed linux irq numbers of the external wakeup
interrupts, the legacy mapping is used for the irq domain.

This patchset is based on
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git [for-next]

with all patches merged from
http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]

This patchset should be applied after applying the following patch.
[PATCH v5] ARM: Exynos: Add irq domain and device tree support for interrupt combiner

Thomas Abraham (4):
  ARM: Exynos: Simplify the wakeup interrupt setup code
  ARM: Exynos: Add irq_domain support for gpio wakeup interrupts
  ARM: Exynos: Remove arch_initcall for wakeup interrupt initialization
  ARM: Exynos: Add device tree support for gpio wakeup interrupt controller

 .../bindings/arm/samsung/wakeup-eint.txt           |  152 ++++++++++++++++++++
 arch/arm/mach-exynos/common.c                      |  138 ++++++++++++------
 arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
 3 files changed, 247 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
