From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v2 0/4] ARM: dts: Add USB node for exynos3250 SoC boards
Date: Wed, 24 Dec 2014 14:45:29 +0900
Message-ID: <1419399933-3707-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63636 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaLXFpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Dec 2014 00:45:38 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>

This patch series adds USB device node and phy for exynos3250 SoC.
And enables for rinato and monk boards.

Changes in v2:
 - remove unnessasary property "samsung,sysreg-phandle"
 - change "xusbxti" clock to "CLK_SCLK_UPLL"

Jaewon Kim (4):
  ARM: dts: Add exynos_usbphy node for exynos3250
  ARM: dts: Add hsotg node for exynos3250
  ARM: dts: Enable USB node for exynos3250-rinato
  ARM: dts: Enable USB node for exynos3250-monk

 arch/arm/boot/dts/exynos3250-monk.dts   |   10 ++++++++++
 arch/arm/boot/dts/exynos3250-rinato.dts |   10 ++++++++++
 arch/arm/boot/dts/exynos3250.dtsi       |   21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)

-- 
1.7.9.5
