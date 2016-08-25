From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: Set the clock rate for DREX block 800Mhz on
 exynos5422-odroidxu3
Date: Thu, 25 Aug 2016 15:57:18 +0900
Message-ID: <1472108238-24309-4-git-send-email-cw00.choi@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch sets the clock rate for DREX (DRAM Express) block
on exynos5422-odroidxu3 board. In the exynos5422 TRM,
DRAM clocks use BPLL clock and CMU_CDREX generates
the 800MHz DRAM clock.

[clk_summary on exynos5422-odroidxu3 board]
fout_bpll                             0            0   800000000          0 0
    mout_bpll                          0            0   800000000          0 0
       mout_mclk_cdrex                 0            0   800000000          0 0
          dout_pclk_core_mem           0            0   200000000          0 0
          dout_sclk_cdrex              0            0   800000000          0 0

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index d56253049ccb..fd3f67c72039 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -229,6 +229,11 @@
 	status = "okay";
 };
 
+&clock {
+	assigned-clocks = <&clock CLK_DOUT_SCLK_CDREX>;
+	assigned-clock-rates = <800000000>;
+};
+
 &clock_audss {
 	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
 			<&clock_audss EXYNOS_MOUT_I2S>,
-- 
1.9.1
