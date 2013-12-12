From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 0/6] Exynos device tree clean-up for 3.14
Date: Thu, 12 Dec 2013 17:12:12 +0100
Message-ID: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52967 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497Ab3LLQMi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:12:38 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This series intends to fix small problems with Exynos device tree sources
that I spotted during my work on other things. The fixes are mostly
stylistic, without any funtional changes introduced.

Changes sinve v2:
 - Moved MSHC patches to separate series.
 - Rebased onto current linux-next.
Changes since v1:
 - Addressed Stephen Warren's comments about MCT binding documentation.

Tomasz Figa (6):
  Documentation: devicetree: Update Exynos MCT bindings description
  ARM: dts: exynos4: Drop interrupt controller properties from MCT nodes
  ARM: dts: exynos4x12: Move MCT node to exynos4x12.dtsi
  ARM: dts: exynos4: Simplify MCT interrupt map
  ARM: dts: exynos: Fix missing spaces after labels
  ARM: dts: exynos4: Add missing unit-address of sysreg node

 .../bindings/timer/samsung,exynos4210-mct.txt      | 54 +++++++++++++++-------
 arch/arm/boot/dts/exynos4.dtsi                     |  6 +--
 arch/arm/boot/dts/exynos4210.dtsi                  | 23 ++++-----
 arch/arm/boot/dts/exynos4212.dtsi                  | 24 +---------
 arch/arm/boot/dts/exynos4412.dtsi                  | 28 +----------
 arch/arm/boot/dts/exynos4x12.dtsi                  | 20 ++++++++
 arch/arm/boot/dts/exynos5.dtsi                     |  4 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |  6 +--
 arch/arm/boot/dts/exynos5440.dtsi                  |  2 +-
 9 files changed, 78 insertions(+), 89 deletions(-)

-- 
1.8.4.3
