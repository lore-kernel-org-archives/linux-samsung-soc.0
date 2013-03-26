From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/6] Samsung USB PHY SoC support cleanup
Date: Tue, 26 Mar 2013 15:53:09 +0100
Message-ID: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10236 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933632Ab3CZOx2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 10:53:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, balbi@ti.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com, Tomasz Figa <t.figa@samsung.com>

This patch series intends to improve handling of SoC-specific differences
in Samsung USB PHY drivers, by reducing the need to explicitly check
SoC type using if and switch statements.

In addition, last patch adds support for Exynos 4x12, as this is simply
a matter of adding appropriate driver data and additional case in two switches.

Tested on Exynos4210-based Trats board and Exynos4412-based internal
Samsung board.

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
1.8.1.5
