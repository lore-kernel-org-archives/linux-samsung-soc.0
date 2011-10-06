From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] arm: samsung: add device tree support for gic and
 interrupt combiner
Date: Fri, 07 Oct 2011 02:41:41 +0530
Message-ID: <1317935503-11756-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32532 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758655Ab1JFVLN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Oct 2011 17:11:13 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSN00EALXINIH60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 06:11:11 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSN0021GXIH8X80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 06:11:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

This patchset adds device tree support for GIC and Interrupt Combiner
controllers in the Exynos4 SoC.

Patch 1 moves the statically mapped timer irqs 11 to 15 to the end of the
statically mapped linux irq space for all s5p platforms. This was required
because, device tree support for gic is based on Rob Herring's "GIC OF
bindings" patchset and that patchset requires hardware irq number to be
equal to GIC interrupt ID. Since GIC interrupt ID starts from zero, the
timer irqs 11 to 15 is moved to the end of the irq space and hardware irqs
are statically mapped to start from zero. I am not sure if statically
mapping hardware irqs starting from zero would be a problem.

Patch 2 adds device tree support for GIC and Interrupt Combiner controllers
on Exynos4. For GIC controller, this patch is based on Rob Herring's,
"[PATCH 0/3] GIC OF bindings" patchset. The concept of irq domain for
interrupt combiner controller is based on Grant's 'simple' irq converter

Thomas Abraham (2):
  arm: samsung: move timer irq numbers to end of linux irq space
  arm: exynos4: add support for dt irq specifier to linux virq conversion

 arch/arm/mach-exynos4/cpu.c                      |   20 +++++++++-
 arch/arm/mach-exynos4/include/mach/entry-macro.S |    1 -
 arch/arm/mach-exynos4/include/mach/irqs.h        |    3 +-
 arch/arm/mach-exynos4/irq-combiner.c             |   44 ++++++++++++++++++++++
 arch/arm/mach-s5p64x0/include/mach/irqs.h        |    4 +-
 arch/arm/mach-s5pc100/include/mach/irqs.h        |    3 +-
 arch/arm/mach-s5pv210/include/mach/irqs.h        |    3 +-
 arch/arm/plat-samsung/include/plat/irqs.h        |    7 ++-
 8 files changed, 72 insertions(+), 13 deletions(-)
