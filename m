From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v3 0/5] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
Date: Tue, 3 Dec 2013 16:19:57 +0100
Message-ID: <201312031619.58062.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:55118 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753279Ab3LCPUB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 10:20:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Resurrecting this series again after to much time.

Changed is the pll registration to follow the new system and getting the
external clocks from dt fixed-rate clocks.

Hopefully I did address all comments received for v2 in july.

Tested on both non-dt and dt s3c2416. As s3c2443 is working the same way it
should work, but is only compile tested.

Heiko Stuebner (5):
  clk: samsung: add pll_6552 variant for s3c2416
  clk: samsung: add plls used by the s3c2443
  dt-bindings: add binding for clock-controller of s3c2443 and following
  clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450
  ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework

 .../bindings/clock/samsung,s3c2443-clock.txt       |   46 ++
 arch/arm/boot/dts/s3c2416-smdk2416.dts             |    9 +
 arch/arm/boot/dts/s3c2416.dtsi                     |   48 ++
 arch/arm/mach-s3c24xx/Kconfig                      |   14 +-
 arch/arm/mach-s3c24xx/Makefile                     |    5 +-
 arch/arm/mach-s3c24xx/clock-s3c2416.c              |  171 -----
 arch/arm/mach-s3c24xx/clock-s3c2443.c              |  212 ------
 arch/arm/mach-s3c24xx/common-s3c2443.c             |  675 --------------------
 arch/arm/mach-s3c24xx/common.c                     |   16 +-
 arch/arm/mach-s3c24xx/common.h                     |    6 +
 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |   39 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c              |    9 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c              |    9 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-pll.c                      |   84 ++-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 drivers/clk/samsung/clk-s3c2443.c                  |  417 ++++++++++++
 include/dt-bindings/clock/samsung,s3c2443-clock.h  |   92 +++
 18 files changed, 742 insertions(+), 1114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt
 delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
 delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
 create mode 100644 drivers/clk/samsung/clk-s3c2443.c
 create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h

-- 
1.7.10.4
