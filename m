From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2 v2] ARM: DTS: create thermistor fragment dtsi for Peach
 boards
Date: Fri, 27 Jun 2014 11:38:13 +0530
Message-ID: <1403849295-29538-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset does the following
1. Create a thermistor dtsi fragment file cros-adc-thermistors.dtsi for
   exynos5420-peach-pit.dts and exynos5800-peach-pi.dts
2. Adds the ADC based Thermistor nodes and enables them in peach_pit.dts
   and peach_pi.dts
3. Corrects the vendor prefix for thermistors in exynos4412-trats2.dts

This patch depends on (1/4 and 2/4 patches of) patchset posted
http://www.spinics.net/lists/linux-iio/msg13486.html
Which were applied on to Guenter Roeck's tree.

cat sysfs entries exported by hwmon for 4 thermistors
and verified the values on Peach pit and pi boards.

Changes since v1:
1. Dropped 2/3 "ARM: DTS: Add NTC thermistor nodes to Exynos5250 based Snow"
   https://lkml.org/lkml/2014/6/26/192
   As large number of Snow boards dint have thermistors.
2. Created a thermistor fragment instead of common dtsi file

Naveen Krishna Chatradhi (2):
  ARM: DTS: use new compatible string for thermistors in trats2
  ARM: DTS: Add thermistor dts fragment needed by exynos based peach
    boards

 arch/arm/boot/dts/cros-adc-thermistors.dtsi |   44 +++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts     |    4 +--
 arch/arm/boot/dts/exynos5420-peach-pit.dts  |    6 ++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts   |    6 ++++
 4 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/cros-adc-thermistors.dtsi

-- 
1.7.9.5
