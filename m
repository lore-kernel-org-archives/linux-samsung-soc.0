From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 5/9] ARM: multi_v7_defconfig: Enable Samsung PWM support
Date: Thu, 14 May 2015 17:40:12 +0200
Message-ID: <1431618016-2087-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Build the Generic PWM Samsung driver as a module to support PWM
devices used in platforms with a Samsung SoC.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index fcaa82448be3..bc7da5659e5d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -570,6 +570,7 @@ CONFIG_XILINX_XADC=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_PWM_SAMSUNG=m
 CONFIG_PWM_TEGRA=y
 CONFIG_PWM_VT8500=y
 CONFIG_PHY_HIX5HD2_SATA=y
-- 
2.1.4
