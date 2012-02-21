From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 0/2] ARM: Exynos: Add irq_domain and device tree support for
 combiner
Date: Tue, 21 Feb 2012 10:03:24 +0530
Message-ID: <1329798806-32482-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34522 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752524Ab2BUE1E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Feb 2012 23:27:04 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00GP76YOHW50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 13:27:02 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ009HB70R0J20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 13:27:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Changes since v3:
- In dt case, the use of fixed gic linux irq number to map the combiner
  interrupt output is removed. This is replaced with the interrupt number
  obtained from the gic irq domain. (Thanks to Rob Herring and Grant
  Likely for this suggestion).
- Split the patch into two parts - irq_domain and device tree support
  addition.

Changes since v2:
- Rebased to Grant's irqdomain/next branch.

Changes since v1:
- Includes all changes suggested by Rob Herring.
- Tested with SPARSE_IRQ enabled.

This patchset adds irq_domain and device tree support for the Exynos Interrupt
Combiner controller.

The first patch adds a common irq domain for the interrupts managed by the
interrupt combiners. All the instances of irq combiner reference the common irq
domain for translating hardware interrupts to linux irq number.

The second patch adds a interrupt specifier translator to support device tree
based instantiation. It can translate interrupt specifiers for device nodes
which use combiner as their interrupt parent.

This patchset is based on
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git [for-next]

with all irq_domain (v5) patches merged from
http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]

Thomas Abraham (2):
  ARM: Exynos: Add irq_domain support for interrupt combiner
  ARM: Exynos: Add device tree support for interrupt combiner

 .../bindings/arm/samsung/interrupt-combiner.txt    |   48 +++++++++
 arch/arm/mach-exynos/common.c                      |  112 ++++++++++++++++----
 2 files changed, 140 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/interrupt-combiner.txt
