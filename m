From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/3] mtd: s3c2410: Constify platform_device_id
Date: Sat,  2 May 2015 00:50:02 +0900
Message-ID: <1430495403-31560-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/mtd/nand/s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 0e02be47ce1d..381f67ac6b5a 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -1105,7 +1105,7 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 
 /* driver device registration */
 
-static struct platform_device_id s3c24xx_driver_ids[] = {
+static const struct platform_device_id s3c24xx_driver_ids[] = {
 	{
 		.name		= "s3c2410-nand",
 		.driver_data	= TYPE_S3C2410,
-- 
2.1.4
