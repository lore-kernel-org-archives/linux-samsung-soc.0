From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 0/5] Add max77802 support for Peach boards
Date: Wed, 20 Aug 2014 13:19:48 +0200
Message-ID: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Kukjin,

This is a second version of th series that adds max77802 support for
the Peach Pit and Pi boards. The series also have all the pending
patches that were posted but depended on this support. I've picked
all the patches I found and rebased them to be sure that they apply
cleanly on top of linux-next. Also I've taken some DT snippets from
the downstream Chrome OS 3.8 kernel DTS for devices that use one of
these regulators as their input supply.

Changes sinve v1 [0]:
 - Dropped patch that added vmmc and vqmmc supplies as suggested
   by Doug Anderson.
 - Use IRQ flags define instead of a magic number as suggested by
   Andreas F=C3=A4rber.

The series is composed of the following patches:

Javier Martinez Canillas (2):
  ARM: dts: Add Peach Pit and Pi dts entry for max77802 PMIC
  ARM: dts: Add Peach Pit and Pi dts entry for ISL29018 sensor

Naveen Krishna Chatradhi (1):
  ARM: dts: Add thermistor dts fragment used by exynos based Peach
    boards

Rahul Sharma (2):
  ARM: dts: add hdmi regulators for exynos5800 based peach-pi board
  ARM: dts: add hdmi regulators for exynos5420 based peach-pit board

 arch/arm/boot/dts/cros-adc-thermistors.dtsi |  44 ++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts  | 389 ++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts   | 389 ++++++++++++++++++++=
++++++++
 3 files changed, 822 insertions(+)
 create mode 100644 arch/arm/boot/dts/cros-adc-thermistors.dtsi

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/19/372
