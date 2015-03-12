From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/8] platform/chrome: cros_ec_lpc - Use existing function to check EC result
Date: Thu, 12 Mar 2015 18:02:43 +0100
Message-ID: <1426179768-27482-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46852 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754536AbbCLRDZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 13:03:25 -0400
In-Reply-To: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Commit 6db07b633658 ("mfd: cros_ec: Check result code from EC messages")
added a common cros_ec_check_result() function that can be used to check
the ec_msg->result for errors and warns about them.

Use the existing function instead of duplicating same check in the driver.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/platform/chrome/cros_ec_lpc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 860310513cf0..3a675817c95d 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -95,19 +95,9 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 
 	/* Check result */
 	msg->result = inb(EC_LPC_ADDR_HOST_DATA);
-
-	switch (msg->result) {
-	case EC_RES_SUCCESS:
-		break;
-	case EC_RES_IN_PROGRESS:
-		ret = -EAGAIN;
-		dev_dbg(ec->dev, "command 0x%02x in progress\n",
-			msg->command);
+	ret = cros_ec_check_result(ec, msg);
+	if (ret)
 		goto done;
-	default:
-		dev_dbg(ec->dev, "command 0x%02x returned %d\n",
-			msg->command, msg->result);
-	}
 
 	/* Read back args */
 	args.flags = inb(EC_LPC_ADDR_HOST_ARGS);
-- 
2.1.4
