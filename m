From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V9 11/14] Documentation: bridge: Add documentation for ps8622
 DT properties
Date: Tue, 20 Jan 2015 22:08:52 +0530
Message-ID: <1421771935-31618-12-git-send-email-ajaykumar.rs@samsung.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1421771935-31618-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, bhushan.r-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add documentation for DT properties supported by ps8622/ps8625
eDP-LVDS converter.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Tested-by: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Tested-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 .../devicetree/bindings/video/bridge/ps8622.txt    |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt

diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
new file mode 100644
index 0000000..c989c38
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
@@ -0,0 +1,31 @@
+ps8622-bridge bindings
+
+Required properties:
+	- compatible: "parade,ps8622" or "parade,ps8625"
+	- reg: first i2c address of the bridge
+	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
+	- reset-gpios: OF device-tree gpio specification for RST_ pin.
+
+Optional properties:
+	- lane-count: number of DP lanes to use
+	- use-external-pwm: backlight will be controlled by an external PWM
+	- video interfaces: Device node can contain video interface port
+			    nodes for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	lvds-bridge@48 {
+		compatible = "parade,ps8622";
+		reg = <0x48>;
+		sleep-gpios = <&gpc3 6 1 0 0>;
+		reset-gpios = <&gpc3 1 1 0 0>;
+		lane-count = <1>;
+		ports {
+			port@0 {
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
