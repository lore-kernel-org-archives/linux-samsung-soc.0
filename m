From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 07/10] pmu-exynos for v3.10
Date: Tue, 09 Apr 2013 03:19:24 +0900
Message-ID: <51630A2C.7060409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:34240 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935491Ab3DHSTa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 14:19:30 -0400
Received: by mail-ie0-f177.google.com with SMTP id tp5so7426451ieb.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 11:19:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit da821eb7d42935b0f7056d98c75fd1150f6636f4:

   Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13 +0900)

are available in the git repository at:


   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/pmu-exynos-for-v3.10

for you to fetch changes up to db35234ec7a7a10145cf472f68e1c73fbd48f79c:

   ARM: EXYNOS: Add arm-pmu DT binding for exynos421x (2013-04-09 
01:49:16 +0900)

----------------------------------------------------------------
add support arm-pmu for exynos4 and exynos5250

----------------------------------------------------------------
Chanho Park (5):
       irqchip: exynos-combiner: Add set_irq_affinity function for 
combiner_irq
       irqchip: exynos-combiner: Correct combined IRQs for exynos4
       ARM: EXYNOS: Enable PMUs for exynos4
       ARM: EXYNOS: Add arm-pmu DT binding for exynos5250
       ARM: EXYNOS: Add arm-pmu DT binding for exynos421x

  arch/arm/boot/dts/exynos4210.dtsi        |  6 +++
  arch/arm/boot/dts/exynos5250.dtsi        |  6 +++
  arch/arm/mach-exynos/common.c            | 28 +++++++++++
  arch/arm/mach-exynos/include/mach/irqs.h | 13 ++++--
  arch/arm/plat-samsung/devs.c             |  2 +-
  drivers/irqchip/exynos-combiner.c        | 80 
+++++++++++++++++++++++++-------
  6 files changed, 113 insertions(+), 22 deletions(-)

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
