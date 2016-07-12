From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 6/7] spi: s3c64xx: restore removed comments
Date: Tue, 12 Jul 2016 19:02:15 +0900
Message-ID: <1468317736-18841-7-git-send-email-andi.shyti@samsung.com>
References: <1468317736-18841-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53061 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932521AbcGLKCh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 06:02:37 -0400
In-reply-to: <1468317736-18841-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Patch a9e93e8 has erroneously removed some comments which are
important to understand why the bus frequency is multiplied by
two during the spi transfer.

Reword the previous comment to a more appropriate message.

Suggested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Reviewed-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 6da663f..5bedafc 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -639,6 +639,7 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
 	if (sdd->port_conf->clk_from_cmu) {
+		/* The src_clk clock is divided internally by 2 */
 		clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
 	} else {
 		/* Configure Clock */
-- 
2.8.1
