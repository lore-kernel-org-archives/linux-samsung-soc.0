From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL v2 3/4] Samsung devel-mmc for v3.4
Date: Sun, 11 Mar 2012 00:56:14 -0800
Message-ID: <4F5C68AE.4000101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42178 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770Ab2CKI4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:56:21 -0400
Received: by dajr28 with SMTP id r28so3608191daj.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:56:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof

Please pull Samsung devel-mmc for v3.4 and I rebased it on top of 
v3.3-rc7 without v3.4-for-cjb.

Please pull it from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-mmc

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit fde7d9049e55ab85a390be7f415d74c9f62dd0f9:

   Linux 3.3-rc7 (2012-03-10 13:49:52 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-mmc

Jaehoon Chung (3):
       ARM: SAMSUNG: support the second capability for samsung-soc
       mmc: sdhci-s3c: add platform data for the second capability
       ARM: SAMSUNG: change the name from s3c-sdhci to exynos4-sdhci

  arch/arm/mach-exynos/mach-nuri.c           |    4 ++--
  arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
  arch/arm/plat-samsung/include/plat/sdhci.h |    2 ++
  arch/arm/plat-samsung/platformdata.c       |    2 ++
  drivers/mmc/host/sdhci-s3c.c               |    6 +++---
  5 files changed, 10 insertions(+), 6 deletions(-)
