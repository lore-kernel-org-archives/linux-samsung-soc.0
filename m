From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 08/11] ARM: dts: exynos: Fix DTC unit name warnings in Peach
 Pit
Date: Wed, 06 Apr 2016 11:00:47 +0900
Message-ID: <1459908050-16430-8-git-send-email-k.kozlowski@samsung.com>
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

Fix following DTC warnings in Exynos5420 Peach Pit:

Warning (unit_address_vs_reg): Node /dp-controller@145B0000/ports/port@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@1 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's tag.
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 3981ddb25036..e36975b6f625 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -165,7 +165,7 @@
 	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 
 	ports {
-		port@0 {
+		port0 {
 			dp_out: endpoint {
 				remote-endpoint = <&bridge_in>;
 			};
@@ -633,13 +633,13 @@
 		use-external-pwm;
 
 		ports {
-			port@0 {
+			port0 {
 				bridge_out: endpoint {
 					remote-endpoint = <&panel_in>;
 				};
 			};
 
-			port@1 {
+			port1 {
 				bridge_in: endpoint {
 					remote-endpoint = <&dp_out>;
 				};
-- 
2.5.0
