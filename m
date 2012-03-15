From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung EXYNOS5250 GPIO for v3.4
Date: Thu, 15 Mar 2012 07:25:20 -0700
Message-ID: <4F61FBD0.4040904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54735 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490Ab2COOZZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Mar 2012 10:25:25 -0400
Received: by pbcun15 with SMTP id un15so48823pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Mar 2012 07:25:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof,

Please pull EXYNOS5250 gpio for v3.4.

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/soc-exynos5250-gpio

It is including add support GPIOlib for EXYNOS5250 and Grant Likely 
already agreed to send this via arm-soc for v3.4. Actually, this is 
needed for compilation of EXYNOS5250 arch. As a note, this has no 
dependency with others for merging.

If any problems, please let me know.

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
next/soc-exynos5250-gpio

Sangsu Park (3):
       ARM: EXYNOS: add support GPIO for EXYNOS5250
       gpio/samsung: add support GPIOlib for EXYNOS5250
       gpio/samsung: use ioremap() for EXYNOS4 GPIOlib

  arch/arm/mach-exynos/common.c            |   15 -
  arch/arm/mach-exynos/include/mach/gpio.h |  239 ++++++++++++---
  arch/arm/mach-exynos/include/mach/map.h  |    4 +
  drivers/gpio/gpio-samsung.c              |  487 
+++++++++++++++++++++++++++---
  4 files changed, 637 insertions(+), 108 deletions(-)
