From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v4 7/8] arm64: dts: exynos: Add ADMA dt node for Exynos5433 SoC
Date: Tue, 24 Feb 2015 14:16:50 +0900
Message-ID: <1424755011-15999-8-git-send-email-cw00.choi@samsung.com>
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

From: Inha Song <ideal.song@samsung.com>

This patch adds ADMA (Advanced DMA) device tree node for Exynos5433 SoC.
In Exynos5433 SoC, ADMA is used for I2S audio interface.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Inha Song <ideal.song@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 1c68d9e..6becaca 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -462,6 +462,17 @@
 				#dma-channels = <8>;
 				#dma-requests = <32>;
 			};
+
+			adma: adma@11420000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x11420000 0x1000>;
+				interrupts = <0 73 0>;
+				clocks = <&cmu_aud CLK_ACLK_DMAC>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
 		};
 
 		serial_0: serial@14c10000 {
-- 
1.8.5.5
