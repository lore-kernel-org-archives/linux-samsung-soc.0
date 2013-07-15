From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 1/2] spi: s3c64xx: fix printk warnings
Date: Mon, 15 Jul 2013 15:11:11 +0900
Message-ID: <000001ce8122$1ab3df70$501b9e50$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11179 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911Ab3GOGLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 02:11:18 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>, 'Jingoo Han' <jg1.han@samsung.com>

Fix the following build warnings when LPAE is enabled:

drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type
'resource_size_t' [-Wformat]
drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type
'resource_size_t' [-Wformat]

Use vsprintf extension %pR to format resource.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Changes since v1:
- Fixed typo of the commit to 'LPAE'.

 drivers/spi/spi-s3c64xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index eb53df2..21ba0a0 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1461,8 +1461,8 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Slaves attached\n",
 					sdd->port_id, master->num_chipselect);
-	dev_dbg(&pdev->dev, "\tIOmem=[0x%x-0x%x]\tDMA=[Rx-%d, Tx-%d]\n",
-					mem_res->end, mem_res->start,
+	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tDMA=[Rx-%d, Tx-%d]\n",
+					mem_res,
 					sdd->rx_dma.dmach, sdd->tx_dma.dmach);
 
 	pm_runtime_enable(&pdev->dev);
-- 
1.7.10.4
