From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: [PATCH 0/3] ARM: S5P64X0: Add SDMMC support
Date: Fri, 04 Nov 2011 19:26:57 +0530
Message-ID: <1320415020-7439-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64937 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932253Ab1KDN7P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 09:59:15 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU50039R2UNXJ40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 22:59:14 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LU5008FW2UIU760@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 22:59:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

This patchset adds support for sdhci controller on S5P6440 and S5P6450.

Since this patchset is based on "mmc: sdhci-s3c: Rework platform data 
and add device tree support" clk_type member has been removed from
platform data.

This patchset depends on the patchs:
ARM: S5P64X0: Modified files for SPI consolidation work.
mmc: sdhci-s3c: Rework platform data and add device tree support.

Rajeshwari Shinde (3):
  ARM: S5P64X0: Add HSMMC setup for host Controller
  ARM: S5P64X0: Add lookup of sdhci-s3c clocks using generic names
  ARM: S5P64X0: Enable SDHCI support

 arch/arm/mach-s5p64x0/Kconfig              |   24 +++++++
 arch/arm/mach-s5p64x0/Makefile             |    1 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c      |   72 +++++++++++--------
 arch/arm/mach-s5p64x0/clock-s5p6450.c      |   72 +++++++++++--------
 arch/arm/mach-s5p64x0/cpu.c                |    9 +++
 arch/arm/mach-s5p64x0/mach-smdk6440.c      |   25 +++++++
 arch/arm/mach-s5p64x0/mach-smdk6450.c      |   26 +++++++-
 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c   |  104 ++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/sdhci.h |   42 +++++++++++
 9 files changed, 314 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c

-- 
1.7.4.4
