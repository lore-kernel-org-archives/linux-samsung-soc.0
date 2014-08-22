From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/5] usb: phy: samsung: remove old USB PHY code
Date: Fri, 22 Aug 2014 18:59:00 +0200
Message-ID: <1408726745-31135-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch series removes the old Samsung USB PHY drivers that
got replaced by the new ones using the generic PHY layer.

Depends on:
- v3.17-rc1 branch of Linus' kernel

Changes since v1 (https://lkml.org/lkml/2014/8/14/241):
- rebased on v3.17-rc1 kernel
- added Acked-by-s from Kishon Vijay Abraham I
- added Reviewed-by-s from Vivek Gautam and Jingoo Han

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (5):
  ARM: dts: remove old USB2 PHY node hook for Arndale
  ARM: dts: remove old USB2 PHY node for Exynos5250
  usb: phy: samsung: remove old USB 2.0 PHY driver
  usb: phy: samsung: remove old USB 3.0 PHY driver
  usb: phy: samsung: remove old common USB PHY code

 arch/arm/boot/dts/exynos5250-arndale.dts     |   4 -
 arch/arm/boot/dts/exynos5250.dtsi            |  15 -
 drivers/usb/phy/Kconfig                      |  23 --
 drivers/usb/phy/Makefile                     |   3 -
 drivers/usb/phy/phy-samsung-usb.c            | 241 ------------
 drivers/usb/phy/phy-samsung-usb.h            | 349 -----------------
 drivers/usb/phy/phy-samsung-usb2.c           | 541 ---------------------------
 drivers/usb/phy/phy-samsung-usb3.c           | 350 -----------------
 include/linux/platform_data/samsung-usbphy.h |  27 --
 9 files changed, 1553 deletions(-)
 delete mode 100644 drivers/usb/phy/phy-samsung-usb.c
 delete mode 100644 drivers/usb/phy/phy-samsung-usb.h
 delete mode 100644 drivers/usb/phy/phy-samsung-usb2.c
 delete mode 100644 drivers/usb/phy/phy-samsung-usb3.c
 delete mode 100644 include/linux/platform_data/samsung-usbphy.h

-- 
1.8.2.3
