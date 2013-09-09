From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 0/6] spi/s3c64xx: clean up and optimization
Date: Mon, 09 Sep 2013 16:09:20 +0200
Message-ID: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495Ab3IIOJf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

This patch series includes following modifications:
	1) remove redundant code
	2) add coherent buffers
	3) remove multiple  channel requests and releases

For more info please look into particular commit messages.

I have tested my patches on Exynos 4412(with PL330 DMA) platform
with S5C73M3 driver(firmware upload via SPI).

This patch series depends on:
[1] - https://lkml.org/lkml/2013/8/11/79
[2] - http://www.kernelhub.org/?msg=323408&p=2

When other SAMSUNG platforms will support DMA generic operations then
my patches 1-4,6 can be applied.

This is only proof of concept so any comments are welcome.

Thanks,
Lukasz

Lukasz Czerwinski (6):
  spi: spi-s3c64xx: Remove platform dependent code
  spi: spi-s3c64xx: Correct functions namespacing
  spi: spi-s3c64xx: Add coherent buffers for DMA transfers
  spi: spi-s3c64xx: Remove redundant code
  spi: spi-s3c64xx: Use module_platform_driver()
  spi: spi-s3c64xx: Move DMA initialization

 drivers/spi/spi-s3c64xx.c |  388 +++++++++++++++------------------------------
 1 file changed, 130 insertions(+), 258 deletions(-)

-- 
1.7.9.5
