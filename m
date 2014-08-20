From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v7] ARM: dts: Prepare node labels for exynos5250
Date: Wed, 20 Aug 2014 15:02:44 +0200
Message-ID: <1408539764-5835-1-git-send-email-afaerber@suse.de>
References: <53DCD74B.8090400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53DCD74B.8090400@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Allows them to be extended by reference.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v6 -> v7:
 * Dropped uart* labels (Tomasz Figa)
=20
 v6: Split off from Snow/SMDK cleanups (Doug Anderson)
=20
 arch/arm/boot/dts/exynos5250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exyn=
os5250.dtsi
index 492e1eff37bd..42eafd19cfb2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -218,7 +218,7 @@
 		clock-names =3D "fimg2d";
 	};
=20
-	codec@11000000 {
+	mfc: codec@11000000 {
 		compatible =3D "samsung,mfc-v6";
 		reg =3D <0x11000000 0x10000>;
 		interrupts =3D <0 96 0>;
@@ -227,7 +227,7 @@
 		clock-names =3D "mfc";
 	};
=20
-	rtc@101E0000 {
+	rtc: rtc@101E0000 {
 		clocks =3D <&clock CLK_RTC>;
 		clock-names =3D "rtc";
 		status =3D "disabled";
@@ -261,7 +261,7 @@
 		clock-names =3D "uart", "clk_uart_baud0";
 	};
=20
-	sata@122F0000 {
+	sata: sata@122F0000 {
 		compatible =3D "snps,dwc-ahci";
 		samsung,sata-freq =3D <66>;
 		reg =3D <0x122F0000 0x1ff>;
@@ -573,7 +573,7 @@
 		#phy-cells =3D <1>;
 	};
=20
-	usb@12110000 {
+	ehci: usb@12110000 {
 		compatible =3D "samsung,exynos4210-ehci";
 		reg =3D <0x12110000 0x100>;
 		interrupts =3D <0 71 0>;
@@ -588,7 +588,7 @@
 		};
 	};
=20
-	usb@12120000 {
+	ohci: usb@12120000 {
 		compatible =3D "samsung,exynos4210-ohci";
 		reg =3D <0x12120000 0x100>;
 		interrupts =3D <0 71 0>;
@@ -725,7 +725,7 @@
 		clock-names =3D "gscl";
 	};
=20
-	hdmi {
+	hdmi: hdmi {
 		compatible =3D "samsung,exynos4212-hdmi";
 		reg =3D <0x14530000 0x70000>;
 		interrupts =3D <0 95 0>;
@@ -751,14 +751,14 @@
 		#phy-cells =3D <0>;
 	};
=20
-	dp-controller@145B0000 {
+	dp: dp-controller@145B0000 {
 		clocks =3D <&clock CLK_DP>;
 		clock-names =3D "dp";
 		phys =3D <&dp_phy>;
 		phy-names =3D "dp";
 	};
=20
-	fimd@14400000 {
+	fimd: fimd@14400000 {
 		clocks =3D <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names =3D "sclk_fimd", "fimd";
 	};
--=20
2.0.4
