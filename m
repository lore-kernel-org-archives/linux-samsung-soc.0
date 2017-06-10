From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH 5/7] [media] media: s3c-camif: Use MEDIA_REVISON instead of
 KERNEL_VERSION
Date: Sat, 10 Jun 2017 11:05:34 +0200
Message-ID: <20170610090536.12472-6-jthumshirn@suse.de>
References: <20170610090536.12472-1-jthumshirn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170610090536.12472-1-jthumshirn@suse.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Use MEDIA_REVISON instead of KERNEL_VERSION to encode the driver
version.

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index ec4001970313..98bd5719fdf5 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -317,7 +317,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 		 ip_rev == S3C6410_CAMIF_IP_REV ? "6410" : "244X");
 	strlcpy(md->bus_info, "platform", sizeof(md->bus_info));
 	md->hw_revision = ip_rev;
-	md->driver_version = KERNEL_VERSION(1, 0, 0);
+	md->driver_version = MEDIA_REVISION(1, 0, 0);
 
 	md->dev = camif->dev;
 
-- 
2.12.3
