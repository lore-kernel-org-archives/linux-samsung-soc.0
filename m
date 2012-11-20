From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-3 for v3.7
Date: Tue, 20 Nov 2012 23:18:37 +0900
Message-ID: <50AB913D.2020604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:62453 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993Ab2KTOSp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 09:18:45 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so1289934pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 06:18:44 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Here is Samsung fixes for v3.7 and it is for fixing of mdma1 address for 
exynos4210 rev0 SoC.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.7-samsung-fixes-3

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
v3.7-samsung-fixes-3

Bartlomiej Zolnierkiewicz (1):
       ARM: EXYNOS: PL330 MDMA1 fix for revision 0 of Exynos4210 SOC

  arch/arm/mach-exynos/dma.c              |    3 +++
  arch/arm/mach-exynos/include/mach/map.h |    1 +
  2 files changed, 4 insertions(+), 0 deletions(-)
