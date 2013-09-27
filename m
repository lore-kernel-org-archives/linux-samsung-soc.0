From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/6] spi/s3c64xx: Check that clock enables succeed on runtime resume
Date: Fri, 27 Sep 2013 20:44:05 +0100
Message-ID: <1380311049-973-2-git-send-email-broonie@kernel.org>
References: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57305 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754108Ab3I0TpC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:45:02 -0400
In-Reply-To: <1380311049-973-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 2e267ce..dd5ed13 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1524,9 +1524,17 @@ static int s3c64xx_spi_runtime_resume(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+	int ret;
 
-	clk_prepare_enable(sdd->src_clk);
-	clk_prepare_enable(sdd->clk);
+	ret = clk_prepare_enable(sdd->src_clk);
+	if (ret != 0)
+		return ret;
+
+	ret = clk_prepare_enable(sdd->clk);
+	if (ret != 0) {
+		clk_disable_unprepare(sdd->src_clk);
+		return ret;
+	}
 
 	return 0;
 }
-- 
1.8.4.rc3
