From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv4 5/9] s5p-cec.txt: document the HDMI controller phandle
Date: Mon,  6 Feb 2017 11:29:47 +0100
Message-ID: <20170206102951.12623-6-hverkuil@xs4all.nl>
References: <20170206102951.12623-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206102951.12623-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Update the bindings documenting the new hdmi phandle.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
CC: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/media/s5p-cec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
index 925ab4d72eaa..710fc005150c 100644
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ b/Documentation/devicetree/bindings/media/s5p-cec.txt
@@ -15,6 +15,7 @@ Required properties:
   - clock-names : from common clock binding: must contain "hdmicec",
 		  corresponding to entry in the clocks property.
   - samsung,syscon-phandle - phandle to the PMU system controller
+  - samsung,hdmi-phandle - phandle to the HDMI controller
 
 Example:
 
@@ -25,6 +26,7 @@ hdmicec: cec@100B0000 {
 	clocks = <&clock CLK_HDMI_CEC>;
 	clock-names = "hdmicec";
 	samsung,syscon-phandle = <&pmu_system_controller>;
+	samsung,hdmi-phandle = <&hdmi>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_cec>;
 	status = "okay";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
