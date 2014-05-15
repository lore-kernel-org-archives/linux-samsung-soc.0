From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for 3.15
Date: Thu, 15 May 2014 18:13:09 +0900
Message-ID: <02ae01cf701d$e5761f80$b0625e80$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54380 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbaEOJNO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 05:13:14 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5L006M3YY08E90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 May 2014 18:13:12 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof, Kevin,

Please pull Samsung fixes and if any problem, please kinldly let me know.

Thanks,
Kukjin

The following changes since commit 89ca3b881987f5a4be4c5dbaa7f0df12bbdde2fd:

  Linux 3.15-rc4 (2014-05-04 18:14:42 -0700)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes

for you to fetch changes up to 702b691e4a711e699cf3cccba879c1d945665c0d:

  ARM: dts: Remove g2d_pd node for exynos5420 (2014-05-15 04:18:24 +0900)

----------------------------------------------------------------
Samsung fixes for 3.15
- Remove g2d_pd and mau_pd nodes on exynos5420.
  Since the power domains are linked to the CMU blocks,
  kernel panic happens during access clocks when the
  power domains are disabled. Now this is a best solution.
- Enable HS-I2C on exynos5 by default
  MMC partition cannot be mounted for RFS without the
  enabling HS-I2C because regulators for MMC power are
  connected to HS-I2C bus.
- Disable MDMA1 node on exynos5420
  When MDMA1 runs in secure mode it makes kernel fault,
  so need to disalbe it on exynos5420 by default instead
  of each board.
- Fix the secondary CPU boot for exynos4212

----------------------------------------------------------------
Arun Kumar K (1):
      ARM: dts: Remove g2d_pd node for exynos5420

Kyungmin Park (1):
      ARM: EXYNOS: fix the secondary CPU boot of exynos4212

Sachin Kamat (1):
      ARM: exynos_defconfig: enable HS-I2C to fix for mmc partition mount

Seungwon Jeon (1):
      ARM: dts: disable MDMA1 node for exynos5420

Tushar Behera (1):
      ARM: dts: Remove mau_pd node for exynos5420

 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   12 ------------
 arch/arm/boot/dts/exynos5420.dtsi             |   18 +++++++-----------
 arch/arm/configs/exynos_defconfig             |    1 +
 arch/arm/mach-exynos/firmware.c               |   15 ++++++++++++++-
 4 files changed, 22 insertions(+), 24 deletions(-)
