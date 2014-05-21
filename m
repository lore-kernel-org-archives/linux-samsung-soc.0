From: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=20v2=2003/18=5D=20ARM=3A=20dts=3A=20video=3A=20add=20command=20mode=20display=20timing=20DT=20bindings?=
Date: Wed, 21 May 2014 13:42:55 +0900
Message-ID: <1400647390-26590-4-git-send-email-yj44.cho@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1400647390-26590-1-git-send-email-yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DT bindings for command mode display timing.

Signed-off-by: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
