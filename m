From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 1/3] i2c-s3c2410: Drop unused define
Date: Tue, 13 Mar 2012 17:54:37 +0100
Message-ID: <1331657679-31302-2-git-send-email-k.lewandowsk@samsung.com>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ben-linux@fluff.org
Cc: thomas.abraham@linaro.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, t.stanislaws@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Use standard of_match_ptr() to avoid defining variable unused
in non device tree builds.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 737f721..85e3664 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1128,8 +1128,6 @@ static const struct of_device_id s3c24xx_i2c_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
-#else
-#define s3c24xx_i2c_match NULL
 #endif
 
 static struct platform_driver s3c24xx_i2c_driver = {
@@ -1140,7 +1138,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
 		.owner	= THIS_MODULE,
 		.name	= "s3c-i2c",
 		.pm	= S3C24XX_DEV_PM_OPS,
-		.of_match_table = s3c24xx_i2c_match,
+		.of_match_table = of_match_ptr(s3c24xx_i2c_match),
 	},
 };
 
-- 
1.7.9
