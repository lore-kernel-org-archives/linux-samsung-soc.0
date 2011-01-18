From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung S5P fixes
Date: Tue, 18 Jan 2011 16:09:42 +0900
Message-ID: <03f401cbb6de$b12a85a0$137f90e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40208 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab1ARHKB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jan 2011 02:10:01 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Linus,

Please pull Samsung fixes from:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

These things had build problem with sound tree so couldn't merge it.
Its dependency has disappeared in mainline now so I'm requesting pull this.
Of course, it would be nice to see your merging this in before -rc1 :-)

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit e6f597a1425b5af64917be3448b29e2d5a585ac8:

 staging: fix build failure in bcm driver (2011-01-17 16:11:12 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

Jassi Brar (5):
      ARM: S5P6442: Enable I2S device to work on SMDK6442
      ARM: S5P6440: Add missing virtual ASoC DMA device
      ARM: S5P6450: Add missing virtual ASoC DMA device
      ARM: S5PV210: Add missing virtual ASoC DMA device
      ARM: S5PV310: Add missing virtual ASoC DMA device

 arch/arm/mach-s5p6442/mach-smdk6442.c |    1 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c |    1 +
 arch/arm/mach-s5p64x0/mach-smdk6450.c |    1 +
 arch/arm/mach-s5pv210/mach-smdkc110.c |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 arch/arm/mach-s5pv310/mach-smdkc210.c |    3 ++-
 arch/arm/mach-s5pv310/mach-smdkv310.c |    3 ++-
 7 files changed, 9 insertions(+), 2 deletions(-)
