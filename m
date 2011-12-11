From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/4] ARM: Exynos4: Add irq domain and device tree support
 for wakeup interrupts
Date: Sun, 11 Dec 2011 12:21:37 +0530
Message-ID: <1323586301-24537-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57776 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750798Ab1LKGuO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 01:50:14 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW100EEG1NOAF00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 11 Dec 2011 15:50:12 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW100EBB1NIOE80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 11 Dec 2011 15:50:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

Changes since v1: (only patch 4/4 has changes)
- Fixes based on Rob's comments:
  a. Fixed the function prototype of exynos4_init_irq_eint(void)
  b. Included interrupt-parent as an optional property for wakeup interrupt
      controller node.

Samsung Exynos4 includes 32 external wakeup interrupt sources. This patchset
adds irq domain and device tree support for these interrupts.

This patchset is based on the following tree.
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git  for-next

This patchset should be applied after applying the following patch.
[PATCH] ARM: Exynos: Add irq domain and device tree support for interrupt combiner

This patchset depends on the following patch from Jamie Iles.
[PATCH] irqdomain: export irq_domain._simple_op.s for !CONFIG_OF

Thomas Abraham (4):
  arm: exynos4: simplify EINT number to linux irq number translation
  arm: exynos4: add irq_domain support for wakeup interrupts
  arm: exynos4: remove arch_initcall for wakeup interrupt source initialization
  arm: exynos4: add device tree support for external wakeup interrupt controller

 .../bindings/arm/samsung/wakeup-eint.txt           |   26 +++++
 arch/arm/mach-exynos/cpu.c                         |    6 +-
 arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
 arch/arm/mach-exynos/irq-eint.c                    |   98 ++++++++++----------
 arch/arm/plat-samsung/include/plat/exynos4.h       |    4 +
 5 files changed, 86 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
