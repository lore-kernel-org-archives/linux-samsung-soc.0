From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/6] spi/s3c64xx: Remove unused gpios field from driver data
Date: Fri, 27 Sep 2013 20:44:06 +0100
Message-ID: <1380311049-973-3-git-send-email-broonie@kernel.org>
References: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57313 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981Ab3I0Ton (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:44:43 -0400
In-Reply-To: <1380311049-973-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index dd5ed13..7f960db 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -205,7 +205,6 @@ struct s3c64xx_spi_driver_data {
 #endif
 	struct s3c64xx_spi_port_config	*port_conf;
 	unsigned int			port_id;
-	unsigned long			gpios[4];
 	bool				cs_gpio;
 };
 
-- 
1.8.4.rc3
