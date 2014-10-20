From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/3] 1st Round of Samsung cleanup for v3.19
Date: Tue, 21 Oct 2014 00:54:14 +0900
Message-ID: <54453026.7060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:41919 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbaJTPyV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 11:54:21 -0400
Received: by mail-pa0-f54.google.com with SMTP id ey11so5484850pad.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2014 08:54:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

Here is 1st round of Samsung updates for v3.19 and actually it has been 
sent out to arm-soc for v3.18 before but as you know missed. I've just 
rebased the branch on top of v3.18-rc1, please pull.

Thanks,
Kukjin

----

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup

for you to fetch changes up to 13cfa6c4f7facfc690ba9e99ec382c151fddaced:

   ARM: EXYNOS: Fix CPU idle clock down after CPU off (2014-10-21 
00:06:22 +0900)

----------------------------------------------------------------
Samsung cleanup for v3.19

- Cleanup SMP/hotplug codes from hotplug.c to platsmp.c
- Remove unneeded __ref annotation for exynos_cpu_die()
- Fix the way to power down CPU on exynos4 and CPUidle
   clock down after power down some CPU

----------------------------------------------------------------
Krzysztof Kozlowski (3):
       ARM: EXYNOS: Move code from hotplug.c to platsmp.c
       ARM: EXYNOS: Remove unneeded __ref annotation for cpu_die function
       ARM: EXYNOS: Fix CPU idle clock down after CPU off

  arch/arm/mach-exynos/Makefile   |   3 --
  arch/arm/mach-exynos/common.h   |   2 -
  arch/arm/mach-exynos/hotplug.c  |  91 --------------------------------
  arch/arm/mach-exynos/platsmp.c  | 113 
++++++++++++++++++++++++++++++++++++++++
  arch/arm/mach-exynos/regs-pmu.h |   3 ++
  5 files changed, 116 insertions(+), 96 deletions(-)
  delete mode 100644 arch/arm/mach-exynos/hotplug.c
