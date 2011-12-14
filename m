From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 2/4] ARM: EXYNOS4: Add clock register addresses for
 Exynos4x12 bus devfreq driver
Date: Wed, 14 Dec 2011 20:28:43 +0900
Message-ID: <1323862125-10699-3-git-send-email-myungjoo.ham@samsung.com>
References: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, Jongpill Lee <boyko.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos4212/4412 memory bus devfreq driver requires some register
addresses that were not defined with Exynos4210 support.
This patch adds the required register addresses and shift/mask data.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |   42 ++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h b/arch/arm/mach-exynos/include/mach/regs-clock.h
index 6c37ebe..2003251 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -77,6 +77,7 @@
 #define S5P_CLKDIV2_RATIO		S5P_CLKREG(0x0C580)
 
 #define S5P_CLKDIV_STAT_TOP		S5P_CLKREG(0x0C610)
+#define S5P_CLKDIV_STAT_MFC		S5P_CLKREG(0x0C628)
 
 #define S5P_CLKGATE_SCLKCAM		S5P_CLKREG(0x0C820)
 #define S5P_CLKGATE_IP_CAM		S5P_CLKREG(0x0C920)
@@ -104,8 +105,12 @@
 #define S5P_CLKDIV_DMC0			S5P_CLKREG(0x10500)
 #define S5P_CLKDIV_DMC1			S5P_CLKREG(0x10504)
 #define S5P_CLKDIV_STAT_DMC0		S5P_CLKREG(0x10600)
+#define S5P_CLKDIV_STAT_DMC1		S5P_CLKREG(0x10604)
 #define S5P_CLKGATE_IP_DMC		S5P_CLKREG(0x10900)
 
+#define S5P_DMC_PAUSE_CTRL		S5P_CLKREG(0x11094)
+#define DMC_PAUSE_ENABLE		(1 << 0)
+
 #define S5P_APLL_LOCK			S5P_CLKREG(0x14000)
 #define S5P_MPLL_LOCK			(soc_is_exynos4210() ? \
 					S5P_CLKREG(0x14004) :  \
@@ -178,6 +183,22 @@
 #define S5P_CLKDIV_DMC0_CORETI_SHIFT	(28)
 #define S5P_CLKDIV_DMC0_CORETI_MASK	(0x7 << S5P_CLKDIV_DMC0_CORETI_SHIFT)
 
+#define S5P_CLKDIV_DMC1_G2D_ACP_SHIFT	(0)
+#define S5P_CLKDIV_DMC1_G2D_ACP_MASK	(0xf << S5P_CLKDIV_DMC1_G2D_ACP_SHIFT)
+#define S5P_CLKDIV_DMC1_C2C_SHIFT	(4)
+#define S5P_CLKDIV_DMC1_C2C_MASK	(0x7 << S5P_CLKDIV_DMC1_C2C_SHIFT)
+#define S5P_CLKDIV_DMC1_PWI_SHIFT	(8)
+#define S5P_CLKDIV_DMC1_PWI_MASK	(0xf << S5P_CLKDIV_DMC1_PWI_SHIFT)
+#define S5P_CLKDIV_DMC1_C2CACLK_SHIFT	(12)
+#define S5P_CLKDIV_DMC1_C2CACLK_MASK	(0x7 << S5P_CLKDIV_DMC1_C2CACLK_SHIFT)
+#define S5P_CLKDIV_DMC1_DVSEM_SHIFT	(16)
+#define S5P_CLKDIV_DMC1_DVSEM_MASK	(0x7f << S5P_CLKDIV_DMC1_DVSEM_SHIFT)
+#define S5P_CLKDIV_DMC1_DPM_SHIFT	(24)
+#define S5P_CLKDIV_DMC1_DPM_MASK	(0x7f << S5P_CLKDIV_DMC1_DPM_SHIFT)
+
+#define S5P_CLKDIV_MFC_SHIFT		(0)
+#define S5P_CLKDIV_MFC_MASK		(0x7 << S5P_CLKDIV_MFC_SHIFT)
+
 #define S5P_CLKDIV_TOP_ACLK200_SHIFT	(0)
 #define S5P_CLKDIV_TOP_ACLK200_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK200_SHIFT)
 #define S5P_CLKDIV_TOP_ACLK100_SHIFT	(4)
@@ -188,12 +209,25 @@
 #define S5P_CLKDIV_TOP_ACLK133_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK133_SHIFT)
 #define S5P_CLKDIV_TOP_ONENAND_SHIFT	(16)
 #define S5P_CLKDIV_TOP_ONENAND_MASK	(0x7 << S5P_CLKDIV_TOP_ONENAND_SHIFT)
+#define S5P_CLKDIV_TOP_ACLK266_GPS_SHIFT	(20)
+#define S5P_CLKDIV_TOP_ACLK266_GPS_MASK		(0x7 << S5P_CLKDIV_TOP_ACLK266_GPS_SHIFT)
+#define S5P_CLKDIV_TOP_ACLK400_MCUISP_SHIFT	(24)
+#define S5P_CLKDIV_TOP_ACLK400_MCUISP_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK400_MCUISP_SHIFT)
 
 #define S5P_CLKDIV_BUS_GDLR_SHIFT	(0)
 #define S5P_CLKDIV_BUS_GDLR_MASK	(0x7 << S5P_CLKDIV_BUS_GDLR_SHIFT)
 #define S5P_CLKDIV_BUS_GPLR_SHIFT	(4)
 #define S5P_CLKDIV_BUS_GPLR_MASK	(0x7 << S5P_CLKDIV_BUS_GPLR_SHIFT)
 
+#define S5P_CLKDIV_CAM_FIMC0_SHIFT	(0)
+#define S5P_CLKDIV_CAM_FIMC0_MASK	(0xf << S5P_CLKDIV_CAM_FIMC0_SHIFT)
+#define S5P_CLKDIV_CAM_FIMC1_SHIFT	(4)
+#define S5P_CLKDIV_CAM_FIMC1_MASK	(0xf << S5P_CLKDIV_CAM_FIMC1_SHIFT)
+#define S5P_CLKDIV_CAM_FIMC2_SHIFT	(8)
+#define S5P_CLKDIV_CAM_FIMC2_MASK	(0xf << S5P_CLKDIV_CAM_FIMC2_SHIFT)
+#define S5P_CLKDIV_CAM_FIMC3_SHIFT	(12)
+#define S5P_CLKDIV_CAM_FIMC3_MASK	(0xf << S5P_CLKDIV_CAM_FIMC3_SHIFT)
+
 /* Only for EXYNOS4210 */
 
 #define S5P_CLKSRC_LCD1			S5P_CLKREG(0x0C238)
@@ -201,6 +235,14 @@
 #define S5P_CLKDIV_LCD1			S5P_CLKREG(0x0C538)
 #define S5P_CLKGATE_IP_LCD1		S5P_CLKREG(0x0C938)
 
+/* Only for EXYNOS4212 */
+#define S5P_CLKDIV_CAM1			S5P_CLKREG(0x0C568)
+
+#define S5P_CLKDIV_STAT_CAM1		S5P_CLKREG(0x0C668)
+
+#define S5P_CLKDIV_CAM1_JPEG_SHIFT	(0)
+#define S5P_CLKDIV_CAM1_JPEG_MASK	(0xf << S5P_CLKDIV_CAM1_JPEG_SHIFT)
+
 /* Compatibility defines and inclusion */
 
 #include <mach/regs-pmu.h>
-- 
1.7.4.1
