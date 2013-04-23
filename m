From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Late Exynos stuff for v3.10
Date: Wed, 24 Apr 2013 01:19:37 +0900
Message-ID: <5176B499.1000208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:44662 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756452Ab3DWQTn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 12:19:43 -0400
Received: by mail-da0-f45.google.com with SMTP id v40so415355dad.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 09:19:43 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 58a7bbf75442ea439a4d3b7993ad87023e406063:

   ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/late-exynos-for-v3.10

for you to fetch changes up to 9007025f3438ec3bdea02439e760585345102b8d:

   ARM: dts: Disable the RTC by default on exynos5 (2013-04-24 00:32:28 
+0900)

----------------------------------------------------------------
This includes late exynos stuff for v3.10 1) keypad for smdk4412 and 
origen4412 boards 2) adds mfc clock entries for exynos4 3) enables 
usb2phy, usb3phy and dwc3-exynos for exynos5250 4) enables tmu for 
exynos4210 5) support chip id with dt

----------------------------------------------------------------
Doug Anderson (1):
       ARM: dts: Disable the RTC by default on exynos5

Girish K S (1):
       ARM: EXYNOS: force MAC ip to 32bit DMA

Sachin Kamat (7):
       ARM: dts: Remove keypad entries from exynos4x12-pinctrl.dtsi
       ARM: dts: Add keypad entries to Exynos4412 based Origen
       ARM: dts: Add keypad entries to SMDK4412
       ARM: dts: Add MFC clock entries for exynos4
       ARM: dts: Update MFC documentation for clock entries
       ARM: dts: Add TMU clock entries to exynos4210.dtsi
       ARM: dts: Enable TMU on Origen4210 board

Thomas Abraham (4):
       ARM: dts: add mshc controller node for Exynos4x12 SoCs
       ARM: EXYNOS: Add a platform bus notifier to set dma masks for 
Exynos5440
       ARM: EXYNOS: Create virtual I/O mapping for Chip-ID controller 
using device tree
       ARM: dts: Add chip-id controller node on Exynos4/5 SoC

Vivek Gautam (5):
       ARM: dts: Enabling samsung-usb2phy driver for exynos5250
       ARM: dts: Enabling samsung-usb3phy driver for exynos5250
       ARM: dts: Add device tree bindings for dwc3-exynos
       ARM: dts: Enabling dwc3-exynos driver for exynos5250
       ARM: EXYNOS: Enable XHCI support on exynos5

  .../devicetree/bindings/media/s5p-mfc.txt          |  5 ++
  .../devicetree/bindings/usb/exynos-usb.txt         | 34 +++++++++
  arch/arm/boot/dts/exynos4.dtsi                     |  7 ++
  arch/arm/boot/dts/exynos4210-origen.dts            |  4 +
  arch/arm/boot/dts/exynos4210.dtsi                  |  3 +
  arch/arm/boot/dts/exynos4412-origen.dts            | 62 +++++++++++++++
  arch/arm/boot/dts/exynos4412-smdk4412.dts          | 87 
++++++++++++++++++++++
  arch/arm/boot/dts/exynos4412.dtsi                  |  8 ++
  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          | 56 --------------
  arch/arm/boot/dts/exynos5250.dtsi                  | 51 +++++++++++++
  arch/arm/boot/dts/exynos5440.dtsi                  |  1 +
  arch/arm/mach-exynos/Kconfig                       |  1 +
  arch/arm/mach-exynos/common.c                      | 53 +++++++------
  arch/arm/mach-exynos/include/mach/map.h            |  1 -
  arch/arm/mach-exynos/mach-exynos5-dt.c             | 28 +++++++
  15 files changed, 321 insertions(+), 80 deletions(-)

Hi Arnd and Olof,

As I said, last my pull-request at 4/10 included most of above changes. 
So would be nice if you could pull this and small patches added on top 
of that though.

If any problems, please kindly let me know.

Thanks.

- Kukjin
