From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/2 v2] spi: s3c64xx: use "cs-gpios" in spi node instead of
 "cs-gpio"
Date: Tue, 10 Jun 2014 15:37:59 +0530
Message-ID: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26687 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333AbaFJKKq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 06:10:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org

Currently, spi-s3c64xx.c needs "cs-gpio" chip select GPIO to be
defined under "controller-data" node under each slave node.

&spi_x {
        cs-gpios <>;
        ...
        slave_node {

                controller-data {
                        cs-gpio = <>;
                        ...
                };
                ...
        };
        ...
};

Where as, SPI core and many other drivers uses "cs-gpios" for
from device tree node.

Hence, make changes in spi-s3c64xx.c driver to make use of
"cs-gpios" from SPI node(parent) instead of "cs-gpio" defined in
slaves "controller-data"(child) node.

Also, fixes a compilation warning and corrects the DTS nodes for
Exynos4210 based SMDKv310, Exynos4412 based Trats2, Exynos5250 based
SMDK5250 boards.

Naveen Krishna Chatradhi (2):
based on for-next branch of spi.git
  spi: s3c64xx: use "cs-gpios" from spi node instead of "cs-gpio"

based on for-next branch of linuxsamsung.git
  ARM: DTS: move "cs-gpio" from "controller-data" to under spi node

 .../devicetree/bindings/spi/spi-samsung.txt        |    8 ++-
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts            |    2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    2 +-
 drivers/spi/spi-s3c64xx.c                          |   56 ++++++++++++--------
 5 files changed, 41 insertions(+), 29 deletions(-)

-- 
1.7.9.5
