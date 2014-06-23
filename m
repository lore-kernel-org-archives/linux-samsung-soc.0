From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/4] Documentation: devicetree: Fix tps65090 typos
Date: Mon, 23 Jun 2014 03:21:21 +0200
Message-ID: <1403486483-4063-4-git-send-email-afaerber@suse.de>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

It's vsys-l{1,2}-supply, not vsys_l{1,2}-supply.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/regulator/tps65090.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/tps65090.txt b=
/Documentation/devicetree/bindings/regulator/tps65090.txt
index 34098023..ca69f5e 100644
--- a/Documentation/devicetree/bindings/regulator/tps65090.txt
+++ b/Documentation/devicetree/bindings/regulator/tps65090.txt
@@ -45,8 +45,8 @@ Example:
 		infet5-supply =3D <&some_reg>;
 		infet6-supply =3D <&some_reg>;
 		infet7-supply =3D <&some_reg>;
-		vsys_l1-supply =3D <&some_reg>;
-		vsys_l2-supply =3D <&some_reg>;
+		vsys-l1-supply =3D <&some_reg>;
+		vsys-l2-supply =3D <&some_reg>;
=20
 		regulators {
 			dcdc1 {
--=20
1.9.3
