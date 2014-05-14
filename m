From: YoungJun Cho <yj44.cho@samsung.com>
Subject: =?UTF-8?q?=5BPATCH=2003/18=5D=20ARM=3A=20dts=3A=20video=3A=20add=20command=20mode=20display=20timing=20DT=20bindings?=
Date: Wed, 14 May 2014 15:26:50 +0900
Message-ID: <1400048825-6052-4-git-send-email-yj44.cho@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbaENG1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 02:27:12 -0400
In-reply-to: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

This patch adds DT bindings for command mode display timing.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../bindings/video/cmdmode-display-timing.txt      |   64 ++++++++++++=
++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/cmdmode-dis=
play-timing.txt

diff --git a/Documentation/devicetree/bindings/video/cmdmode-display-ti=
ming.txt b/Documentation/devicetree/bindings/video/cmdmode-display-timi=
ng.txt
new file mode 100644
index 0000000..7cedfe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/cmdmode-display-timing.tx=
t
@@ -0,0 +1,64 @@
+cmdmode-display-timing bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+cmdmode-display-timings node
+--------------------------------
+
+required properties:
+ - none
+
+optional properties:
+ - native-mode: The native mode for the display, in case multiple mode=
s are
+		provided. When omitted, assume the first node is the native.
+
+timing subnode
+--------------
+
+required properties:
+ - clock-frequency: display clock in Hz
+ - hactive, vactive: display resolution
+ - cs-setup: clock cycles for the active period of address signal is e=
nabled
+		until chip select is enabled.
+ - wr-setup: clock cycles for the active period of CS signal is enable=
d until
+		write signal is enabled.
+ - wr-active: clock cycles for the active period of CS is enabled.
+ - wr-hold: clock cycles for the active period of CS is disabled until=
 write
+		signal is disabled.
+
+optional properties:
+
+There are different ways of describing the capabilities of a display. =
The
+devicetree representation corresponds to the one commonly found in dat=
asheets
+for displays. If a display supports multiple signal timings, the nativ=
e-mode
+can be specified.
+
+The parameters are defined as:
+
+  VCLK(internal)  __|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
|_____|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=C2=AF
+                    :            :            :            :          =
  :
+  Address Output  --:<XXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXX=
XX:XX
+                    | CS-SETUP+1 |            :            :          =
  :
+                    |<---------->|            :            :          =
  :
+  Chip Select     =C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|____________:____________:________=
____|=C2=AF=C2=AF
+                                 | WR-SETUP+1 |            | WR-HOLD+1=
  |
+                                 |<---------->|            |<---------=
->|
+  Write Enable    =C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|____________|=C2=AF=C2=AF=C2=
=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=
=AF
+                                              | WR-ACTIVE+1|
+                                              |<---------->|
+  Video Data      ----------------------------<XXXXXXXXXXXXXXXXXXXXXXX=
XX>--
+
+Example:
+
+	cmdmode-display-timings {
+		native-mode =3D <&timing0>;
+		timing0: 1080p24 {
+			/* 1920x1080p24 */
+			clock-frequency =3D <52000000>;
+			hactive =3D <1920>;
+			vactive =3D <1080>;
+			cs-setup =3D <0>;
+			wr-setup =3D <0>;
+			wr-active =3D <1>;
+			wr-hold =3D <0>;
+		};
+	};
--=20
1.7.9.5
