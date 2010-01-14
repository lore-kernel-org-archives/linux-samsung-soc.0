From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/21] drivers: serial: S5PC100 serial driver cleanup
Date: Thu, 14 Jan 2010 12:29:19 +0100
Message-ID: <1263468579-5732-2-git-send-email-m.szyprowski@samsung.com>
References: <1263468579-5732-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1263468579-5732-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Remove unnecessary Kconfig entry.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/serial/Kconfig  |   15 ++++-----------
 drivers/serial/Makefile |    1 -
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
index 9ff47db..b8158a5 100644
--- a/drivers/serial/Kconfig
+++ b/drivers/serial/Kconfig
@@ -526,19 +526,12 @@ config SERIAL_S3C24A0
 	  Serial port support for the Samsung S3C24A0 SoC
 
 config SERIAL_S3C6400
-	tristate "Samsung S3C6400/S3C6410 Serial port support"
-	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410)
+	tristate "Samsung S3C6400/S3C6410/S5PC100 Serial port support"
+	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410 || CPU_S5PC100)
 	default y
 	help
-	  Serial port support for the Samsung S3C6400 and S3C6410
-	  SoCs
-
-config SERIAL_S5PC100
-	tristate "Samsung S5PC100 Serial port support"
-	depends on SERIAL_SAMSUNG && CPU_S5PC100
-	default y
-	help
-	  Serial port support for the Samsung S5PC100 SoCs
+	  Serial port support for the Samsung S3C6400, S3C6410 and
+	  S5PC100 SoCs
 
 config SERIAL_MAX3100
 	tristate "MAX3100 support"
diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
index 5548fe7..ce8c17f 100644
--- a/drivers/serial/Makefile
+++ b/drivers/serial/Makefile
@@ -44,7 +44,6 @@ obj-$(CONFIG_SERIAL_S3C2412) += s3c2412.o
 obj-$(CONFIG_SERIAL_S3C2440) += s3c2440.o
 obj-$(CONFIG_SERIAL_S3C24A0) += s3c24a0.o
 obj-$(CONFIG_SERIAL_S3C6400) += s3c6400.o
-obj-$(CONFIG_SERIAL_S5PC100) += s3c6400.o
 obj-$(CONFIG_SERIAL_MAX3100) += max3100.o
 obj-$(CONFIG_SERIAL_IP22_ZILOG) += ip22zilog.o
 obj-$(CONFIG_SERIAL_MUX) += mux.o
-- 
1.6.4
