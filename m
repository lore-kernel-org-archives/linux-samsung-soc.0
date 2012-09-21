From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/4] Samsung devel for v3.7
Date: Fri, 21 Sep 2012 15:22:43 +0900
Message-ID: <505C07B3.2040101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53605 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754211Ab2IUGWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:22:55 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so1911825pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 23:22:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Here is Samsung development for v3.7 and most of them are updating.

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
next/devel-samsung

Chander Kashyap (3):
       ARM: EXYNOS: Turn off clocks for NAND, OneNAND and TSI controllers
       ARM: EXYNOS: Put PCM, Slimbus, Spdif clocks to off state
       ARM: SAMSUNG: Add check for NULL in clock interface

Leela Krishna Amudala (1):
       ARM: EXYNOS: Add bus clock for FIMD

Sachin Kamat (2):
       ARM: EXYNOS: Fix incorrect help text
       ARM: SAMSUNG: Fix HDMI related warnings

Sylwester Nawrocki (1):
       ARM: S3C24XX: Add .get_rate callback for "camif-upll" clock

  arch/arm/mach-exynos/Kconfig          |    4 ++--
  arch/arm/mach-exynos/clock-exynos4.c  |   31 
+++++++++++++++++++++++++++++++
  arch/arm/mach-exynos/clock-exynos5.c  |   32 
++++++++++++++++++++++----------
  arch/arm/mach-s3c24xx/clock-s3c2440.c |   14 ++++++++++++++
  arch/arm/plat-samsung/clock.c         |    8 ++++----
  arch/arm/plat-samsung/devs.c          |    3 ++-
  6 files changed, 75 insertions(+), 17 deletions(-)
