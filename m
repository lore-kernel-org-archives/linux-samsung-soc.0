From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 03/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos4
Date: Wed, 06 Apr 2016 11:00:42 +0900
Message-ID: <1459908050-16430-3-git-send-email-k.kozlowski@samsung.com>
References: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in all Exynos4 boards:

Warning (unit_address_vs_reg): Node /soc/video-phy@10020710 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's tag.
---
 arch/arm/boot/dts/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 000d506c027b..021f52d43ff7 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -82,7 +82,7 @@
 		reg = <0x12570000 0x14>;
 	};
 
-	mipi_phy: video-phy@10020710 {
+	mipi_phy: video-phy {
 		compatible = "samsung,s5pv210-mipi-video-phy";
 		#phy-cells = <1>;
 		syscon = <&pmu_system_controller>;
-- 
2.5.0
