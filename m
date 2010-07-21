From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/5] rtc: rtc-s3c: Add extra option to include RTC for Samsung
	SoCs
Date: Wed, 21 Jul 2010 18:00:11 +0900
Message-ID: <1279702814-14929-3-git-send-email-kgene.kim@samsung.com>
References: <1279702814-14929-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1279702814-14929-1-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: p_gortmaker@yahoo.com, Kukjin Kim <kgene.kim@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it
List-Id: linux-samsung-soc@vger.kernel.org

From: Atul Dahiya <atul.dahiya@samsung.com>

This patch adds HAVE_S3C_RTC to control inclusion of RTC driver for Samsung
SoCs. This option will help to include the driver only for the necessary
machines and not for any given arch.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/rtc/Kconfig |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 10ba12c..c43732f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -645,9 +645,16 @@ config RTC_DRV_OMAP
 	  DA8xx/OMAP-L13x chips.  This driver can also be built as a
 	  module called rtc-omap.
 
+config HAVE_S3C_RTC
+	bool
+	help
+	  This will include RTC support for Samsung SoCs. If
+	  you want to include RTC support for any machine, kindly
+	  select this in the respective mach-XXXX/Kconfig file.
+
 config RTC_DRV_S3C
 	tristate "Samsung S3C series SoC RTC"
-	depends on ARCH_S3C2410 || ARCH_S3C64XX
+	depends on ARCH_S3C2410 || ARCH_S3C64XX || HAVE_S3C_RTC
 	help
 	  RTC (Realtime Clock) driver for the clock inbuilt into the
 	  Samsung S3C24XX series of SoCs. This can provide periodic
-- 
1.6.2.5
