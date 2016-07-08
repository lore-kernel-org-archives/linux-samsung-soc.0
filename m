From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH 4/4] spi: s3c64xx: restore removed comments
Date: Fri, 08 Jul 2016 21:18:24 +0900
Message-ID: <1467980304-14093-5-git-send-email-andi.shyti@samsung.com>
References: <1467980304-14093-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50987 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754795AbcGHMSg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 08:18:36 -0400
In-reply-to: <1467980304-14093-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Patch a9e93e8 has erroneously removed some comments which are
important to understand why the bus frequency is multiplied by
two during the spi transfer.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/spi/spi-s3c64xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 1874bc5..d1fe100 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -639,6 +639,8 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
 	if (sdd->port_conf->clk_from_cmu) {
+		/* Configure Clock */
+		/* There is half-multiplier before the SPI */
 		clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
 	} else {
 		/* Configure Clock */
-- 
2.8.1
