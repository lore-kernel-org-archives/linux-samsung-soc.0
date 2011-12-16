From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-3 for v3.2
Date: Fri, 16 Dec 2011 16:33:12 +0900
Message-ID: <014801ccbbc4$f7954200$e6bfc600$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23852 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136Ab1LPHdQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Dec 2011 02:33:16 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWA00E34CZBNTR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Dec 2011 16:33:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWA001H8CZC7T30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 16 Dec 2011 16:33:14 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Please pull 3rd Samsung fixes for v3.2.
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit dc47ce90c3a822cd7c9e9339fe4d5f61dcb26b50:

  Linux 3.2-rc5 (2011-12-09 15:09:32 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
samsung-fixes-3

Amit Daniel Kachhap (1):
      ARM: EXYNOS: Fix for stall in case of cpu hotplug or sleep

Jingoo Han (2):
      ARM: SAMSUNG: remove duplicated header include
      ARM: S5PV210: Set 1000ns as PWM backlight period on SMDKV210

Kukjin Kim (1):
      ARM: EXYNOS: Fix build error without CONFIG_LOCAL_TIMERS

 arch/arm/mach-exynos/mct.c            |   13 ++++++++++---
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 arch/arm/plat-samsung/dev-backlight.c |    1 -
 3 files changed, 11 insertions(+), 4 deletions(-)
