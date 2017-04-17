From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: Add support for samsung s6e3hf2 panel
Date: Mon, 17 Apr 2017 15:02:12 +0900
Message-ID: <1492408934-22096-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1492408934-22096-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170417060218epcas1p1dd328b9af56638f30fa6f350a81fce45@epcas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1492408934-22096-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The samsung s6e3hf2 panel is a 5.65" 1600x2560 AMOLED panel connected
using MIPI-DSI interfaces.

The s6e3hf2 is add to samsung,s6e3ha2.txt binding because it is a
panel similar to the s6e3ha2. So add the compatible string and
comments.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
index 18854f4..4acea25 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
@@ -1,7 +1,10 @@
 Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
+Samsung S6E3HF2 5.65" 1600x2560 AMOLED panel
 
 Required properties:
-  - compatible: "samsung,s6e3ha2"
+  - compatible: should be one of:
+    "samsung,s6e3ha2",
+    "samsung,s6e3hf2".
   - reg: the virtual channel number of a DSI peripheral
   - vdd3-supply: I/O voltage supply
   - vci-supply: voltage supply for analog circuits
-- 
1.9.1
