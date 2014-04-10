From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 25/27] ARM: dts: exynos3250: Add RTC dt node
Date: Thu, 10 Apr 2014 19:06:15 +0900
Message-ID: <1397124377-16969-17-git-send-email-cw00.choi@samsung.com>
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

From: Tomasz Figa <t.figa@samsung.com>

This patch add rtc dt node for Real Time Clock (RTC) which operates with
a backup battery when the system is off and performs the function of an alarm.

Exynos3250's RTC has following rtc interrupt
- ALARM_INT (alarm interrupt)
- ALAREM_WK (alarm wake-up)

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index c8bd33cf..a61940f 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -88,6 +88,13 @@
 		#clock-cells = <1>;
 	};
 
+	rtc@10070000 {
+		compatible = "samsung,s3c6410-rtc";
+		reg = <0x10070000 0x100>;
+		interrupts = <0 73 0>, <0 74 0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@10481000 {
 		compatible = "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
-- 
1.8.0
