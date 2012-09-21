From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4/4] Samsung DT for v3.7
Date: Fri, 21 Sep 2012 15:26:36 +0900
Message-ID: <505C089C.4050801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57438 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530Ab2IUG0t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:26:49 -0400
Received: by pbbrr4 with SMTP id rr4so1919019pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 23:26:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

This is for updating Samsung DT for v3.7.

But now this makes many conflicts with pinctrl dt because of moving file 
so I'm sorting them out to avoid useless conflicts.

I'll re-send this soon again.
This is jut for your information.

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
next/dt-samsung

Kukjin Kim (1):
       ARM: dts: use uart2 for console on smdkv310 and smdk5250

Tomasz Figa (6):
       ARM: dts: Move parts common to EXYNOS4 from exynos4210.dtsi to 
exynos4.dtsi
       ARM: EXYNOS: Use exynos4 prefix instead of exynos4210 on exynos4-dt
       ARM: dts: Assume status of all optional nodes as disabled for exynos4
       ARM: dts: Specify address and size cells for i2c controllers for 
EXYNOS4
       ARM: EXYNOS: Add OF compatibility lookups for EXYNOS4 i2c adapters
       ARM: dts: Add basic dts file for Samsung Trats board

Tushar Behera (1):
       ARM: dts: Enable on-board keys as wakeup source for exynos4210-origen

  arch/arm/boot/dts/exynos4.dtsi            |  248 
+++++++++++++++++++++++++++++
  arch/arm/boot/dts/exynos4210-origen.dts   |   63 +-------
  arch/arm/boot/dts/exynos4210-smdkv310.dts |   54 +------
  arch/arm/boot/dts/exynos4210-trats.dts    |  237 
+++++++++++++++++++++++++++
  arch/arm/boot/dts/exynos4210.dtsi         |  181 +---------------------
  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
  arch/arm/mach-exynos/Makefile.boot        |    2 +-
  arch/arm/mach-exynos/mach-exynos4-dt.c    |   32 +++-
  8 files changed, 523 insertions(+), 296 deletions(-)
  create mode 100644 arch/arm/boot/dts/exynos4.dtsi
  create mode 100644 arch/arm/boot/dts/exynos4210-trats.dts
