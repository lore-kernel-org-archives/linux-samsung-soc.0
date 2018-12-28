From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/6] ARM: dts: s5pv210: aries: Enable more drivers present on Samsung Aries based devices
Date: Fri, 28 Dec 2018 17:18:13 +0100
Message-ID: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, pawel.mikolaj.chmiel@gmail.com, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset enables more drivers for devices present on
 Samsung Aries based devices.

First patch switches fimd to correct variant, which wasn't
 present at moment of adding aries dts.

Next two patches removes hardcoded bootargs from dts files
 for galaxys and fascinate4g, because now we have working bootloader
 which can pass those values.

One of the patches also reserves memory for Samsung S5P MFC
 video codec, so it's possible to use it.

Last two patches adds and enables more drivers.

Jonathan Bakker (1):
  ARM: dts: s5pv210: aries: Support for more devices present on Aries

Paweł Chmiel (5):
  ARM: dts: s5pv210: Use correct fimd variant
  ARM: dts: s5pv210: galaxys: Remove hardcoded bootargs
  ARM: dts: s5pv210: fascinate4g: Remove hardcoded bootargs
  ARM: dts: s5pv210: aries: Add reserved memory for mfc
  ARM: defconfig: s5pv210: Enable more drivers present on Samsung Aries

 arch/arm/boot/dts/s5pv210-aries.dtsi      | 90 +++++++++++++++++++++++
 arch/arm/boot/dts/s5pv210-fascinate4g.dts |  7 --
 arch/arm/boot/dts/s5pv210-galaxys.dts     |  7 --
 arch/arm/boot/dts/s5pv210.dtsi            |  2 +-
 arch/arm/configs/s5pv210_defconfig        | 41 ++++++++---
 5 files changed, 121 insertions(+), 26 deletions(-)

-- 
2.17.1
