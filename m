From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 3/4] dt-bindings: hwmon: Add
 ti-max-expected-current-milliamp property to ina2xx
Date: Thu, 12 Oct 2017 15:18:01 +0200
Message-ID: <1507814282-1486-4-git-send-email-m.purski@samsung.com>
References: <1507814282-1486-1-git-send-email-m.purski@samsung.com>
        <CGME20171012131816eucas1p292bc0e20f141cfd21fe27c40700d82fb@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1507814282-1486-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add optional max expected current property which allows calibrating
the ina sensor in order to achieve requested measure scale. Document
the changes in Documentation/hwmon/ina2xx.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 4 +++-
 Documentation/hwmon/ina2xx                         | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index 02af0d9..9268595 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -14,11 +14,13 @@ Optional properties:
 
 - shunt-resistor
 	Shunt resistor value in micro-Ohm
-
+- ti-max-expected-current-milliamp
+	Max expected current value in mA
 Example:
 
 ina220@44 {
 	compatible = "ti,ina220";
 	reg = <0x44>;
 	shunt-resistor = <1000>;
+	ti-max-expected-current-milliamp = <3000>;
 };
diff --git a/Documentation/hwmon/ina2xx b/Documentation/hwmon/ina2xx
index cfd31d9..30620e8 100644
--- a/Documentation/hwmon/ina2xx
+++ b/Documentation/hwmon/ina2xx
@@ -55,6 +55,9 @@ The shunt value in micro-ohms can be set via platform data or device tree at
 compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
 refer to the Documentation/devicetree/bindings/i2c/ina2xx.txt for bindings
 if the device tree is used.
+The max expected current value in miliamp can be set via platform data
+or device tree at compile-time or via currX_max attribute in sysfs
+at run-time.
 
 Additionally ina226 supports update_interval attribute as described in
 Documentation/hwmon/sysfs-interface. Internally the interval is the sum of
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
