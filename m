From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 02/10] platform/chrome: cros_ec_lpc - Use existing function to check EC result
Date: Sat,  9 May 2015 12:10:33 +0200
Message-ID: <1431166241-15775-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 6db07b633658 ("mfd: cros_ec: Check result code from EC messages")
added a common cros_ec_check_result() function that can be used to check
the ec_msg->result for errors and warns about them.

Use the existing function instead of duplicating same check in the driver.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
---

Changes since v1:
 - Added Gwendal Grignou Reviewed and Tested-by tags
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
