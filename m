From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/4] Make max expected current configurable for ina2xx
 drivers
Date: Thu, 12 Oct 2017 14:36:01 +0200
Message-ID: <1507811765-31005-1-git-send-email-m.purski@samsung.com>
References: <CGME20171012123623eucas1p18dd41d52069240a3172c0bcec8f63553@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

this patchset makes it possible to calibrate ina2xx drivers with different
calibration values, which are calculated using max expected current value.
It can be read from device tree, platform data or changed during run-time
using sysfs. If it isn't specified in device tree or platform data, the
driver uses default value, thanks to which the behaviour of the driver
doesn't change in this case.

There are two drivers for ina2xx: hwmon and iio. Changes are made
for both of them and their bindings as well.

These changes allow setting sensor's precision to the required by the board.
It is useful in Odroid XU3. Therefore this patchset also sets
max-expected-current in OdroidXU3 device tree to values from documentation.

Best Regards,

	Maciej Purski

---
Changes in v2:
- make scale attribute for current iio channel writable as instead of
  adding new attribute max_expected_current
- use currX_max standard attribute in hwmon instead of adding new
  attribute
- fix max expected current property name
- update commit messages

Maciej Purski (4):
  iio: adc: ina2xx: Make max expected current configurable
  hwmon: (ina2xx) Make max expected current configurable
  dt-bindings: hwmon: Add ti-max-expected-current-microamp property to
    ina2xx
  ARM: dts: Add ti-max-expected-current-microamp properties for ina231
    in Odroid XU3

 Documentation/devicetree/bindings/hwmon/ina2xx.txt |   4 +-
 Documentation/hwmon/ina2xx                         |   3 +
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         |   4 +
 drivers/hwmon/ina2xx.c                             | 106 ++++++++++++++++++---
 drivers/iio/adc/ina2xx-adc.c                       |  97 ++++++++++++++-----
 include/linux/platform_data/ina2xx.h               |   2 +
 6 files changed, 178 insertions(+), 38 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
