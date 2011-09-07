From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: EXYNOS4: Add HDMI support for Origen
Date: Wed,  7 Sep 2011 16:24:38 +0530
Message-ID: <1315392878-4267-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds HDMI (TVout) support for Origen board.

This patch is based on for-next branch of Kukjin Kim's tree: 
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=summary

This patch is tested using Hatim's patch: 
http://www.spinics.net/lists/linux-samsung-soc/msg06367.html

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-exynos4/Kconfig       |    2 ++
 arch/arm/mach-exynos4/mach-origen.c |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 181fb04..4f908f7 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -225,6 +225,8 @@ config MACH_ORIGEN
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
 	select EXYNOS4_SETUP_SDHCI
+	select S5P_DEV_I2C_HDMIPHY
+	select S5P_DEV_TV
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
 
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..6ec68ee 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -81,8 +81,11 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 
 static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
+	&s5p_device_i2c_hdmiphy,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
 };
 
 static void __init origen_map_io(void)
@@ -95,6 +98,7 @@ static void __init origen_map_io(void)
 static void __init origen_machine_init(void)
 {
 	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
+	s5p_i2c_hdmiphy_set_platdata(NULL);
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 }
 
-- 
1.7.4.1
