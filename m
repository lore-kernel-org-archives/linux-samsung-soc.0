From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 1/4] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Wed, 30 Jul 2014 15:50:41 +0200
Message-ID: <1406728244-5105-2-git-send-email-afaerber@suse.de>
References: <1406728244-5105-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39177 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752683AbaG3Nw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 09:52:27 -0400
In-Reply-To: <1406728244-5105-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jaehoon Chung <jh80.chung@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

The pinctrl properties should be on the device directly and not on the
slot sub-node.

Reported-by: Doug Anderson <dianders@chromium.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
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
