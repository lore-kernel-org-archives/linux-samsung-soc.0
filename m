From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
Date: Thu, 14 May 2015 17:40:07 +0200
Message-ID: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello arm-soc maintainers,

This series is an attempt to reduce the delta between exynos_defconfig
and multi_v7_defconfig. Primarily to enable the needed Kconfig symbols
to make all Exynos Chromebooks peripherals to be working when building
an image using the ARMv7 multi-platform default config.

Since the policy is now to now enable as much as possible, I did build
as a module all the Kconfig symbols that were tristate and only enable
as built-in those that can't be a module because are boolean options.

A nice side effect of this series is that I found that many drivers
were not working properly when built as a module because the modalias
information was not filled properly or at all. I've posted patches to
fix the issues I found when testing this series.

The patches have been tested on an Exynos5250 Snow, Exynos5420 Peach
Pit and Exynos5800 Peach Pi Chromebooks but most config options will
be useful for others Exynos5 or other Samsung SoCs.

The series is composed of the following patches that can be applied on
top of your next/defconfig branch [0].

Javier Martinez Canillas (9):
  ARM: multi_v7_defconfig: Enable support for Samsung S3C64XX SPI
  ARM: multi_v7_defconfig: Enable max77802 regulator, rtc and clock
    drivers
  ARM: multi_v7_defconfig: Enable Exynos USB PHY drivers support
  ARM: multi_v7_defconfig: Enable support for missing ChromeOS EC
    drivers
  ARM: multi_v7_defconfig: Enable Samsung PWM support
  ARM: multi_v7_defconfig: Enable Samsung S3C SoC RTC
  ARM: multi_v7_defconfig: Enable options for Exynos display support
  ARM: multi_v7_defconfig: Enable GPIO-based I2C arbitration support
  ARM: multi_v7_defconfig: Enable Cypress APA I2C Trackpad support

 arch/arm/configs/multi_v7_defconfig | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

Best regards,
Javier

[0]: git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git next/defconfig
