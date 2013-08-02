From: Julius Werner <jwerner@chromium.org>
Subject: [PATCH 0/3] usb: phy-samsung-usb: Simplify and cleanup
Date: Thu,  1 Aug 2013 17:52:03 -0700
Message-ID: <1375404726-26264-1-git-send-email-jwerner@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:50821 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022Ab3HBAw5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Aug 2013 20:52:57 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so50285pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Aug 2013 17:52:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, devicetree@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Julius Werner <jwerner@chromium.org>

This patch series cleans up and simplifies some of the Samsung USB PHY
driver code. It changes the PMU register handling to carry the register
address directly in the device tree and avoid a lot of special-cased
address arithmatic in the code. Then it removes the USB_PHY_TYPE
HOST/DEVICE distinction which was only needed for those removed parts.

Julius Werner (3):
  usb: phy-samsung-usb: Simplify PMU register handling
  usb: phy-samsung-usb: trivial: rename pmuregs variable
  usb: phy-samsung-usb: Remove USB_PHY_TYPE from Samsung PHY driver

 arch/arm/boot/dts/exynos5250.dtsi  |  4 +--
 drivers/usb/phy/phy-samsung-usb.c  | 51 +++++++++-----------------------------
 drivers/usb/phy/phy-samsung-usb.h  | 34 ++++++-------------------
 drivers/usb/phy/phy-samsung-usb2.c | 34 +++++++------------------
 drivers/usb/phy/phy-samsung-usb3.c | 13 +++-------
 5 files changed, 34 insertions(+), 102 deletions(-)

-- 
1.7.12.4
