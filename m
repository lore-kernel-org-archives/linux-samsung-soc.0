From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 4/9] ARM: multi_v7_defconfig: Enable support for missing ChromeOS EC drivers
Date: Thu, 14 May 2015 17:40:11 +0200
Message-ID: <1431618016-2087-5-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Enable the needed Kconfig options to have support for the ChromeOS EC
I2C transport, I2C tunnel and chardev user-space interface.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e81125364ae2..fcaa82448be3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -286,6 +286,7 @@ CONFIG_I2C_ST=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_XILINX=y
 CONFIG_I2C_RCAR=y
+CONFIG_I2C_CROS_EC_TUNNEL=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE=y
 CONFIG_SPI_DAVINCI=y
@@ -352,6 +353,7 @@ CONFIG_MFD_AS3722=y
 CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_AXP20X=y
 CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_I2C=m
 CONFIG_MFD_CROS_EC_SPI=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX8907=y
@@ -547,6 +549,8 @@ CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC_CHARDEV=m
 CONFIG_QCOM_GSBI=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_COMMON_CLK_MAX77686=y
-- 
2.1.4
