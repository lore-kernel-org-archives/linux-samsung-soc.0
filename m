From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung Fixes for v3.2
Date: Fri, 30 Dec 2011 10:50:28 +0900
Message-ID: <02c701ccc695$685501d0$38ff0570$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10529 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545Ab1L3Buc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 20:50:32 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWZ00MR9UFRVF90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 10:50:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWZ00GYFUG42L70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 10:50:30 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>

Hi Linus,

This is Samsung fixes for v3.2

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.2-samsung-fixes-4

The 'ARM: SAMSUNG: Fix build error...' is fixing of build in some case of
only selection s3c2440 in kernel configuration and the 'ARM: EXYNOS: Remove
duplicated...' can cause the detection of overlapped memory region which
resulted in boot failure.

If any problem, please kindly let me know.

Arnd, since v3.2 is now close at hand, I'm sending this to Linus.

Linus, Arnd and all Linux guys,
Happy New Year :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 5f0a6e2d503896062f641639dacfe5055c2f593b:

  Linux 3.2-rc7 (2011-12-23 21:51:06 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.2-samsung-fixes-4

Denis Kuzmenko (1):
      ARM: SAMSUNG: Fix build error when selecting CPU_FREQ_S3C24XX_DEBUGFS
on S3C2440

Thomas Abraham (1):
      ARM: EXYNOS: Remove duplicated SROMC static memory mapping

 arch/arm/mach-exynos/cpu.c                         |    5 ----
 arch/arm/plat-samsung/include/plat/cpu-freq-core.h |   25
++++++++++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)
