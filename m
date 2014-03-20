From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 0/4] Introduce new Kconfig for Samsung common clock
Date: Thu, 20 Mar 2014 13:55:21 +0900
Message-ID: <1395291325-4043-1-git-send-email-pankaj.dubey@samsung.com>
References: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56433 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbaCTEiu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 00:38:50 -0400
In-reply-to: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>

Introduce a new Kconfig file for Samsung common clock infrastructure
related config options. As current Samsung common clock gets compiled
based on PLAT_SAMSUNG, but moving ahead with ARM64 we can not have any
more such config options, so this patch introduce new COMMON_CLK_SAMSUNG
invisible option. This option also select COMMON_CLK so ARCH Kconfig just
need to select COMMON_CLK_SAMSUNG in case they want to use Samsung common
clock.

This series is based on Kukjin's for-next branch.

V3: 
 1) Re-organized patches for preventing bisect issues.
 2) Rebase on top of latest Kukjin's for-next branch.
 3) Compile tested exynos_defconfig, s3c6400_defconfig and s3c2410_defconfig
    after each commit.

V2:
 1) Adding new Kconfig file for Samsung common clock.
 2) Make COMMON_CLK_SAMSUNG option invisible. (as suggested by Tomasz Figa)
 3) Let COMMON_CLK_SAMSUNG select COMMON_CLK. (as suggested by Tomasz Figa)
 4) Move S3C24XX clock config option in new Kconfig file.

Pankaj Dubey (4):
  clk: samsung: add new Kconfig for Samsung common clock option
  ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
  ARM: S3C24XX: move S3C24XX clock Kconfig options to Samsung clock
    Kconfig file
  drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support

 arch/arm/Kconfig              |    4 ++--
 arch/arm/mach-s3c24xx/Kconfig |   14 --------------
 drivers/clk/Kconfig           |    2 ++
 drivers/clk/Makefile          |    2 +-
 drivers/clk/samsung/Kconfig   |   12 ++++++++++++
 5 files changed, 17 insertions(+), 17 deletions(-)
 create mode 100644 drivers/clk/samsung/Kconfig

-- 
1.7.10.4
