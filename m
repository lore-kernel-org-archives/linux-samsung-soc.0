From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/2] i2c: Implement generic gpio based bus arbitration
Date: Fri, 14 Dec 2012 11:20:52 +0530
Message-ID: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, grundler@chromium.org, naveen@chromium.org, broonie@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

This patchset adds
1. Support for generic gpio based i2c bus arbitration between 2 i2c Masters
	Ex: between AP(exynos), device(EC).
2. Documentation and sample implmentation in i2c-s3c2410 driver.

Naveen Krishna Chatradhi (2):
  i2c-core: Add gpio based bus arbitration implementation
  i2c-s3c2410: Add GPIO based bus arbitration functionality

 .../devicetree/bindings/i2c/arbitrator-i2c.txt     |   56 ++++++++++++++
 drivers/i2c/busses/i2c-s3c2410.c                   |   79 ++++++++++++--------
 drivers/i2c/i2c-core.c                             |   67 +++++++++++++++++
 drivers/of/of_i2c.c                                |   27 +++++++
 include/linux/i2c.h                                |   17 +++++
 include/linux/of_i2c.h                             |    2 +
 6 files changed, 216 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/arbitrator-i2c.txt

-- 
1.7.9.5
