From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Wed, 14 Sep 2011 16:31:52 +0530
Message-ID: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org>
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

ORIGEN board is fitted with 7" LCD panel HV070WSA. The pixel
resolution of the LCD panel is 1024x600.

Also power domain device for LCD0 is registered.

Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes for V2:
	* Added power domain device registration for LCD0

The patch is rebased on [1]. For proper working of LCD on ORIGEN,
following patches are needed. These patches are already submitted to
the mailing list.

a. ARM: EXYNOS4: Add PWM backlight support on Origen
	Author: Giridhar Maruthy
b. ARM: EXYNOS4: Configure MAX8997 PMIC for Origen
	Author: Inderpal Singh

[1] git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git (for-next)

 arch/arm/mach-exynos4/Kconfig       |    3 ++
 arch/arm/mach-exynos4/mach-origen.c |   53 +++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 48f18f7..4f28871 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -222,6 +222,9 @@ config MACH_ORIGEN
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
+	select S5P_DEV_FIMD0
+	select EXYNOS4_DEV_PD
+	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..ed04f63 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -14,16 +14,22 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/input.h>
+#include <linux/lcd.h>
+
+#include <video/platform_lcd.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/regs-fb-v4.h>
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
+#include <plat/pd.h>
+#include <plat/fb.h>
 
 #include <mach/map.h>
 
@@ -79,10 +85,55 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
+static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, unsigned int power)
+{
+	int gpio = EXYNOS4_GPE3(4);
+
+	gpio_request(gpio, "GPE3_4");
+	gpio_direction_output(gpio, power);
+	gpio_free(gpio);
+}
+
+static struct plat_lcd_data origen_lcd_hv070wsa_data = {
+	.set_power = lcd_hv070wsa_set_power,
+};
+
+static struct platform_device origen_lcd_hv070wsa = {
+	.name			= "platform-lcd",
+	.dev.parent		= &s5p_device_fimd0.dev,
+	.dev.platform_data	= &origen_lcd_hv070wsa_data,
+};
+
+static struct s3c_fb_pd_win origen_fb_win0 = {
+	.win_mode = {
+		.left_margin	= 64,
+		.right_margin	= 16,
+		.upper_margin	= 64,
+		.lower_margin	= 16,
+		.hsync_len	= 48,
+		.vsync_len	= 3,
+		.xres		= 1024,
+		.yres		= 600,
+		.refresh	= 60,
+	},
+	.max_bpp		= 32,
+	.default_bpp		= 24,
+};
+
+static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
+	.win[0]		= &origen_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
+};
+
 static struct platform_device *origen_devices[] __initdata = {
+	&exynos4_device_pd[PD_LCD0],
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_fimd0,
+	&origen_lcd_hv070wsa,
 };
 
 static void __init origen_map_io(void)
@@ -95,7 +146,9 @@ static void __init origen_map_io(void)
 static void __init origen_machine_init(void)
 {
 	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
+	s5p_fimd0_set_platdata(&origen_lcd_pdata);
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
+	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 }
 
 MACHINE_START(ORIGEN, "ORIGEN")
-- 
1.7.4.1
