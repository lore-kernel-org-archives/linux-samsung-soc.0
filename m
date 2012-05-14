From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Initial hookup for Bells module on Cragganmore
Date: Mon, 14 May 2012 18:20:40 +0100
Message-ID: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34831 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757147Ab2ENRUr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 13:20:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

The Bells module now has a number assigned to it. Also hook up the WM9081
which is soldered down onto the board.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 0c9b0cb..dbd5771 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -192,6 +192,11 @@ static const struct i2c_board_info wm1277_devs[] = {
 	},
 };
 
+static const struct i2c_board_info wm6230_i2c_devs[] = {
+	{ I2C_BOARD_INFO("wm9081", 0x6c),
+	  .platform_data = &wm9081_pdata, },
+};
+
 static __devinitdata const struct {
 	u8 id;
 	const char *name;
@@ -205,7 +210,9 @@ static __devinitdata const struct {
 	{ .id = 0x03, .name = "1252-EV1 Glenlivet" },
 	{ .id = 0x11, .name = "6249-EV2 Glenfarclas", },
 	{ .id = 0x14, .name = "6271-EV1 Lochnagar" },
-	{ .id = 0x15, .name = "XXXX-EV1 Bells" },
+	{ .id = 0x15, .name = "6320-EV1 Bells",
+	  .i2c_devs = wm6230_i2c_devs,
+	  .num_i2c_devs = ARRAY_SIZE(wm6230_i2c_devs) },
 	{ .id = 0x21, .name = "1275-EV1 Mortlach" },
 	{ .id = 0x25, .name = "1274-EV1 Glencadam" },
 	{ .id = 0x31, .name = "1253-EV1 Tomatin",
-- 
1.7.10
