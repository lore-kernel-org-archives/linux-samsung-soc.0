From: Anand Moon <moon.linux@yahoo.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable CONFIG_LOCKUP_DETECTOR
Date: Wed,  7 Jan 2015 17:45:32 +0530
Message-ID: <1420632932-6964-1-git-send-email-moon.linux@yahoo.com>
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
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Vivek Gautam <gautam.vivek@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: Anand Moon <moon.linux@yahoo.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

ARM Enable CONFIG_LOCKUP_DETECTOR to validation of kernel locks

v2 Fixed the commit log
This config item helps getting some useful information when lockup
happens. If you want to validate locks then probably you want
PROVE_LOCKING... but its overhead is larger.

Anyway the overhead of LOCKUP_DETECTOR is small and multi_v7_defconfig
has it enabled so I guess exynos may do it as well.

Tested on Exynos5422 ODROID XU3 board.

Signed-off-by: Anand Moon <moon.linux@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 5ef14de..ecd9987 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -178,6 +178,7 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
+CONFIG_LOCKUP_DETECTOR=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_SPINLOCK=y
-- 
2.1.0
