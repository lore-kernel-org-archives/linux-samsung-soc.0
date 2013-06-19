From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V3 0/2] Add pinctrl support to Exynos5420
Date: Wed, 19 Jun 2013 12:42:07 +0530
Message-ID: <1371625929-12906-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43119 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab3FSGsd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 02:48:33 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00GQJO7CPGT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 15:48:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

This patchset adds the pinctrl support to Exynos5420.
This series is rebased and tested on for-next branch of kgene tree.

Changes since V2:
	- As Tomasz figa suggested, changed the sd0_bus4, sd1_bus4 and sd2_bus4 
	  nodes in pinctrl file so that gpio pins don't overlap between groups.
	- GPIO interrupt register offsets are added for exynos5420_pin_ctrl structure
	- Changed the gpio pin count from 8 to 7 for gpz
	- Added Acked-by: Linus Walleij <linus.walleij@linaro.org>
	- Removed the patch "gpio: samsung: skip gpiolib registration if pinctrl support
          is enabled for exynos5420" from the series.

Changes since V1:
	- As gpy7 bank supports interrupts, it is defined using EINTG macro

Leela Krishna Amudala (2):
  ARM: dts: add pinctrl support to Exynos5420
  pinctrl: exynos: add exynos5420 SoC specific data

 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |  680 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   45 ++
 drivers/pinctrl/pinctrl-exynos.c                   |  118 ++++
 drivers/pinctrl/pinctrl-samsung.c                  |    2 +
 drivers/pinctrl/pinctrl-samsung.h                  |    1 +
 6 files changed, 847 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5420-pinctrl.dtsi

-- 
1.7.9.5
