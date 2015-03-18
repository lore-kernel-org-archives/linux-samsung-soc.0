From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v7 6/9] arm64: dts: exynos: Add ADMA dt node for Exynos5433 SoC
Date: Wed, 18 Mar 2015 09:17:33 +0900
Message-ID: <1426637856-3730-7-git-send-email-cw00.choi@samsung.com>
References: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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
index 0e0e9c9..1155205 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -426,6 +426,17 @@
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
