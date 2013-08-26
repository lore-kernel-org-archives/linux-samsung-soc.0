From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/3] 2nd Round Samsung DT for v3.12
Date: Mon, 26 Aug 2013 09:14:35 +0900
Message-ID: <1f7601cea1f1$3f2913d0$bd7b3b70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61869 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754270Ab3HZAOi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 20:14:38 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS40046Z3C923D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 09:14:37 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6f9d02a056fff8e965da0f940a09d4c39a4fe80a:

  ARM: dts: Add USB host node for Exynos4 (2013-08-19 05:07:17 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-2

for you to fetch changes up to f408f9db7deb9ce24b4a8875fdf54483d5068627:

  ARM: dts: add ADC device tree node for exynos5420/5250 (2013-08-26
02:44:30 +0900)

----------------------------------------------------------------
Update exynos DT:
- fix the RTC DT node name for exynos5250
- update the "status" property of RTC DT node for exynos5250
- add RTC DT node for  exynos5420
- add ADC DT node for exynos5420 and exynos5250

Based on previouse exynos DT branch, v3.12-next/dt-exynos

----------------------------------------------------------------
Naveen Krishna Chatradhi (1):
      ARM: dts: add ADC device tree node for exynos5420/5250

Vikas Sajjan (3):
      ARM: dts: Fix the RTC DT node name for Exynos5250
      ARM: dts: Update the "status" property of RTC DT node for Exynos5250
SoC
      ARM: dts: Add RTC DT node to Exynos5420 SoC

 arch/arm/boot/dts/exynos5.dtsi           |    2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts |    4 ----
 arch/arm/boot/dts/exynos5250-snow.dts    |    4 ----
 arch/arm/boot/dts/exynos5250.dtsi        |   14 +++++++++++++-
 arch/arm/boot/dts/exynos5420.dtsi        |   17 +++++++++++++++++
 5 files changed, 31 insertions(+), 10 deletions(-)
