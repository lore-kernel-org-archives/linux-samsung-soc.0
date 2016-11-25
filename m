From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: usb: add DT binding for s3c2410 USB OHCI controller
Date: Fri, 25 Nov 2016 12:47:28 -0200
Message-ID: <1480085249-25014-2-git-send-email-sergio.prado@e-labworks.com>
References: <1480085249-25014-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480085249-25014-1-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adds the device tree bindings description for Samsung S3C2410 and
compatible USB OHCI controller.

Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
new file mode 100644
index 000000000000..e45b38ce2986
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
@@ -0,0 +1,22 @@
+Samsung S3C2410 and compatible SoC USB controller
+
+OHCI
+
+Required properties:
+ - compatible: should be "samsung,s3c2410-ohci" for USB host controller
+ - reg: address and lenght of the controller memory mapped region
+ - interrupts: interrupt number for the USB OHCI controller
+ - clocks: Should reference the bus and host clocks
+ - clock-names: Should contain two strings
+		"usb-bus-host" for the USB bus clock
+		"usb-host" for the USB host clock
+
+Example:
+
+usb0: ohci@49000000 {
+	compatible = "samsung,s3c2410-ohci";
+	reg = <0x49000000 0x100>;
+	interrupts = <0 0 26 3>;
+	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
+	clock-names = "usb-bus-host", "usb-host";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
