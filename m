From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 2/5] ARM: dts: add hdmi regulators for exynos5800 based
 peach-pi board
Date: Wed, 20 Aug 2014 13:19:50 +0200
Message-ID: <1408533593-32346-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
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
Cc: linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Olof Johansson <olof@lixom.net>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Rahul Sharma <rahul.sharma@samsung.com>

Adding regulators for HDMI for Peach-pi board.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 5da5052..ec4e5c7 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -141,6 +141,11 @@
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
2.0.1
