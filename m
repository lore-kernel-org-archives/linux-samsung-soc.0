From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: exynos: Topic dts arm64 for v4.10
Date: Fri, 18 Nov 2016 14:44:34 +0200
Message-ID: <1479473075-9787-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752520AbcKRMow (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:44:52 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi,

Topic branch with a GIC interrupt fix and cleanup. No conflicts expected.
No dependencies.

Best regards,
Krzysztof


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-gic-flags-4.10

for you to fetch changes up to 86bb573d0b2a8e876a12d1348bd0b6e377c1043e:

  arm64: dts: exynos: Use human-friendly symbols for interrupt properties in exynos7 (2016-11-03 22:40:39 +0200)

----------------------------------------------------------------
Topic branch with DT arm64 changes for v4.10.

Fix invalid GIC interrupt flags - type IRQ_TYPE_NONE is not allowed for GIC
interrupts.  Although this was working but with error messages like:
        genirq: Setting trigger mode 0 for irq 16 failed

Use level high interrupt instead of type none.  The choice of level high was
rather an arbitrary decision hoping it will work on each platform.  Tests shown
no issues so far.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: exynos: Fix invalid GIC interrupt flags in exynos7
      arm64: dts: exynos: Use human-friendly symbols for interrupt properties in exynos7

 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 20 +++++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 69 +++++++++++++------------
 2 files changed, 51 insertions(+), 38 deletions(-)
