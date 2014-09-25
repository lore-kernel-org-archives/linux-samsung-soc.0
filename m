From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/3] 3rd Round of Samsung-DT-3 updates for v3.18
Date: Fri, 26 Sep 2014 01:55:44 +0900
Message-ID: <54244910.3050609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:57223 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbaIYQzx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 12:55:53 -0400
Received: by mail-pa0-f52.google.com with SMTP id hz1so11449903pad.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 09:55:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 57901371c9914d5e5eeabf2870c35162837198d2:

   ARM: dts: add MFC codec device node for exynos3250 (2014-09-24 
01:33:23 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt-3

for you to fetch changes up to 0d2ff37147727b62d99d250076e6f849a38a72ef:

   ARM: dts: add CPU nodes for Exynos4 SoCs (2014-09-25 17:40:14 +0900)

----------------------------------------------------------------
Samsung 3rd DT updates for v3.18

- Fix rebase conflcits in previous tags/samsung-dt-2
   : Fix chip select GPIO for exynos5250-smdk5250
   : Remove display timings node for exynos5250-snow

- Fix Exynos USB on kernels with USB Gadget support
   : Explicitly set dr_mode for the dwc3 controller
   for exynos5420-arndale-octa, exynos5420-peach-pit
   and exynos5800-peach-pi boards

- add CPU nodes for exynos4210, exynos4212, exynos4412

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
       ARM: dts: add CPU nodes for Exynos4 SoCs

Javier Martinez Canillas (2):
       ARM: dts: Fix chip select GPIO on exynos5250-smdk5250
       ARM: dts: Remove display timings node from exynos5250-snow

Sjoerd Simons (2):
       ARM: dts: Explicitly set dr_mode on exynos Peach boards
       ARM: dts: Explicitly set dr_mode on exynos5420-arndale-octa

  arch/arm/boot/dts/exynos4210.dtsi             | 17 ++++++++++++++++
  arch/arm/boot/dts/exynos4212.dtsi             | 17 ++++++++++++++++
  arch/arm/boot/dts/exynos4412.dtsi             | 29 
+++++++++++++++++++++++++++
  arch/arm/boot/dts/exynos5250-smdk5250.dts     |  2 +-
  arch/arm/boot/dts/exynos5250-snow.dts         | 16 ---------------
  arch/arm/boot/dts/exynos5420-arndale-octa.dts |  4 ++++
  arch/arm/boot/dts/exynos5420-peach-pit.dts    |  8 ++++++++
  arch/arm/boot/dts/exynos5420.dtsi             |  4 ++--
  arch/arm/boot/dts/exynos5800-peach-pi.dts     |  8 ++++++++
  9 files changed, 86 insertions(+), 19 deletions(-)
