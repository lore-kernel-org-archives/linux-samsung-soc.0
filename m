From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/4] arm: exynos4: add irq domain and device tree support for
 wakeup interrupts
Date: Wed, 07 Dec 2011 19:29:48 +0530
Message-ID: <1323266392-28330-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34939 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756144Ab1LGN6a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 08:58:30 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVU005L96TGQW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 22:58:28 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVU00BJT6TAY680@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 22:58:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

Samsung Exynos4 includes 32 external wakeup interrupt sources. This patchset
adds irq domain and device tree support for these interrupts.

This patchset is based on the following tree.
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git  for-next

This patchset depends on the following patch from Jamie Iles.
irqdomain: export irq_domain._simple_op.s for !CONFIG_OF

Thomas Abraham (4):
  arm: exynos4: simplify EINT number to GIC irq number translation
  arm: exynos4: add irq_domain support for wakeup interrupts
  arm: exynos4: remove arch_initcall for wakeup interrupt source initialization
  arm: exynos4: add device tree support for external wakeup interrupt controller

 .../bindings/arm/samsung/wakeup-eint.txt           |   14 +++
 arch/arm/mach-exynos/cpu.c                         |    4 +
 arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
 arch/arm/mach-exynos/irq-eint.c                    |  101 +++++++++++---------
 arch/arm/plat-samsung/include/plat/exynos4.h       |    1 +
 5 files changed, 75 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
