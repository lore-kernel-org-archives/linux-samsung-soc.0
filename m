From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/5] Power Related Fixes for Exynos5250
Date: Wed, 11 Dec 2013 17:27:04 +0530
Message-ID: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38471 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab3LKL42 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 06:56:28 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXN003S655X5O40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Dec 2013 20:56:22 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dianders@chromium.org, olof@lixom.net, kgene.kim@samsung.com, jonghwa3.lee@samsung.com, yadi.brar@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

Patch 1 prevents the gating of sysreg clock on Exynos5250.
Patch 2 is a re-send of an earlier patch.
(http://www.spinics.net/lists/linux-samsung-soc/msg15485.html)
Patches 3 and 4 are fixes for MAX77686 on Exynos5250 based Snow
board (boot-up issues).
Patch 5 implements a power-off call-back for Exynos5250 that can
be re-used for Exynos5420.

The patches have been tested on an SMDK5250 based Chromebook.

Abhilash Kesavan (4):
  clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg
    clock
  ARM: EXYNOS5: Fix PMU register configuration for local power blocks
  clk: max77686: Replace is_enabled() with is_prepared call-back
  ARM: dts: Setup the interrupt parent for max77686

Olof Johansson (1):
  ARM: EXYNOS5250: Implement pm_power_off

 arch/arm/boot/dts/cros5250-common.dtsi       |   11 ++++
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/pmu.c                   |   86 ++++++++++++++++++++------
 drivers/clk/clk-max77686.c                   |    4 +-
 drivers/clk/samsung/clk-exynos5250.c         |    3 +-
 5 files changed, 86 insertions(+), 21 deletions(-)

-- 
1.7.9.5
