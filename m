From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/4] pinctrl: samsung: Add support for Exynos4x12 SoCs
Date: Wed, 24 Oct 2012 16:37:33 +0200
Message-ID: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62417 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934903Ab2JXOht (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 10:37:49 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCE00DXSJB0FWD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 23:37:48 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCE008EXJASPN20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 23:37:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org

This patch series adds pinctrl support for SoCs from Exynos4x12 family.

First two patches make necessary preperations to skip legacy GPIO and
GPIO interrupt registration in case of Exynos4x12 SoCs which are not
supported by legacy (non-DT) code.

Third patch adds Exynos4x12-specific definitions to pinctrl-samsung driver.

Fourth patch adds device nodes for pin controllers available on Exynos4x12
SoCs to Exynos4x12 device tree sources.

This series depends on:
  - [PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs

Tomasz Figa (4):
  ARM: EXYNOS: Skip wakeup-int setup if pinctrl driver is used on
    Exynos4x12
  gpio: samsung: Skip registration if pinctrl driver is present on
    Exynos4x12
  pinctrl: samsung: Add support for Exynos4x12
  ARM: dts: exynos4x12: Add nodes for pin controllers

 .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          | 965 +++++++++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  |  38 +
 arch/arm/mach-exynos/common.c                      |   7 +-
 drivers/gpio/gpio-samsung.c                        |  43 +-
 drivers/pinctrl/pinctrl-exynos.c                   | 110 +++
 drivers/pinctrl/pinctrl-samsung.c                  |   2 +
 drivers/pinctrl/pinctrl-samsung.h                  |   1 +
 8 files changed, 1144 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi

-- 
1.7.12
