From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/3] ARM: dts: Remove duplicate 'interrput-parent' property for
 Exynos3250
Date: Tue, 29 Jul 2014 11:17:11 +0900
Message-ID: <1406600232-31033-3-git-send-email-cw00.choi@samsung.com>
References: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, t.figa@samsung.com, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch removes duplicat 'interrupt-parent' property for Exynos3250
because exynos3250.dtsi already defined 'interrupt-parent' property
as following:

In arch/arm/boot/dts/exynos3250.dtsi:

	compatible = "samsung,exynos3250";
	interrupt-parent = <&gic>;

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 41a260a..5043178 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -204,7 +204,6 @@
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos4210-wakeup-eint";
-				interrupt-parent = <&gic>;
 				interrupts = <0 48 0>;
 			};
 		};
@@ -243,7 +242,6 @@
 			compatible = "arm,amba-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			interrupt-parent = <&gic>;
 			ranges;
 
 			pdma0: pdma@12680000 {
-- 
1.8.0
