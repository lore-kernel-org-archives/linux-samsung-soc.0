From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/2] i2c-s3c2410: Implementation bus arbitration support
Date: Thu, 29 Nov 2012 10:35:33 +0530
Message-ID: <1354165536-18529-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12139 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711Ab2K2FGS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Nov 2012 00:06:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: naveen@chromium.org, sjg@chromium.org, grundler@chromium.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org

This patchset adds support for i2c bus arbitration between AP(exynos),
device(EC) in i2c-s3c2410 driver.

Simon Glass (2):
  i2c-s3c2410: Leave the bus disabled unless it is in use
  i2c-s3c2410: Add bus arbitration implementation

 .../devicetree/bindings/i2c/samsung-i2c.txt        |   46 +++++
 drivers/i2c/busses/i2c-s3c2410.c                   |  204 ++++++++++++++++++--
 2 files changed, 233 insertions(+), 17 deletions(-)

-- 
1.7.9.5
