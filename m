From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2] Documentation: devicetree: Fix tps65090 typos in example
Date: Thu, 26 Jun 2014 01:07:40 +0200
Message-ID: <1403737664-6426-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50098 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756585AbaFYXJT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 19:09:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Mark Brown <broonie@linaro.org>, Michael Spang <spang@chromium.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Specification and existing device trees use vsys-l{1,2}-supply,
not vsys_l{1,2}-supply. Fix the example to match the specification.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v1 -> v2:
 * More verbose commit message (requested by Mark Rutland)

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
