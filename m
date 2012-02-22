From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 0/4] ARM: Exynos4: Add irq domain and device tree support
 for wakeup interrupts
Date: Wed, 22 Feb 2012 17:44:14 +0530
Message-ID: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29370 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab2BVMIE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 07:08:04 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZS001Z0N0P8LB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:02 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZS00GJLN166U60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

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

This patchset adds irq domain and device tree support for these interrupts.
Since there are users of fixed linux irq numbers of the external wakeup
interrupts, the legacy mapping is used for the irq domain.

This patchset is based on
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git [for-next]

with all irq_domain (v5) patches merged from
http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]

This patchset should be applied after applying the following patch.
[PATCH] ARM: Exynos: Add irq domain and device tree support for interrupt combiner

Thomas Abraham (4):
  ARM: Exynos4: Simplify EINT number to linux irq number translation
  ARM: Exynos4: Add irq_domain support for gpio wakeup interrupts
  ARM: Exynos4: Remove arch_initcall for wakeup interrupt initialization
  ARM: Exynos4: Add device tree support for gpio wakeup interrupt controller

 .../bindings/arm/samsung/wakeup-eint.txt           |   37 +++++
 arch/arm/mach-exynos/common.c                      |  148 ++++++++++++--------
 arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
 3 files changed, 131 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
