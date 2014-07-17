From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 03/14] ARM: dts: samsung-fimd: add LCD I80 interface
 specific properties
Date: Thu, 17 Jul 2014 18:01:18 +0900
Message-ID: <1405587689-1466-4-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32328 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754537AbaGQJBf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 05:01:35 -0400
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

In case of using MIPI DSI based I80 interface panel,
the relevant registers should be set.
So this patch adds relevant DT bindings.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/video/samsung-fimd.txt     | 28 ++++++++++++++=
++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b=
/Documentation/devicetree/bindings/video/samsung-fimd.txt
index 2dad41b..59ff61e 100644
--- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -44,6 +44,34 @@ Optional Properties:
 - display-timings: timing settings for FIMD, as described in document =
[1].
 		Can be used in case timings cannot be provided otherwise
 		or to override timings provided by the panel.
+- samsung,sysreg: handle to syscon used to control the system register=
s
+- i80-if-timings: timing configuration for lcd i80 interface support.
+  - cs-setup: clock cycles for the active period of address signal is =
enabled
+              until chip select is enabled.
+              If not specified, the default value(0) will be used.
+  - wr-setup: clock cycles for the active period of CS signal is enabl=
ed until
+              write signal is enabled.
+              If not specified, the default value(0) will be used.
+  - wr-active: clock cycles for the active period of CS is enabled.
+               If not specified, the default value(1) will be used.
+  - wr-hold: clock cycles for the active period of CS is disabled unti=
l write
+             signal is disabled.
+             If not specified, the default value(0) will be used.
+
+  The parameters are defined as:
+
+    VCLK(internal)  __|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
|_____|=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|_____|=C2=AF=C2=AF
+                      :            :            :            :        =
    :
+    Address Output  --:<XXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXX=
XXXX:XX
+                      | cs-setup+1 |            :            :        =
    :
+                      |<---------->|            :            :        =
    :
+    Chip Select     =C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=
=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|____________:____________:_____=
_______|=C2=AF=C2=AF
+                                   | wr-setup+1 |            | wr-hold=
+1  |
+                                   |<---------->|            |<-------=
--->|
+    Write Enable    =C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=
=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=
=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF|____________|=C2=AF=C2=AF=
=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=
=C2=AF
+                                                | wr-active+1|
+                                                |<---------->|
+    Video Data      ----------------------------<XXXXXXXXXXXXXXXXXXXXX=
XXXX>--
=20
 The device node can contain 'port' child nodes according to the bindin=
gs defined
 in [2]. The following are properties specific to those nodes:
--=20
1.9.0
