From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] iio: adc: exynos_adc: Add support for s3c64xx/s3c24xx ADC
Date: Tue, 22 Jul 2014 11:11:12 +0900
Message-ID: <1405995074-3271-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add support for s3c64xx/s3c24xx ADC. s3c64xx/s3c24xx is alomost same
as ADCv1. But, s3c64xx/s3c24xx has a little difference from ADCv1 as following:
- ADCMUX register address to select channel
- ADCDAT mask (10bit or 12bit ADC resolution according to SoC version)

This patchset is implemented based on exynos3250 ADC patchset[1].
 [1] http://www.spinics.net/lists/kernel/msg1791299.html

Arnd Bergmann (1):
  iio: adc: exynos_adc: add support for s3c64xx adc

Chanwoo Choi (1):
  iio: adc: exynos_adc: Add support for S3C24xx ADC

 .../devicetree/bindings/arm/samsung/exynos-adc.txt |  12 +-
 drivers/iio/adc/exynos_adc.c                       | 121 ++++++++++++++++++++-
 2 files changed, 129 insertions(+), 4 deletions(-)

-- 
1.8.0
