From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 2/4] ARM: dts: exynos5250: cypress,cyapa trackpad is Snow only
Date: Fri, 18 Jul 2014 19:20:07 +0200
Message-ID: <1405704009-8430-3-git-send-email-afaerber@suse.de>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44161 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030449AbaGRRVk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 13:21:40 -0400
In-Reply-To: <1405704009-8430-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM
	A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
Spring does not need it, it uses an Atmel maXTouch instead.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New (Doug Anderson)

 arch/arm/boot/dts/exynos5250-cros-common.dtsi |  8 --------
 arch/arm/boot/dts/exynos5250-snow.dts         | 10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm/b=
oot/dts/exynos5250-cros-common.dtsi
index 61128d1..e603e9c 100644
--- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
@@ -39,14 +39,6 @@
 		status =3D "okay";
 		samsung,i2c-sda-delay =3D <100>;
 		samsung,i2c-max-bus-freq =3D <378000>;
-
-		trackpad {
-			reg =3D <0x67>;
-			compatible =3D "cypress,cyapa";
-			interrupts =3D <2 0>;
-			interrupt-parent =3D <&gpx1>;
-			wakeup-source;
-		};
 	};
=20
 	i2c@12C80000 {
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/=
exynos5250-snow.dts
index 0f867a3..f2b8c41 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -490,6 +490,16 @@
 	};
 };
=20
+&i2c_1 {
+	trackpad {
+		reg =3D <0x67>;
+		compatible =3D "cypress,cyapa";
+		interrupts =3D <2 0>;
+		interrupt-parent =3D <&gpx1>;
+		wakeup-source;
+	};
+};
+
 &pinctrl_0 {
 	max77686_irq: max77686-irq {
 		samsung,pins =3D "gpx3-2";
--=20
1.9.3
