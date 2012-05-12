From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for v3.4
Date: Sun, 13 May 2012 06:42:04 +0900
Message-ID: <4FAED92C.4090103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:34002 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756334Ab2ELUmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 16:42:11 -0400
Received: by dady13 with SMTP id y13so4399116dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 13:42:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd and Olof,

Sorry for late request for v3.4.
If there is a chance, please pull this for v3.4:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-samsung-fixes-4

This is including fixes of hotplug for Cortext-A15(EXYNOS5) and build 
failure of S3C2412(smdk2412 test) and bit typo for clk_pdma1 of exynos5 
and build failure of early version of exynos4210 on universalc210 board.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit d48b97b403d23f6df0b990cee652bdf9a52337a3:

   Linux 3.4-rc6 (2012-05-06 15:07:32 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-samsung-fixes-4

Changhwan Youn (1):
       ARM: EXYNOS: fix the hotplug for Cortex-A15

Jose Miguel Goncalves (1):
       ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping

Kukjin Kim (1):
       ARM: EXYNOS: fix ctrlbit for exynos5_clk_pdma1

Marek Szyprowski (1):
       ARM: EXYNOS: use s5p-timer for UniversalC210 board

  arch/arm/mach-exynos/Kconfig                 |    3 ++
  arch/arm/mach-exynos/clock-exynos5.c         |    2 +-
  arch/arm/mach-exynos/hotplug.c               |   39 
++++++++++++++++++++++++-
  arch/arm/mach-exynos/mach-universal_c210.c   |    4 ++-
  arch/arm/plat-samsung/include/plat/map-s3c.h |    2 +-
  5 files changed, 45 insertions(+), 5 deletions(-)
