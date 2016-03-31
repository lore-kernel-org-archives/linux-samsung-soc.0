From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v4 9/9] ARM: dts: Add MSHC2 dt node for SD card for
 exynos3250-artik5-eval board
Date: Thu, 31 Mar 2016 11:48:05 +0900
Message-ID: <1459392485-11327-10-git-send-email-cw00.choi@samsung.com>
References: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaehoon Chung <jh80.chung@samsung.com>

This patch adds MSHC (Mobile Storage Host Controller) dt node for
Exynos3250 SoC. MSHC is an interface between the system and the SD card

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5-eval.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
index b476154590a5..be4d6aa379f3 100644
--- a/arch/arm/boot/dts/exynos3250-artik5-eval.dts
+++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
@@ -21,6 +21,23 @@
 			"samsung,exynos3250", "samsung,exynos3";
 };
 
+&mshc_2 {
+	num-slots = <1>;
+	cap-sd-highspeed;
+	disable-wp;
+	vqmmc-supply = <&ldo3_reg>;
+	card-detect-delay = <200>;
+	clock-frequency = <100000000>;
+	clock-freq-min-max = <400000 100000000>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_cmd &sd2_clk &sd2_cd &sd2_bus1 &sd2_bus4>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &serial_2 {
 	status = "okay";
 };
-- 
1.9.1
