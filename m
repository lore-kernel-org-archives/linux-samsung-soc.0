From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3 1/5] mfd: tps65090: Don't tell child devices we have an IRQ if we don't
Date: Wed, 16 Apr 2014 16:12:25 -0700
Message-ID: <1397689950-1568-2-git-send-email-dianders@chromium.org>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f73.google.com ([209.85.219.73]:52233 "EHLO
	mail-oa0-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757027AbaDPXMu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 19:12:50 -0400
Received: by mail-oa0-f73.google.com with SMTP id n16so2454761oag.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 16:12:50 -0700 (PDT)
In-Reply-To: <1397689950-1568-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anton Vorontsov <anton@enomsg.org>
Cc: Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

If we weren't given an interrupt we shouldn't tell child devices (like
the tps65090 charger) that they have an interrupt.  This is needed so
that we can support polling mode in the tps65090 charger driver.

See also (charger: tps65090: Allow charger module to be used when no
irq).

Signed-off-by: Doug Anderson <dianders@chromium.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v3: None
Changes in v2:
- Split noirq (polling mode) changes into MFD and charger

 drivers/mfd/tps65090.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index ba1a25d..c3cddb4 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -64,11 +64,16 @@ static struct resource charger_resources[] = {
 	}
 };
 
-static const struct mfd_cell tps65090s[] = {
-	{
+enum tps65090_cells {
+	PMIC = 0,
+	CHARGER = 1,
+};
+
+static struct mfd_cell tps65090s[] = {
+	[PMIC] = {
 		.name = "tps65090-pmic",
 	},
-	{
+	[CHARGER] = {
 		.name = "tps65090-charger",
 		.num_resources = ARRAY_SIZE(charger_resources),
 		.resources = &charger_resources[0],
@@ -211,6 +216,9 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 					"IRQ init failed with err: %d\n", ret);
 			return ret;
 		}
+	} else {
+		/* Don't tell children they have an IRQ that'll never fire */
+		tps65090s[CHARGER].num_resources = 0;
 	}
 
 	ret = mfd_add_devices(tps65090->dev, -1, tps65090s,
-- 
1.9.1.423.g4596e3a
