From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v5 01/10] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Fri,  1 Aug 2014 06:54:48 +0200
Message-ID: <1406868897-26874-2-git-send-email-afaerber@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jaehoon Chung <jh80.chung@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The pinctrl properties should be on the device directly and not on the
slot sub-node.

Reported-by: Doug Anderson <dianders@chromium.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v3 -> v4 -> v5: Unchanged
=20
 v3: New (Doug Anderson)
 Redundant with Jaehoon Chung's general slot@0 deprecation,
 in case that hits the tree earlier.

 arch/arm/boot/dts/exynos5250-snow.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/=
exynos5250-snow.dts
index f2b8c4116541..eb437f6afec1 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -240,10 +240,8 @@
 	 */
 	mmc@12230000 {
 		status =3D "okay";
-		slot@0 {
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
-		};
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
 	};
=20
 	i2c@12CD0000 {
--=20
1.9.3
