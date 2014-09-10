From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 3/7] ARM: dts: add hdmi regulators for exynos5420 based
 peach-pit board
Date: Wed, 10 Sep 2014 12:19:47 +0200
Message-ID: <1410344391-5675-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Olof Johansson <olof@lixom.net>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Rahul Sharma <rahul.sharma@samsung.com>

Adding regulators for hdmi for peach-pit board.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 304e3bd..88f1620 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -143,6 +143,11 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
 	ddc = <&i2c_2>;
+
+	hdmi-en-supply = <&tps65090_fet7>;
+	vdd-supply = <&ldo8_reg>;
+	vdd_osc-supply = <&ldo10_reg>;
+	vdd_pll-supply = <&ldo8_reg>;
 };
 
 &hsi2c_4 {
-- 
2.1.0
