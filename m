From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] iio: exynos-adc: use syscon instead of ioremap
Date: Tue, 16 Sep 2014 14:28:48 +0530
Message-ID: <1410857931-4980-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Changes since v1:
1. Rebased on top of togreg branch of IIO git.

This patch set does the following
1. Use the syscon and Regmap API instead of ioremappaing the
   ADC_PHY register from PMU.
2. Updates the Documentation in exynos-adc.txt with syscon phandle
   for the ADC nodes.
3. Updates the Dts files for Exynos3250, Exynos4x12, Exynos5250,
   Exynos5420 with the syscon phandle.

Tested on Exynos5420 based Peach PIT and Exynos5800 based Peach PI
by verifying sysfs entries provided by HWMON based NTC thermistors.

Tested-By for Exynos3250, Exynos4x12 would be appreciated.

Naveen Krishna Chatradhi (3):
  iio: exyno-adc: use syscon for PMU register access
  Documentation: dt-bindings: update exynos-adc.txt with syscon handle
  ARM: dts: exynos: Add sysreg phandle to ADC node

 .../devicetree/bindings/arm/samsung/exynos-adc.txt |    9 ++++--
 arch/arm/boot/dts/exynos3250.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos4x12.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
 drivers/iio/adc/exynos_adc.c                       |   30 ++++++++++++++------
 6 files changed, 36 insertions(+), 15 deletions(-)

-- 
1.7.9.5
