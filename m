From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/7] Exynos4412-based Trats2 USB gadget (DWC2) fixes
Date: Fri, 21 Aug 2015 14:38:36 +0200
Message-ID: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14227 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbbHUMjP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Aug 2015 08:39:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kamil Debski <k.debski@samsung.com>, Mark Brown <broonie@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>

Dear All,

Since v3.19 s3c-hsotg (DWC2) USB controller stopped working on
Exynos4412-based Trats2 platform. However on Odroid-U3 (which is also
Exynos4412-based) it worked fine all the time. After long investigation
it turned out that this was caused by 2 independent issues.

First issue was caused by patch 7eec1266751bd3a25e35ce88686634c768fedc24
("ARM: dts: Add Maxim 77693 PMIC to exynos4412-trats2") added support
for Maxim 77693 regulators, but without defining consumers for them.
This causes regulator core to disable them. However SAFEOUT1 regulator
provides power supply to VBUS signal, which also power some USB phy
related parts of Exynos SoC core. This has been fixed by patches 1-3,
which adds support for VBUS regulator, defines them in DTS for all
Exynos platforms and changes probe sequence of the drivers to ensure no
deferred probe occurs (USB gadget subsystem doesn't support deferred
probe yet).

Second issue is related to DWC2 driver rewrite and host/gadget/dual-role
integration code. DWC2 module on some platforms needs three additional
hardware resources: phy, clock and power supply. All of them must be
enabled/activated to properly initialize and operate. This was initially
handled in s3c-hsotg driver, which has been converted to 'gadget' part
of dwc2 driver. Unfortunately, not all of this code got moved to common
platform code, what resulted in accessing DWC2 registers without
enabling power supply regulators and clock. This caused initialization
failure on Exynos4412-based Trats2. Odroid U3 board worked fine, because
power supplies used by DWC2 module are marked there as 'always-on',
because they are also used by other modules (USB hub) and clock was
shared with USB2 PHY, so it was already enabled. This initialization
issue has been fixed by the last patch. While preparing it I've also
fixed a few minor issues found in nearby code (patches 4-6).

I would like to get those patches merged separately to respective
subsystem trees:
patch 1: phy subsystem tree
patch 2: Samsung Exynos tree
patch 3: regulator subsystem tree
patch 4-7: USB gadget subsystem tree

Patches have been prepared on top of linux-next from 20150821.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (7):
  phy: exynos-usb2: add vbus regulator support
  arm: dts: exynos: add vbus regulator to USB2 phy nodes
  regulators: max77693: register driver earlier to avoid deferred probe
  usb: dwc2: remove double call to s3c_hsotg_of_probe
  usb: dwc2: remove non-functional clock gating
  usb: dwc2: fix unbalanced phy control
  usb: dwc2: refactor common low-level hw code to platform.c

 .../devicetree/bindings/phy/samsung-phy.txt        |   3 +
 arch/arm/boot/dts/exynos3250-monk.dts              |   1 +
 arch/arm/boot/dts/exynos3250-rinato.dts            |   1 +
 arch/arm/boot/dts/exynos4210-trats.dts             |   2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts            |   1 +
 drivers/phy/phy-samsung-usb2.c                     |  25 ++-
 drivers/phy/phy-samsung-usb2.h                     |   2 +
 drivers/regulator/max77693.c                       |  12 +-
 drivers/usb/dwc2/core.h                            |   4 +-
 drivers/usb/dwc2/gadget.c                          | 196 +++----------------
 drivers/usb/dwc2/platform.c                        | 209 +++++++++++++++++----
 12 files changed, 239 insertions(+), 219 deletions(-)

-- 
1.9.2
