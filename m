From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 09/10] ARM: exynos_defconfig: Remove MAX77802 RTC Kconfig symbol
Date: Wed, 27 Jan 2016 00:36:45 -0300
Message-ID: <1453865806-4661-10-git-send-email-javier@osg.samsung.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The driver has been removed so the Kconfig symbol is not valid anymore.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Add Krzysztof Kozlowski's Reviewed-by tag to patch #9.

 arch/arm/configs/exynos_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 24dcd2bb1215..cdbe6dbc6e75 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -193,7 +193,6 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX8997=y
 CONFIG_RTC_DRV_MAX77686=y
-CONFIG_RTC_DRV_MAX77802=y
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_DMADEVICES=y
-- 
2.5.0
