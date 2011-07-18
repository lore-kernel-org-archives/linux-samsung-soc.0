From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] Add device tree support for Samsung's I2C driver.
Date: Mon, 18 Jul 2011 06:20:39 +0530
Message-ID: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59984 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756053Ab1GRAi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 20:38:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

This patchset adds device tree support for Samsung's I2C driver. The Exynos4 DT
enabled machine is updated to support device tree based probe for I2C instance 1.

Thomas Abraham (2):
  i2c: s3c24xx: Add device tree support
  arm: dt: Add device tree support for i2c instance 1 on exynos4 dt machine

 .../devicetree/bindings/i2c/samsung-i2c.txt        |   43 ++++++++++
 arch/arm/boot/dts/exynos4-smdkv310.dts             |   19 ++++-
 arch/arm/mach-exynos4/Kconfig                      |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c            |    9 ++
 drivers/i2c/busses/i2c-s3c2410.c                   |   87 ++++++++++++++++----
 5 files changed, 143 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/samsung-i2c.txt
