From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Make MAX77802 regulator driver
 built-in
Date: Fri, 30 Aug 2019 15:04:16 +0200
Message-ID: <20190830130416.10420-1-m.szyprowski@samsung.com>
References: <CGME20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Maxim 77802 PMIC is a main PMIC for the following Exynos5 based boards:
Odroid XU, Chromebook Pit and Chromebook Pi. Driver for its voltage
regulator is needed very early during boot to properly instantiate SD/MMC
devices and mount rootfs, so change that driver to be compiled-in.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 64aa1136d43c..3dc636c3c5c7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -562,7 +562,7 @@ CONFIG_REGULATOR_MAX8997=m
 CONFIG_REGULATOR_MAX8998=m
 CONFIG_REGULATOR_MAX77686=y
 CONFIG_REGULATOR_MAX77693=m
-CONFIG_REGULATOR_MAX77802=m
+CONFIG_REGULATOR_MAX77802=y
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_PBIAS=y
 CONFIG_REGULATOR_PWM=y
-- 
2.17.1
