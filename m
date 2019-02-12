From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] ARM/dts/iio: exynos-adc: Use proper number of channels for Exynos4x12
Date: Tue, 12 Feb 2019 18:45:48 +0100
Message-ID: <20190212174550.4383-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The DTS patch depends on iio change.  I will take it through samsung-soc
for consecutive release, once iio/adc gets accepted.

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  iio: adc: exynos-adc: Use proper number of channels for Exynos4x12
  ARM: dts: exynos: Use ADC for Exynos4x12 on Exyno4412

 .../bindings/iio/adc/samsung,exynos-adc.txt     |  4 +++-
 arch/arm/boot/dts/exynos4412.dtsi               |  2 +-
 drivers/iio/adc/exynos_adc.c                    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.17.1
