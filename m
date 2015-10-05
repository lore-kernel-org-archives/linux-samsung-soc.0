From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung fixes for v4.3
Date: Tue, 06 Oct 2015 07:57:33 +0900
Message-ID: <5613005D.70709@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51223 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752032AbbJEW7x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 18:59:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes

for you to fetch changes up to 4776dbb3583d10969f991cc89da781884c15979d:

  Merge tag 'samsung-fixes-4.3' of http://github.com/krzk/linux into
v4.3-samsung-fixes (2015-09-30 15:42:39 +0900)

----------------------------------------------------------------

Samsung fixes for v4.3

- fix invalid clock used for FIMD IOMMU
- fix thermal boot issue smdk5250-smdk5250
- fix S2R on exynos4412 trats2 boards
- fix LEDs on exynos5422-odroidxu3-common
- fix booting of all 8 cores on exynos542x

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      ARM: dts: add suspend opp to exynos4412

Chanho Park (1):
      ARM: EXYNOS: reset Little cores when cpu is up

Joonyoung Shim (1):
      ARM: dts: Fix wrong clock binding for sysmmu_fimd1_1 on exynos5420

Krzysztof Kozlowski (1):
      ARM: dts: Fix LEDs on exynos5422-odroidxu3

Kukjin Kim (1):
      Merge tag 'samsung-fixes-4.3' of http://github.com/krzk/linux into
v4.3-samsung-fixes

Yadwinder Singh Brar (1):
      ARM: dts: Fix bootup thermal issue on smdk5250

 arch/arm/boot/dts/exynos4412.dtsi                  |  1 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |  1 +
 arch/arm/boot/dts/exynos5420.dtsi                  |  2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  1 -
 arch/arm/mach-exynos/mcpm-exynos.c                 | 27
+++++++++++++++++++++-
 arch/arm/mach-exynos/regs-pmu.h                    |  6 +++++
 6 files changed, 35 insertions(+), 3 deletions(-)
