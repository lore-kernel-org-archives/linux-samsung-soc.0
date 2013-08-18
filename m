From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Samsung cleanup for v3.12
Date: Mon, 19 Aug 2013 07:34:57 +0900
Message-ID: <160001ce9c63$2ab54060$801fc120$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47590 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755140Ab3HRWe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 18:34:58 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRR00E8Q0299Q20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Aug 2013 07:34:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org

The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:

  Linux 3.11-rc1 (2013-07-14 15:18:27 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-cleanup-1

for you to fetch changes up to 8c3736e20ee387acefffdfcac560ea23ee6fd4d8:

  ARM: SAMSUNG: Remove unnecessary exynos4_default_sdhci*() (2013-08-19
05:23:32 +0900)

----------------------------------------------------------------
samsung cleanup for v3.12
- cleanup non-dt stuff in exynos
- remove 0x from exynos dt files
- remove unused codes

----------------------------------------------------------------
Jingoo Han (1):
      ARM: SAMSUNG: Remove unnecessary exynos4_default_sdhci*()

Kukjin Kim (1):
      irqchip: exynos: cleanup non-DT stuff in exynos-combiner

Lee Jones (5):
      ARM: dts: Remove '0x's from Exynos4210 DTSI file
      ARM: dts: Remove '0x's from Exynos4x12 DTSI file
      ARM: dts: Remove '0x's from Exynos5250 DTS file
      ARM: dts: Remove '0x's from Exynos5420 DTS file
      ARM: dts: Remove '0x's from Exynos5440 DTS file

Sachin Kamat (1):
      ARM: EXYNOS: Cleanup common.h file

 arch/arm/boot/dts/exynos4210.dtsi          |    2 +-
 arch/arm/boot/dts/exynos4x12.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi          |   14 ++++-----
 arch/arm/boot/dts/exynos5420.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5440.dtsi          |    2 +-
 arch/arm/mach-exynos/common.h              |   43
---------------------------
 arch/arm/plat-samsung/include/plat/sdhci.h |   38 ------------------------
 drivers/irqchip/exynos-combiner.c          |   44
+---------------------------
 8 files changed, 12 insertions(+), 135 deletions(-)
