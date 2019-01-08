From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 0/4] ARM: dts: s5pv210: aries: Enable more drivers present on Samsung Aries based devices
Date: Tue,  8 Jan 2019 17:55:57 +0100
Message-ID: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com>
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

Changes from v1:
  - Removed already applied patches
  - Fixed name of mfc memory reservation nodes
  - Added separate patch with savedefconfig result
  - Fixed configuration of touchscreen

Jonathan Bakker (1):
  ARM: dts: s5pv210: aries: Support for more devices present on Aries

Paweł Chmiel (3):
  ARM: dts: s5pv210: aries: Add reserved memory for mfc
  ARM: defconfig: s5pv210: Run make savedefconfig
  ARM: defconfig: s5pv210: Enable more drivers present on Samsung Aries

 arch/arm/boot/dts/s5pv210-aries.dtsi | 90 ++++++++++++++++++++++++++++
 arch/arm/configs/s5pv210_defconfig   | 41 +++++++++----
 2 files changed, 120 insertions(+), 11 deletions(-)

-- 
2.17.1
