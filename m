From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for 3.0
Date: Sat, 16 Jul 2011 16:21:37 +0900
Message-ID: <037c01cc4389$02934c10$07b9e430$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38068 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab1GPHV4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 03:21:56 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOF00FXR0G6E630@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:21:42 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOF009A10G6VS@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:21:42 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org
Cc: 'Linus Torvalds' <torvalds@linux-foundation.org>

Hi Linus,

This is last pull request for v3.0 :)

Please pull Samsung fixes from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc:

  Linux 3.0-rc7 (2011-07-11 16:51:52 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

Sangwook Lee (1):
      ARM: SAMSUNG: DMA Cleanup as per sparse

Todd Poynor (1):
      ARM: SAMSUNG: Check NULL return from irq_alloc_generic_chip

 arch/arm/mach-s3c64xx/dma.c              |   14 +++++++-------
 arch/arm/plat-s3c24xx/dma.c              |   12 ++++++------
 arch/arm/plat-samsung/dma.c              |    6 +++---
 arch/arm/plat-samsung/include/plat/dma.h |   21 +++++++++++----------
 arch/arm/plat-samsung/irq-uart.c         |    7 +++++++
 arch/arm/plat-samsung/irq-vic-timer.c    |    7 +++++++
 6 files changed, 41 insertions(+), 26 deletions(-)
