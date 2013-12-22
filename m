From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] V4L: s5k6a3: Add DT binding documentation
Date: Sun, 22 Dec 2013 22:27:00 +0100
Message-ID: <1387747620-24676-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DT binding documentation for the Samsung S5K6A3(YX)
raw image sensor.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
This patch adds missing documentation [1] for the "samsung,s5k6a3"
compatible. Rob, can you please merge it through your tree if it 
looks OK ?

Thanks,
Sylwester

[1] http://www.spinics.net/lists/devicetree/msg10693.html

Changes since v3 (https://linuxtv.org/patch/20429):
 - rephrased 'clocks' and 'clock-names' properties' description.
---
 .../devicetree/bindings/media/samsung-s5k6a3.txt   |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

diff --git a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
new file mode 100644
index 0000000..cce01e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
@@ -0,0 +1,33 @@
+Samsung S5K6A3(YX) raw image sensor
+---------------------------------
+
+S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
+and CCI (I2C compatible) control bus.
+
+Required properties:
+
+- compatible	: "samsung,s5k6a3";
+- reg		: I2C slave address of the sensor;
+- svdda-supply	: core voltage supply;
+- svddio-supply	: I/O voltage supply;
+- afvdd-supply	: AF (actuator) voltage supply;
+- gpios		: specifier of a GPIO connected to the RESET pin;
+- clocks	: should contain list of phandle and clock specifier pairs
+		  according to common clock bindings for the clocks described
+		  in the clock-names property;
+- clock-names	: should contain "extclk" entry for the sensor's EXTCLK clock;
+
+Optional properties:
+
+- clock-frequency : the frequency at which the "extclk" clock should be
+		    configured to operate, in Hz; if this property is not
+		    specified default 24 MHz value will be used.
+
+The common video interfaces bindings (see video-interfaces.txt) should be
+used to specify link to the image data receiver. The S5K6A3(YX) device
+node should contain one 'port' child node with an 'endpoint' subnode.
+
+Following properties are valid for the endpoint node:
+
+- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
+  video-interfaces.txt.  The sensor supports only one data lane.
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
