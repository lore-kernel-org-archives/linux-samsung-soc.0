From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v5 09/10] ARM: dts: Simplify USB3503 on exynos5250-arndale
Date: Fri,  1 Aug 2014 06:54:56 +0200
Message-ID: <1406868897-26874-10-git-send-email-afaerber@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

There's no need for a simple-bus, place the smsc,usb3503a directly into
the root node. That's what we're going to do on exynos5250-spring.

Reported-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v5: New
 Aligns with Spring's new USB3503 node.

 arch/arm/boot/dts/exynos5250-arndale.dts | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/d=
ts/exynos5250-arndale.dts
index a04a875346aa..9912d27492db 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -108,18 +108,12 @@
 		};
 	};
=20
-	usb_hub_bus {
-		compatible =3D "simple-bus";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
+	// SMSC USB3503 connected in hardware only mode as a PHY
+	usb_hub: usb-hub {
+		compatible =3D "smsc,usb3503a";
=20
-		// SMSC USB3503 connected in hardware only mode as a PHY
-		usb_hub: usb_hub {
-			compatible =3D "smsc,usb3503a";
-
-			reset-gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
-			connect-gpios =3D <&gpd1 7 GPIO_ACTIVE_LOW>;
-		};
+		reset-gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
+		connect-gpios =3D <&gpd1 7 GPIO_ACTIVE_LOW>;
 	};
 };
=20
--=20
1.9.3
