From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v5 0/3] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Fri, 15 Mar 2013 13:32:11 +0530
Message-ID: <1363334534-21901-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, grant.likely@secretlab.ca, dianders@chromium.org, jg1.han@samsung.com, p.paneri@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch-set is in continuation with patch-series:
[PATCH v4 0/4] Enable ehci, ohci and dwc3 devices on exynos5250
out of which follwowing patches have been picked up:
ARM: Exynos5250: Enabling ehci-s5p driver
ARM: Exynos5250: Enabling ohci-exynos driver

Based on following patch-set for Samsung's usb PHY enablement:
[PATCH v4 0/2] ARM: Exynos5250: Enabling samsung usb phy

and further depends on dwc3-exynos driver patch-set:
[PATCH 0/2] dwc3: exynos: Device tree fixes

Changes from v4:
 - Aligning with the recently merged common clock framework, thereby
   no place for clock file changes. ;-)
 - Adding proper binding documentation as per latest bindings changes in
   dwc3 driver (dwc3/core.c as well as for dwc3-exynos.c change reflected
   by above patch-set.
 - Bifurcating the patch to separate our Documentation, arch and dts changes.

Vivek Gautam (3):
  usb: Add device tree bindings for dwc3-exynos
  ARM: exynos5250: dts: Enabling dwc3-exynos driver
  ARM: exynos5: Enable XHCI support on exynos5

 .../devicetree/bindings/usb/exynos-usb.txt         |   34 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   20 ++++++++++-
 arch/arm/mach-exynos/Kconfig                       |    1 +
 3 files changed, 53 insertions(+), 2 deletions(-)

-- 
1.7.6.5

