From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/6] spi/s3c64xx: Flush FIFOs prior to cleaning up transfer
Date: Fri, 27 Sep 2013 20:44:04 +0100
Message-ID: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57285 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981Ab3I0Toj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:44:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Ensure that the FIFOs are fully drained before we deassert /CS or do any
delays that have been requested in order to ensure that the behaviour
visible on the bus matches that which was requested by the caller.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 229c6b9..2e267ce 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -960,6 +960,8 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 			goto out;
 		}
 
+		flush_fifo(sdd);
+
 		if (xfer->delay_usecs)
 			udelay(xfer->delay_usecs);
 
@@ -972,8 +974,6 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		}
 
 		msg->actual_length += xfer->len;
-
-		flush_fifo(sdd);
 	}
 
 out:
-- 
1.8.4.rc3
