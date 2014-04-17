From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 1/7] mfd: cros_ec: spi: calculate delay between transfers correctly
Date: Thu, 17 Apr 2014 10:59:24 -0700
Message-ID: <1397757570-19750-2-git-send-email-dianders@chromium.org>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f202.google.com ([209.85.213.202]:45443 "EHLO
	mail-ig0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbaDQSAS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 14:00:18 -0400
Received: by mail-ig0-f202.google.com with SMTP id uq10so75591igb.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2014 11:00:17 -0700 (PDT)
In-Reply-To: <1397757570-19750-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: abrestic@chromium.org, dgreid@chromium.org, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, David Hendricks <dhendrix@chromium.org>, Doug Anderson <dianders@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org

From: David Hendricks <dhendrix@chromium.org>

To avoid spamming the EC we calculate the time between the previous
transfer and the current transfer and force a delay if the time delta
is too small.

However, a small miscalculation causes the delay period to be
far too short. Most noticably this impacts commands with a long
turnaround time such as EC firmware reads and writes.

Signed-off-by: David Hendricks <dhendrix@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/mfd/cros_ec_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 84af8d7..c185eb6 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -219,7 +219,7 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 		ktime_get_ts(&ts);
 		delay = timespec_to_ns(&ts) - ec_spi->last_transfer_ns;
 		if (delay < EC_SPI_RECOVERY_TIME_NS)
-			ndelay(delay);
+			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
 	}
 
 	/* Transmit phase - send our message */
-- 
1.9.1.423.g4596e3a
