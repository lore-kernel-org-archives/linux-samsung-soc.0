From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/7] soc: smasung: pmu: Add register defines for pad
 retention control
Date: Mon, 30 Jan 2017 13:38:22 +0100
Message-ID: <1485779908-32147-2-git-send-email-m.szyprowski@samsung.com>
References: <1485779908-32147-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170130123837eucas1p1056a57f23b1e3bf089e5bc55bb2cf2d4@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1485779908-32147-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add PMU defines related to pad retention control. Will be later used
by the Exynos pin controller driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9786c62d7159..49df0a01a2cc 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -631,4 +631,20 @@
 					 | EXYNOS5420_KFC_USE_STANDBY_WFI2  \
 					 | EXYNOS5420_KFC_USE_STANDBY_WFI3)
 
+/* For EXYNOS5433 */
+#define EXYNOS5433_PAD_RETENTION_AUD_OPTION			(0x3028)
+#define EXYNOS5433_PAD_RETENTION_MMC2_OPTION			(0x30C8)
+#define EXYNOS5433_PAD_RETENTION_TOP_OPTION			(0x3108)
+#define EXYNOS5433_PAD_RETENTION_UART_OPTION			(0x3128)
+#define EXYNOS5433_PAD_RETENTION_MMC0_OPTION			(0x3148)
+#define EXYNOS5433_PAD_RETENTION_MMC1_OPTION			(0x3168)
+#define EXYNOS5433_PAD_RETENTION_EBIA_OPTION			(0x3188)
+#define EXYNOS5433_PAD_RETENTION_EBIB_OPTION			(0x31A8)
+#define EXYNOS5433_PAD_RETENTION_SPI_OPTION			(0x31C8)
+#define EXYNOS5433_PAD_RETENTION_MIF_OPTION			(0x31E8)
+#define EXYNOS5433_PAD_RETENTION_USBXTI_OPTION			(0x3228)
+#define EXYNOS5433_PAD_RETENTION_BOOTLDO_OPTION			(0x3248)
+#define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
+#define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
1.9.1
