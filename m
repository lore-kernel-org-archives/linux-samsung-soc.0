From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v4 1/8] arm64: exynos5433: Enable ARMv8 based Exynos5433 (SoC)
 support
Date: Tue, 24 Feb 2015 14:16:44 +0900
Message-ID: <1424755011-15999-2-git-send-email-cw00.choi@samsung.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, jh80.chung@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, cw00.choi@samsung.com, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, a.kesavan@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, devicetree@vger.kernel.org, olof@lixom.net, chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the necessary Kconfig entries to enable
support for the ARMv8 based Exynos5433 SoC.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1b8e973..d83cea0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -154,6 +154,17 @@ config ARCH_EXYNOS
 	help
 	  This enables support for Samsung Exynos SoC family
 
+config ARCH_EXYNOS5433
+	bool "ARMv8 based Samsung Exynos5433"
+	select ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+	select HAVE_S3C_RTC if RTC_CLASS
+	select PINCTRL
+	select PINCTRL_EXYNOS
+
+	help
+	  This enables support for Samsung Exynos5433 SoC family
+
 config ARCH_EXYNOS7
 	bool "ARMv8 based Samsung Exynos7"
 	select ARCH_EXYNOS
-- 
1.8.5.5
