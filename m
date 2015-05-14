From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 7/9] ARM: multi_v7_defconfig: Enable options for Exynos display support
Date: Thu, 14 May 2015 17:40:14 +0200
Message-ID: <1431618016-2087-8-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Many Exynos devices have devices attached to their display ports.
This patch enables the needed Kconfig options to support different
configuration such as simple panel, embedded DisplayPort (eDP) to
LVDS bridges and HDMI displays.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f587f2214202..e89bd6999aa3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -402,6 +402,12 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_ADV7180=m
 CONFIG_DRM=y
+CONFIG_DRM_PTN3460=m
+CONFIG_DRM_PS8622=m
+CONFIG_DRM_EXYNOS=m
+CONFIG_DRM_EXYNOS_FIMD=y
+CONFIG_DRM_EXYNOS_DP=y
+CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_TEGRA=y
 CONFIG_DRM_PANEL_SIMPLE=y
@@ -411,6 +417,7 @@ CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FB_SIMPLE=y
 CONFIG_FB_SH_MOBILE_MERAM=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_PLATFORM=m
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
-- 
2.1.4
