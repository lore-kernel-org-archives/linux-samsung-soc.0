From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung 3rd DT updates for v3.14
Date: Sat, 04 Jan 2014 16:32:01 +0900
Message-ID: <52C7B8F1.6040703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:43223 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbaADHcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 4 Jan 2014 02:32:12 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so16209926pdj.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 23:32:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof and Kevin,

Here is 3rd Exynos DT updates for v3.14, actually it's including new dt 
files for exynos4412-tiny4412 and exynos5420-arndale-octa boards. They 
have been included in previous pull-request but it has not been pulled 
because of multiplatform. However Olof agreed just adding DT like this 
is OK so I'm re-sending this pull-request after re-sort them out.

Just note this branch is based on tags/samsung-dt-2 already pulled into 
arm-soc per Olof's suggestion.

If any problems, please kindly let me know.

Thanks,
Kukjin

-------------------------------

The following changes since commit a22d060e3299ce672258d00070fa0ed398c035c5:

   ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos 
prefix (2013-12-21 10:09:25 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt-3

for you to fetch changes up to b67a55125f1413902f7db6d167a8d9e4154386bf:

   ARM: dts: add support for EXYNOS4412 based TINY4412 board (2014-01-04 
16:12:04 +0900)

----------------------------------------------------------------
Samsung DT 3rd updates for v3.14
- add exynos4412-tiny4412 board dt for FriendlyARM's TINY4412
   board including initial support UART, SD card and LEDs
- add exynos5420-arndale-octa board dt for Arndale Octa board

----------------------------------------------------------------
Alex Ling (1):
       ARM: dts: add support for EXYNOS4412 based TINY4412 board

Sachin Kamat (1):
       ARM: dts: Add initial support for Arndale Octa board

  arch/arm/boot/dts/Makefile                    |  2 +
  arch/arm/boot/dts/exynos4412-tiny4412.dts     | 93 
+++++++++++++++++++++++++++
  arch/arm/boot/dts/exynos5420-arndale-octa.dts | 66 +++++++++++++++++++
  3 files changed, 161 insertions(+)
  create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts
  create mode 100644 arch/arm/boot/dts/exynos5420-arndale-octa.dts
