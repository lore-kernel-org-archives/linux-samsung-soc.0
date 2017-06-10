From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH 6/7] [media] media: bcm2048: use MEDIA_REVISION isntead of
 KERNEL_VERSION
Date: Sat, 10 Jun 2017 11:05:35 +0200
Message-ID: <20170610090536.12472-7-jthumshirn@suse.de>
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

Use MEDIA_REVISION isntead of KERNEL_VERSION to encode the bcm2048
driver version.

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/staging/media/bcm2048/radio-bcm2048.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
index 38f72d069e27..ffe9b63cbf59 100644
--- a/drivers/staging/media/bcm2048/radio-bcm2048.c
+++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
@@ -48,7 +48,7 @@
 /* driver definitions */
 #define BCM2048_DRIVER_AUTHOR	"Eero Nurkkala <ext-eero.nurkkala@nokia.com>"
 #define BCM2048_DRIVER_NAME	BCM2048_NAME
-#define BCM2048_DRIVER_VERSION	KERNEL_VERSION(0, 0, 1)
+#define BCM2048_DRIVER_VERSION	MEDIA_REVISION(0, 0, 1)
 #define BCM2048_DRIVER_CARD	"Broadcom bcm2048 FM Radio Receiver"
 #define BCM2048_DRIVER_DESC	"I2C driver for BCM2048 FM Radio Receiver"
 
-- 
2.12.3
