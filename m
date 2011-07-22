From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/3] Add device tree support for Samsung's I2C driver
Date: Fri, 22 Jul 2011 15:48:35 +0530
Message-ID: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44471 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753771Ab1GVKGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2011 06:06:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org, grant.likely@secretlab.ca, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

This patchset adds device tree support for Samsung's I2C driver. The
Exynos4 DT enabled machine is updated to support device tree based probe
for I2C instance 0 and 1.

Changes since v1:

- Addressed all comments from Grant Likely
    - s3c24xx_i2c_is2440 function is simpler now.
    - Consolidated all the scatterd dt support code into a single function.
    - but the dependency on i2c pinmux handler function passed from the
      platform data is retained. It would be removed eventually when the
      new pinmux api is finalized and the i2c driver is modified to
      support the pinmux settings using the pinmux api.

Thomas Abraham (3):
  i2c: s3c2410: Keep a copy of platform data and use it.
  i2c: s3c2410: Add device tree support
  arm: dt: Add device tree support for i2c instance 0 and 1 on exynos4 dt machine

 .../devicetree/bindings/i2c/samsung-i2c.txt        |   44 +++++++++++++++
 arch/arm/boot/dts/exynos4-smdkv310.dts             |   45 +++++++++++++++
 arch/arm/mach-exynos4/Kconfig                      |    2 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c            |   23 ++++++++
 drivers/i2c/busses/i2c-s3c2410.c                   |   58 +++++++++++++++++++-
 5 files changed, 169 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/samsung-i2c.txt
