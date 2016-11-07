From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/6] Add support for MAX8997 Clock Driver
Date: Mon, 07 Nov 2016 15:39:30 +0530
Message-ID: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39282 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbcKGKGv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 05:06:51 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG901JPAO2XHN20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Nov 2016 19:06:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, myungjoo.ham@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

During recent test on Exynos4210 based Origen board, I observed
RTC1 probe is failing giving following error message:

[    2.195817] s3c-rtc 10070000.rtc: failed to find rtc source clock
[    2.200475] s3c-rtc: probe of 10070000.rtc failed with error -2
[    2.206597] i2c /dev entries driver

This is mainly because S3C-RTC expects two clocks "rtc" and "rtc_src".
In case of Origen board this second clock is supplied by MAX8997 clock
oscillator.
This patch series modified MAX8997 MFD driver for supporting regmap, and 
adds max8997-clk driver. Also it documentation where-ever required and
extends RTC node in exynos4210-origen.dts for supporting both clocks.

After this patch series, RTC is getting probed properly on Origen board.

This patch series is tested for SMP boot on Origen board.

Pankaj Dubey (6):
  mfd: max8997: Initialize max8997 register map
  dt-bindings: clk: max8997: Add DT binding documentation
  clk: Add driver for Maxim-8997 PMIC clocks
  ARM: dts: Add clock provider specific properties to max8997 node
  mfd: max8997: Add max8997-clk name in mfd_cell
  ARM: dts: Extend the S3C RTC node with rtc_src clock

 .../devicetree/bindings/clock/maxim,max8997.txt    | 44 +++++++++++++
 .../bindings/regulator/max8997-regulator.txt       |  3 +
 arch/arm/boot/dts/exynos4210-origen.dts            |  6 +-
 arch/arm/boot/dts/exynos4210-trats.dts             |  3 +-
 drivers/clk/Kconfig                                | 10 +++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-max8997.c                          | 76 ++++++++++++++++++++++
 drivers/mfd/max8997.c                              | 15 +++++
 include/dt-bindings/clock/maxim,max8997.h          | 23 +++++++
 include/linux/mfd/max8997-private.h                |  3 +
 10 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max8997.txt
 create mode 100644 drivers/clk/clk-max8997.c
 create mode 100644 include/dt-bindings/clock/maxim,max8997.h

-- 
2.7.4
