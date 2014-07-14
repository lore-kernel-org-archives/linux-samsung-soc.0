From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/3 v6] spi: s3c64xx: use "cs-gpios" in spi node instead of
 "cs-gpio"
Date: Mon, 14 Jul 2014 11:11:43 +0530
Message-ID: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63516 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbaGNFpM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 01:45:12 -0400
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

Changes since v5:
1. Fixed the "making a GPIO chip select mandatory" bug.

Naveen Krishna Chatradhi (3):
  spi: s3c64xx: fix broken "cs_gpios" usage in the driver
  spi: s3c64xx: for DT platofrms always get the chipselect info from DT
    node
  ARM: DTS: fix the chip select gpios definition in the SPI nodes

 .../devicetree/bindings/spi/spi-samsung.txt        |    8 ++--
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts            |    2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    2 +-
 drivers/spi/spi-s3c64xx.c                          |   41 ++++++++------------
 5 files changed, 22 insertions(+), 33 deletions(-)

-- 
1.7.9.5
