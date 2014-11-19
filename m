From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 4/4] ARM: dts: Add trackpad to exynos5250-spring
Date: Wed, 19 Nov 2014 16:56:24 +0100
Message-ID: <1416412585-10809-5-git-send-email-afaerber@suse.de>
References: <1416412585-10809-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416412585-10809-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The HP Chromebook 11 uses an Atmel maXTouch as trackpad.
The keymap was found by trial-and-error.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dt=
s/exynos5250-spring.dts
index cc3361afba49..2fa207c9e5e2 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -330,6 +330,22 @@
 	status =3D "okay";
 	samsung,i2c-sda-delay =3D <100>;
 	samsung,i2c-max-bus-freq =3D <378000>;
+
+	trackpad@4b {
+		compatible =3D "atmel,maxtouch";
+		reg =3D <0x4b>;
+		interrupt-parent =3D <&gpx1>;
+		interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&trackpad_irq>;
+		linux,gpio-keymap =3D <KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     BTN_LEFT>;
+		wakeup-source;
+	};
 };
=20
 /*
@@ -465,6 +481,13 @@
 		samsung,pin-drv =3D <0>;
 	};
=20
+	trackpad_irq: trackpad-irq {
+		samsung,pins =3D "gpx1-2";
+		samsung,pin-function =3D <0xf>;
+		samsung,pin-pud =3D <0>;
+		samsung,pin-drv =3D <0>;
+	};
+
 	power_key_irq: power-key-irq {
 		samsung,pins =3D "gpx1-3";
 		samsung,pin-function =3D <0>;
--=20
2.1.2
