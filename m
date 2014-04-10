From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 21/27] ARM: dts: exynos3250: Add PMU dt data
Date: Thu, 10 Apr 2014 19:06:11 +0900
Message-ID: <1397124377-16969-13-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Hyunhee Kim <hyunhee.kim@samsung.com>

ARM CPU has its own PMU (Performance Monitoring Unit). This patch add PMU dt
data to support PMU for CPU. Exynos3250 has four PMU interrupts.

Signed-off-by: Hyunhee Kim <hyunhee.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index ceed761..2f0ca32 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -280,4 +280,9 @@
 		pinctrl-0 = <&i2c7_bus>;
 		status = "disabled";
 	};
+
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <0 18 0>, <0 19 0>, <0 20 0>, <0 21 0>;
+	};
 };
-- 
1.8.0
