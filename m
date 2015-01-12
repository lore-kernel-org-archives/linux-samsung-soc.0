From: Anand Moon <moon.linux@yahoo.com>
Subject: [PATCH v3] ARM: exynos_defconfig Enable CONFIG_LOCKUP_DETECTOR.
Date: Tue, 13 Jan 2015 00:20:14 +0530
Message-ID: <1421088614-4662-1-git-send-email-moon.linux@yahoo.com>
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
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Anand Moon <moon.linux@yahoo.com>, Vivek Gautam <gautam.vivek@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On enabling CONFIG_LOCKUP_DETECTOR the kernel to act as a watchdog
to detect hard and soft lockups. Enabling CONFIG_LOCKUP_DETECTOR
don't introduce much overhead on exyons SOC.

CONFIG_LOCKUP_DETECTOR is enabled on multi_v7_defconfig.

Changes since v3:
 * Made commit message more clear
 * Corrected difference between CONFIG_LOCKUP_DETECTOR and CONFIG_LOCKDEP.

Tested on Exynos5422 ODROID XU3 board.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Anand Moon <moon.linux@yahoo.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 5ef14de..64b2fe9 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -182,6 +182,7 @@ CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
+CONFIG_LOCKUP_DETECTOR=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_USER=y
 CONFIG_CRYPTO_SHA256=y
-- 
2.1.0
