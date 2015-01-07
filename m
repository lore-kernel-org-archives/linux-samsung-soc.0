From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH RESEND v2 0/4] ARM: dts: Add USB node for exynos3250 SoC boards
Date: Wed, 07 Jan 2015 23:08:17 +0900
Message-ID: <1420639701-1524-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

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
