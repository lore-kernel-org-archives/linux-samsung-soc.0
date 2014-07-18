From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCHv6 0/4] iio: adc: exynos_adc: Support Exynos3250 ADC and code
 clean
Date: Fri, 18 Jul 2014 14:59:42 +0900
Message-ID: <1405663186-26464-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset support Exynos3250 ADC (Analog Digital Converter) because
Exynos3250 has additional special clock for ADC IP.

Changes from v5:
- Add acked message by Kukjin Kim
- Add reviewed messgae by Tomasz Figa
- Fix typo (for for -> for)

Changes from v4:
- Use 'exynos_adc_data' structure instead of 'exynos_adc_ops' structure
  and remove enum variable of ADC version
- Fix wrong name of special clock (sclk_tsadc -> sclk_adc)
- Add reviewed message by Naveen Krishna Chatradhi
- Add functions for ADC clock control

Changes from v3:
- Add new 'exynos_adc_ops' structure to improve readability according to
 Tomasz Figa comment[1]
 [1] https://lkml.org/lkml/2014/4/16/238
- Add new 'exynos3250-adc-v2' compatible string to support Exynos3250 ADC
- Fix wrong compaitlbe string of ADC in Exynos3250 dtsi file

Changes from v2:
- Check return value of clock function to deal with error exception
- Fix minor coding style to improve readability

Changes from v1:
- Add new "samsung,exynos-adc-v3" compatible to support Exynos3250 ADC
- Add a patch about DT binding documentation

Chanwoo Choi (4):
  iio: adc: exynos_adc: Add exynos_adc_data structure to improve
    readability
  iio: adc: exynos_adc: Control special clock of ADC to support
    Exynos3250 ADC
  iio: devicetree: Add DT binding documentation for Exynos3250 ADC
  ARM: dts: Fix wrong compatible string for Exynos3250 ADC

 .../devicetree/bindings/arm/samsung/exynos-adc.txt |  25 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |   4 +-
 drivers/iio/adc/exynos_adc.c                       | 326 +++++++++++++++------
 3 files changed, 267 insertions(+), 88 deletions(-)

-- 
1.8.0
