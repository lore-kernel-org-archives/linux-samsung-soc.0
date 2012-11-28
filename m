From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 6/7] Samsung devel-3 for v3.8
Date: Wed, 28 Nov 2012 09:16:14 +0900
Message-ID: <50B557CE.7050909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60067 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753233Ab2K1AQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:16:19 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so9281234pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:16:18 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

This is including Samsung small updates(developments) for v3.8.

add node PL330 MDMA1 and UART3 for DEBUG_LL and secondary cpu bring-up 
for exynos4412.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-3

Note, if happens merge conflicts, see my prefer resulotin below.

diff --cc arch/arm/mach-exynos/mach-exynos4-dt.c
index 8858068,6df99c0..92757ff
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@@ -77,8 -77,7 +77,9 @@@ static const struct of_dev_auxdata exyn
                                 "exynos4210-spi.2", NULL),
         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
+       OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
  +      OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
  +                              "exynos-tmu", NULL),
         {},
   };


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit f4a75d2eb7b1e2206094b901be09adb31ba63681:

   Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-3

Bartlomiej Zolnierkiewicz (1):
       ARM: dts: add node for PL330 MDMA1 controller for exynos4

Olof Johansson (1):
       ARM: EXYNOS: add UART3 to DEBUG_LL ports

Tomasz Figa (1):
       ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412

  arch/arm/Kconfig.debug                 |   11 +++++++++++
  arch/arm/boot/dts/exynos4.dtsi         |    6 ++++++
  arch/arm/mach-exynos/mach-exynos4-dt.c |    1 +
  arch/arm/mach-exynos/platsmp.c         |   30 
++++++++++++++++++++++++------
  arch/arm/plat-samsung/Kconfig          |    1 +
  5 files changed, 43 insertions(+), 6 deletions(-)
