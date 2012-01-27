From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] serial: samsung: Add support serial for EXYNOS4212 and
 EXYNOS4412
Date: Fri, 27 Jan 2012 10:45:51 +0900
Message-ID: <017001ccdc95$6698f5c0$33cae140$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Greg KH' <gregkh@suse.de>
List-Id: linux-samsung-soc@vger.kernel.org


This should be added for EXYNOS4212 and EXYNOS4412 SoCs.

Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: stable@kerne.org
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/tty/serial/samsung.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index f96f37b..ce632da 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1593,7 +1593,8 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #define S5PV210_SERIAL_DRV_DATA	(kernel_ulong_t)NULL
 #endif
 
-#ifdef CONFIG_CPU_EXYNOS4210
+#if defined(CONFIG_CPU_EXYNOS4210) || defined(CONFIG_SOC_EXYNOS4212) || \
+	defined(CONFIG_CPU_EXYNOS4412)
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
 	.info = &(struct s3c24xx_uart_info) {
 		.name		= "Samsung Exynos4 UART",
-- 
1.7.1
