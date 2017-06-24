From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 2/4] media: s3c-camif: use LINUX_VERSION_CODE for driver's version
Date: Sat, 24 Jun 2017 17:40:25 -0300
Message-ID: <3046b1093267f62c2f05b33941889cad7219eca4.1498336792.git.mchehab@s-opensource.com>
References: <73980406b3bb4a6829a1d1bca69a555477234beb.1498336792.git.mchehab@s-opensource.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <73980406b3bb4a6829a1d1bca69a555477234beb.1498336792.git.mchehab@s-opensource.com>
In-Reply-To: <73980406b3bb4a6829a1d1bca69a555477234beb.1498336792.git.mchehab@s-opensource.com>
References: <73980406b3bb4a6829a1d1bca69a555477234beb.1498336792.git.mchehab@s-opensource.com>
Sender: linux-media-owner@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Johannes Thumshirn <jthumshirn@suse.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

We seldomly increment version numbers on drivers, because... we
usually forget ;-)

So, instead, just make it identical to the Kernel version, as what
we do on all other drivers.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index ec4001970313..8f0414041e81 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -317,7 +317,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 		 ip_rev == S3C6410_CAMIF_IP_REV ? "6410" : "244X");
 	strlcpy(md->bus_info, "platform", sizeof(md->bus_info));
 	md->hw_revision = ip_rev;
-	md->driver_version = KERNEL_VERSION(1, 0, 0);
+	md->driver_version = LINUX_VERSION_CODE;
 
 	md->dev = camif->dev;
 
-- 
2.9.4
