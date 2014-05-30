From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4/5] Samsung Exynos MCPM-2 for 3.16
Date: Sat, 31 May 2014 05:00:01 +0900
Message-ID: <5388E341.6070608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:44391 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbaE3UAG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 16:00:06 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so1301988pdi.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 13:00:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit ccf5511797cd4b48d20a85fa1778f5608eac9fd7:

   ARM: EXYNOS: Add MCPM call-back functions (2014-05-16 04:26:30 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/exynos-mcpm-2

for you to fetch changes up to 7c5688e7fd722690e636c64630ad56babb589e96:

   ARM: EXYNOS: mcpm rename the power_down_finish (2014-05-31 03:01:36 
+0900)

----------------------------------------------------------------
Exynos 2nd MCPM updates for v3.16

- enable mcpm for dual-cluster exynos5800
- since commit 166aaf39 ("ARM: 8029/1: mcpm: Rename the
   power_down_finish() functions to be less confusing"),
   use new member name wait_for_cpu_powerdown.

This is based on tags/exynos-mcpm.

Note that since the commit 166aaf39 is in rmk tree so this
should be sent to upstream after that in 3.16 merge window.

----------------------------------------------------------------
Abhilash Kesavan (1):
       ARM: EXYNOS: Enable mcpm for dual-cluster exynos5800 SoC

Kukjin Kim (1):
       ARM: EXYNOS: mcpm rename the power_down_finish

  arch/arm/mach-exynos/mcpm-exynos.c | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
