From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH] ARM: exynos: Select PINCTRL_EXYNOS for exynos5
Date: Wed,  8 May 2013 10:32:29 -0700
Message-ID: <1368034349-15091-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Doug Anderson <dianders@chromium.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

If you've got MACH_EXYNOS5_DT but not MACH_EXYNOS4_DT you'll be
missing the pincontrol definitions.  Add them for exynos5.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/mach-exynos/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 6e77432..cdcd7fa 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -428,6 +428,8 @@ config MACH_EXYNOS5_DT
 	depends on ARCH_EXYNOS5
 	select ARM_AMBA
 	select CLKSRC_OF
+	select PINCTRL
+	select PINCTRL_EXYNOS
 	select USB_ARCH_HAS_XHCI
 	select USE_OF
 	help
-- 
1.8.2.1
