From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/4] Samsung fixes for v3.7
Date: Fri, 21 Sep 2012 15:21:37 +0900
Message-ID: <505C0771.7040103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39396 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab2IUGVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:21:47 -0400
Received: by pbbrr4 with SMTP id rr4so1910725pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 23:21:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

This is non-critical Samsung fixes for v3.7.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 5698bd757d55b1bb87edd1a9744ab09c142abfc2:

   Linux 3.6-rc6 (2012-09-16 14:58:51 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.7-samsung-fixes-1

Julia Lawall (1):
       ARM: S3C24xx: delete double assignment

Kukjin Kim (1):
       ARM: EXYNOS: fix address for EXYNOS4 MDMA1

Peter Senna Tschudin (1):
       ARM: S3C24XX: removes unnecessary semicolon

Seung-Woo Kim (1):
       ARM: EXYNOS: fixed SYSMMU setup definition to mate parameter name

Sylwester Nawrocki (1):
       ARM: SAMSUNG: Add missing variable declaration in 
s3c64xx_spi1_set_platdata()

  arch/arm/mach-exynos/include/mach/map.h    |    2 +-
  arch/arm/mach-exynos/include/mach/sysmmu.h |    2 +-
  arch/arm/mach-s3c24xx/mach-h1940.c         |    4 ++--
  arch/arm/plat-samsung/devs.c               |    2 ++
  4 files changed, 6 insertions(+), 4 deletions(-)
