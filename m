From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3] ARM: exynos: Select PINCTRL_EXYNOS for exynos4/5 at chip
 level
Date: Thu,  9 May 2013 11:12:50 -0700
Message-ID: <1368123170-22906-1-git-send-email-dianders@chromium.org>
References: <1368039168-24447-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1368039168-24447-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Simon Glass <sjg@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Previously if you had MACH_EXYNOS5_DT but not MACH_EXYNOS4_DT you'd be
missing the pincontrol definitions.  Move PINCTRL selects to the arch
level since we should be enabling the code for all exynos variants.

Update the PINCTRL descriptions to indicate that PINCTRL_EXYNOS is not
for exynos5440.  Also add basic dependencies for the PINCTRL_EXYNOS
kernel config.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
Changes in v3:
- Moved to chip level as per Tomasz.
- Update PINCTRL Kconfig for exynos.

Changes in v2:
- Moved to the arch level as suggested by Olof.

 arch/arm/mach-exynos/Kconfig | 9 ++++++---
 drivers/pinctrl/Kconfig      | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 6e77432..4139d7f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -17,6 +17,7 @@ config ARCH_EXYNOS4
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
+	select PINCTRL
 	help
 	  Samsung EXYNOS4 SoCs based systems
 
@@ -24,6 +25,7 @@ config ARCH_EXYNOS5
 	bool "SAMSUNG EXYNOS5"
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
+	select PINCTRL
 	help
 	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
 
@@ -34,6 +36,7 @@ config CPU_EXYNOS4210
 	default y
 	depends on ARCH_EXYNOS4
 	select ARM_CPU_SUSPEND if PM
+	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
@@ -45,6 +48,7 @@ config SOC_EXYNOS4212
 	bool "SAMSUNG EXYNOS4212"
 	default y
 	depends on ARCH_EXYNOS4
+	select PINCTRL_EXYNOS
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
@@ -55,6 +59,7 @@ config SOC_EXYNOS4412
 	bool "SAMSUNG EXYNOS4412"
 	default y
 	depends on ARCH_EXYNOS4
+	select PINCTRL_EXYNOS
 	select SAMSUNG_DMADEV
 	help
 	  Enable EXYNOS4412 SoC support
@@ -63,6 +68,7 @@ config SOC_EXYNOS5250
 	bool "SAMSUNG EXYNOS5250"
 	default y
 	depends on ARCH_EXYNOS5
+	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
@@ -78,7 +84,6 @@ config SOC_EXYNOS5440
 	select ARCH_HAS_OPP
 	select ARM_ARCH_TIMER
 	select AUTO_ZRELADDR
-	select PINCTRL
 	select PINCTRL_EXYNOS5440
 	select PM_OPP
 	help
@@ -412,8 +417,6 @@ config MACH_EXYNOS4_DT
 	select CLKSRC_OF
 	select CPU_EXYNOS4210
 	select KEYBOARD_SAMSUNG if INPUT_KEYBOARD
-	select PINCTRL
-	select PINCTRL_EXYNOS
 	select S5P_DEV_MFC
 	select USE_OF
 	help
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8f66924..a1c6dd3 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -207,12 +207,13 @@ config PINCTRL_SAMSUNG
 	select PINCONF
 
 config PINCTRL_EXYNOS
-	bool "Pinctrl driver data for Samsung EXYNOS SoCs"
-	depends on OF && GPIOLIB
+	bool "Pinctrl driver data for Samsung EXYNOS SoCs other than 5440"
+	depends on OF && GPIOLIB && ARCH_EXYNOS
 	select PINCTRL_SAMSUNG
 
 config PINCTRL_EXYNOS5440
 	bool "Samsung EXYNOS5440 SoC pinctrl driver"
+	depends on SOC_EXYNOS5440
 	select PINMUX
 	select PINCONF
 
-- 
1.8.2.1
