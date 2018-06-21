From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/7] Initial support for Samsung Galaxy S and Galaxy S 4G
Date: Thu, 21 Jun 2018 21:09:52 +0200
Message-ID: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca, pawel.mikolaj.chmiel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Jonathan Bakker (2):
  ARM: dts: s5pv210: Add initial DTS config for SGH-T959P phone
  dt-bindings: samsung: Document binding for SGH-T959P board

Paweł Chmiel (5):
  ARM: dts: s5pv210: Add missing interrupt-controller property to gph2
  ARM: dts: s5pv210: Add initial DTS for Samsung Aries based phones.
  ARM: dts: s5pv210: Add initial DTS for Samsung Galaxy S phone.
  ARM: s5pv210_defconfig: Enable drivers for Samsung Aries based phones
  dt-bindings: samsung: Document bindings for Samsung aries boards

 .../bindings/arm/samsung/samsung-boards.txt        |   3 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/s5pv210-aries.dtsi               | 397 +++++++++++++++++++++
 arch/arm/boot/dts/s5pv210-fascinate4g.dts          |  40 +++
 arch/arm/boot/dts/s5pv210-galaxys.dts              |  72 ++++
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi             |   2 +
 arch/arm/configs/s5pv210_defconfig                 |  49 ++-
 7 files changed, 562 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/s5pv210-aries.dtsi
 create mode 100644 arch/arm/boot/dts/s5pv210-fascinate4g.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-galaxys.dts

-- 
2.7.4
