From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/3] iio: adc: exynos-adc: Add support for S5PV210
Date: Fri,  7 Dec 2018 20:11:33 +0100
Message-ID: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, kgene@kernel.org, krzk@kernel.org, xc-racer2@live.ca, pawel.mikolaj.chmiel@gmail.com, broonie@kernel.org, arnaud.pouliquen@st.com, baolin.wang@linaro.org, smohanad@codeaurora.org, eugen.hristev@microchip.com, rdunlap@infradead.org, vilhelm.gray@gmail.com, freeman.liu@spreadtrum.com, marcus.folkesson@gmail.com, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset adds support for S5PV210 adc variant to exynos-adc driver.

Jonathan Bakker (3):
  iio: adc: exynos-adc: Add S5PV210 variant
  iio: adc: Allow selection of Exynos ADC on S5PV210
  dt-bindings: iio: adc: exynos-adc: Add S5PV210 variant

 .../bindings/iio/adc/samsung,exynos-adc.txt        |  4 +++-
 drivers/iio/adc/Kconfig                            |  2 +-
 drivers/iio/adc/exynos_adc.c                       | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.17.1
