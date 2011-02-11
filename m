From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for 2.6.38-rc5
Date: Fri, 11 Feb 2011 10:56:57 +0900
Message-ID: <01b701cbc98e$fa196b60$ee4c4220$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28385 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932231Ab1BKB5m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Feb 2011 20:57:42 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Linus,

Please pull Samsung fixes from:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

These things are for small fix on 2.6.38-rc5.
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 100b33c8bd8a3235fd0b7948338d6cbb3db3c63d:

  Linux 2.6.38-rc4 (2011-02-07 16:03:17 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

Kukjin Kim (1):
      ARM: S5PV310: Cleanup System MMU

Mark Brown (1):
      ARM: SAMSUNG: Ensure struct sys_device is declared in plat/pm.h

Thomas Abraham (1):
      ARM: S5PV310: Add support System MMU on SMDKV310

 arch/arm/mach-s5pv310/Kconfig               |    1 +
 arch/arm/mach-s5pv310/include/mach/map.h    |    2 --
 arch/arm/mach-s5pv310/include/mach/sysmmu.h |    5 ++++-
 arch/arm/plat-s5p/Kconfig                   |   24 ++++++++----------------
 arch/arm/plat-s5p/Makefile                  |    2 +-
 arch/arm/plat-s5p/include/plat/sysmmu.h     |   23 -----------------------
 arch/arm/plat-s5p/sysmmu.c                  |    4 +---
 arch/arm/plat-samsung/include/plat/pm.h     |    2 ++
 8 files changed, 17 insertions(+), 46 deletions(-)
