From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 3/5] ARM: dts: add fimd device node to exynos3250.dsti
Date: Mon, 18 Aug 2014 17:21:31 +0900
Message-ID: <1408350093-26220-4-git-send-email-inki.dae@samsung.com>
References: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, a.hajda@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 1d52de6..0ec2584 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -216,6 +216,18 @@
 			interrupts = <0 240 0>;
 		};
 
+		fimd: fimd@11c00000 {
+			compatible = "samsung,exynos3250-fimd";
+			reg = <0x11c00000 0x30000>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+			interrupts = <0 84 0>, <0 85 0>, <0 86 0>;
+			clocks = <&cmu CLK_SCLK_FIMD0>, <&cmu CLK_FIMD0>;
+			clock-names = "sclk_fimd", "fimd";
+			samsung,power-domain = <&pd_lcd0>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
 		mshc_0: mshc@12510000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12510000 0x1000>;
-- 
1.7.9.5
