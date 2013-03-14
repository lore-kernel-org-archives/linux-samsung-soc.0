From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v7 0/2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Thu, 14 Mar 2013 15:59:09 +0530
Message-ID: <1363256951-17158-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57868 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756029Ab3CNKbN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Mar 2013 06:31:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, dianders@chromium.org, p.paneri@samsung.com

Changes from v6:
 - Changing the file names accordingly as per
   [PATCH] usb: phy: rename all phy drivers to phy-$name.c
 - Using devm_clk_get for PHY ref clocks "ext_xtal" and "xusbxti"
 - Adding the bindings documentation for separate USB 2.0 phy and
   USB 3.0 phy.

Based on 'usb-next' plus Felipe's 'testing' branch patches;
(some 194 patches in fact ;-), on top of 3.9rc2 tag).

Tested after merging linux-samsung's 'for-next' into 'usb-next'
to verify things with recently merged common clock framework for
samsung's SoCs.

Vivek Gautam (2):
  usb: phy: samsung: Common out the generic stuff
  usb: phy: samsung: Add PHY support for USB 3.0 controller

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   76 ++-
 drivers/usb/phy/Kconfig                            |   22 +-
 drivers/usb/phy/Makefile                           |    2 +
 drivers/usb/phy/phy-samsung-usb.c                  |  726 +-------------------
 drivers/usb/phy/phy-samsung-usb.h                  |  327 +++++++++
 drivers/usb/phy/phy-samsung-usb2.c                 |  509 ++++++++++++++
 drivers/usb/phy/phy-samsung-usb3.c                 |  349 ++++++++++
 7 files changed, 1291 insertions(+), 720 deletions(-)
 create mode 100644 drivers/usb/phy/phy-samsung-usb.h
 create mode 100644 drivers/usb/phy/phy-samsung-usb2.c
 create mode 100644 drivers/usb/phy/phy-samsung-usb3.c

-- 
1.7.6.5
