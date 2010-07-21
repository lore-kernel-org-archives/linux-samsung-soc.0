From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/5] ARM: S5PC100: Add RTC support for S5PC100
Date: Wed, 21 Jul 2010 18:00:13 +0900
Message-ID: <1279702814-14929-5-git-send-email-kgene.kim@samsung.com>
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

This patch adds support RTC driver for Samsung S5PC100.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig            |    2 ++
 arch/arm/mach-s5pc100/include/mach/map.h |    3 +++
 arch/arm/mach-s5pc100/mach-smdkc100.c    |    1 +
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index b2a11df..2602895 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -44,9 +44,11 @@ config MACH_SMDKC100
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
+	select S3C_DEV_RTC
 	select S5PC100_SETUP_FB_24BPP
 	select S5PC100_SETUP_I2C1
 	select S5PC100_SETUP_SDHCI
+	select HAVE_S3C_RTC
 	help
 	  Machine support for the Samsung SMDKC100
 
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index cadae43..1834b2c 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -72,6 +72,8 @@
 
 #define S5PC100_PA_SYSTIMER	(0xEA100000)
 
+#define S5PC100_PA_RTC		(0xEA300000)
+
 #define S5PC100_PA_UART		(0xEC000000)
 
 #define S5P_PA_UART0		(S5PC100_PA_UART + 0x0)
@@ -134,5 +136,6 @@
 #define S3C_PA_ONENAND		S5PC100_PA_ONENAND
 #define S3C_PA_ONENAND_BUF	S5PC100_PA_ONENAND_BUF
 #define S3C_SZ_ONENAND_BUF	S5PC100_SZ_ONENAND_BUF
+#define S3C_PA_RTC		S5PC100_PA_RTC
 
 #endif /* __ASM_ARCH_C100_MAP_H */
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index af22f82..09785e3 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -159,6 +159,7 @@ static struct platform_device *smdkc100_devices[] __initdata = {
 	&smdkc100_lcd_powerdev,
 	&s5pc100_device_iis0,
 	&s5pc100_device_ac97,
+	&s3c_device_rtc,
 };
 
 static void __init smdkc100_map_io(void)
-- 
1.6.2.5
