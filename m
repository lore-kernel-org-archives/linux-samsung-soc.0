From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung 2nd fixes for 3.15
Date: Sat, 24 May 2014 04:43:22 +0900
Message-ID: <537FA4DA.3090600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:61160 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899AbaEWTnc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 15:43:32 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so4505422pab.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 12:43:31 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

Here is 2nd samsung fixes for 3.15, actually it happened before 3.14 but 
would be better if this could be merged into 3.15.

Thanks,
Kukjin


The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:

   Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-2nd-tag

for you to fetch changes up to 68d0e40298f064a5cff40670caded0480274d4b2:

   ARM: dts: Keep LDO4 always ON for exynos5250-arndale board 
(2014-05-20 01:15:46 +0900)

----------------------------------------------------------------
Samsung-fixes-2 for 3.15
- keep LD04 always on for exynos5250-arndale
- fix spi interrupt numbers for exynos5420
- fix ak8975 compatible for exynos4412-trats2

----------------------------------------------------------------
Beomho Seo (1):
       ARM: dts: fix incorrect ak8975 compatible for exynos4412-trats2 board

Sachin Kamat (2):
       ARM: dts: Fix SPI interrupt numbers for exynos5420
       ARM: dts: Keep LDO4 always ON for exynos5250-arndale board

  arch/arm/boot/dts/exynos4412-trats2.dts  | 2 +-
  arch/arm/boot/dts/exynos5250-arndale.dts | 1 +
  arch/arm/boot/dts/exynos5420.dtsi        | 6 +++---
  3 files changed, 5 insertions(+), 4 deletions(-)
