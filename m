From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] Add basic device tree support for Samsung's Exynos4210
 platform
Date: Sun, 17 Jul 2011 10:28:18 +0530
Message-ID: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28201 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab1GQEqe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 00:46:34 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOG00DU9NXL5P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:33 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOG00J0INXHII@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org

This patch series adds a basic device tree based boot for Samsung's Exynos4
platforms and specifically for smdkv310 board. Device tree based driver
probe is added for sdhci and watchdog drivers.

This patch series is based on
git.secretlab.ca/git/linux-2.6.git devicetree/test

and depends on the following patches which are not yet available in
the devicetree/test branch.

1. [PATCH] ARM: EXYNOS4: Fix card detection for sdhci 0 and 2
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04704.html]

2. [PATCH] ARM: EXYNOS4: Fix missing S5P_VA_AUDSS definition
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04866.html]

3. [PATCH 0/9] Add clkdev support for Samsung platforms
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04874.html]

4. Consolidate the clkdev header files
[http://patchwork.ozlabs.org/patch/97862/]

Changes since v1:
* Addressed all comments from Grant Likely
  - Moved sdhci platform data as properties in dts file
  - Add relevant comments in the machine file.

Thomas Abraham (2):
  arm: dts: Add nodes in smdkv310 device tree source file
  arm: exynos4: Add a new Exynos4 device tree enabled machine

 Documentation/devicetree/bindings/arm/samsung.txt |   11 +-
 arch/arm/boot/dts/exynos4-smdkv310.dts            |   61 +++++++++++-
 arch/arm/mach-exynos4/Kconfig                     |   10 ++
 arch/arm/mach-exynos4/Makefile                    |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c           |  112 +++++++++++++++++++++
 5 files changed, 187 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c
