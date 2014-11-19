From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/4] ARM: exynos_defconfig: Enable LM90 driver
Date: Wed, 19 Nov 2014 16:56:23 +0100
Message-ID: <1416412585-10809-4-git-send-email-afaerber@suse.de>
References: <1416412585-10809-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416412585-10809-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

multi_v7_defconfig has it as Y already, so build it in here, too, for
consistency, and therefore build in HWMON as well.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/configs/exynos_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exyno=
s_defconfig
index 8dfa7d312f51..2d7d2027aeb9 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -84,7 +84,8 @@ CONFIG_DEBUG_GPIO=3Dy
 CONFIG_POWER_SUPPLY=3Dy
 CONFIG_BATTERY_SBS=3Dy
 CONFIG_CHARGER_TPS65090=3Dy
-# CONFIG_HWMON is not set
+CONFIG_HWMON=3Dy
+CONFIG_SENSORS_LM90=3Dy
 CONFIG_THERMAL=3Dy
 CONFIG_EXYNOS_THERMAL=3Dy
 CONFIG_EXYNOS_THERMAL_CORE=3Dy
--=20
2.1.2
