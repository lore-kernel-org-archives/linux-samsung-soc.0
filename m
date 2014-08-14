From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/5] usb: phy: samsung: remove old USB PHY code
Date: Thu, 14 Aug 2014 16:25:22 +0200
Message-ID: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42540 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755312AbaHNOZo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Aug 2014 10:25:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Hi,

This patch series removes the old Samsung USB PHY drivers that
got replaced by the new ones using the generic PHY layer.

Depends on:
- next-20140813 branch of linux-next kernel

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
