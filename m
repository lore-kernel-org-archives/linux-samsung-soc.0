From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/6] Samsung USB PHY SoC support cleanup
Date: Thu, 16 May 2013 11:57:05 +0200
Message-ID: <1368698231-24268-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53090 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990Ab3EPJ5a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 05:57:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, balbi@ti.com, Praveen Paneri <p.paneri@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, gregkh@linuxfoundation.org, kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>

This patch series intends to improve handling of SoC-specific differences
in Samsung USB PHY drivers, by reducing the need to explicitly check
SoC type using if and switch statements.

In addition, last patch adds support for Exynos 4x12, as this is simply
a matter of adding appropriate driver data and additional case in two switches.

Tested on Exynos4210-based Trats board and Exynos4412-based internal
Samsung board.

Changes since v1:
 - rebased to latest usb-next

Tomasz Figa (6):
  usb: phy: samsung: Select common driver part implicitly
  usb: phy: samsung: Use clk_get to get reference clock
  usb: phy: samsung: Consolidate reference clock rate handling
  usb: phy: samsung: Pass set_isolation callback through driver data
  usb: phy: samsung: Pass enable/disable callbacks through driver data
  usb: phy: samsung: Add support for USB 2.0 PHY on Exynos 4x12

 drivers/usb/phy/Kconfig            |   2 +-
 drivers/usb/phy/phy-samsung-usb.c  | 154 ++++++++++++++++++-------------------
 drivers/usb/phy/phy-samsung-usb.h  |  14 +++-
 drivers/usb/phy/phy-samsung-usb2.c |  53 +++++++++----
 drivers/usb/phy/phy-samsung-usb3.c |  23 ++++--
 5 files changed, 146 insertions(+), 100 deletions(-)

-- 
1.8.2.1
