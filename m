From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v5 0/2] Handle reboot for Exynos SoC via restart_handler
Date: Tue, 18 Nov 2014 16:17:28 +0530
Message-ID: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61820 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752632AbaKRKyl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 05:54:41 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF800G4CEAOMA70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 19:54:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch removes restart hook from machine_desc of Exynos, and moves
respective code into restart_notifiers.
Exynos5440 handles reboot via clock register so let's register a
restart_handler in Exynos5440 clock driver.
For rest Exynos SoC, reboot is handled via PMU SWRESET register so
let's register a restart_handler in PMU driver for handling this.

This patch is inspired and dependent on following patch series[1] from
Geunter Roeck.

[1]: kernel: Add support for kernel restart handler call chain
https://lkml.org/lkml/2014/8/19/652

I have tested reboot functionality on Exynos3250 based board, on
kgene/for-next as well as linux-next's next-20141114 tag.

Patch v3 and related discussion can be found here
http://www.spinics.net/lists/linux-samsung-soc/msg37600.html

Changes since v4:
  - Addressed review comments from Geunter Roeck.
  - Added Geunter Roeck's Acked-by tag.

Changes since v3:
  - As v2 is causing conflict after recent changes in kgene/for-next,
    rebased on top of kgene/for-next dated 2014-11-13.
  - Removed dependency patch list from cover-letter as all dependencies 
    are merged into kgene/for-next.

Changes since v2:
  - Used register_restart_handler instead of register_reboot_notifier.
  - Updated notifier names and commit message accordingly.

Changes since v1:
  - Addressed review comments from Tomasz Figa. Removed usage of 
    local variables where ever unnecessary.
  - Make reg_base as global in clk-exynos5440.c file, to avoid 
    iomapping it again in reboot_notifier handler.


Pankaj Dubey (2):
  clk: samsung: exynos5440: move restart code into clock driver
  ARM: EXYNOS: PMU: move restart code into pmu driver

 arch/arm/mach-exynos/common.h        |    1 -
 arch/arm/mach-exynos/exynos.c        |   23 -----------------------
 arch/arm/mach-exynos/pmu.c           |   23 +++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5440.c |   29 ++++++++++++++++++++++++++++-
 4 files changed, 51 insertions(+), 25 deletions(-)

-- 
1.7.9.5
