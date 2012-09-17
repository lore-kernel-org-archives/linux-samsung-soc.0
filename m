From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-3 for v3.6
Date: Tue, 18 Sep 2012 07:56:40 +0900
Message-ID: <05be01cd9527$b35c3480$1a149d80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54306 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754975Ab2IQW4l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 18:56:41 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAI00DNQNQ6UC60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 07:56:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAI00DMYNQFSN70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 07:56:39 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Here is second Samsung fixes for v3.6.

This includes using spin_lock_irqsave in clk_set_parent() to avoid spinlock
recursion and fixing wrong definitions.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:

  Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.6-samsung-fixes-2

Julia Lawall (1):
      ARM: S3C24xx: delete double assignment

Mandeep Singh Baines (1):
      ARM: SAMSUNG: use spin_lock_irqsave() in clk_set_parent

Peter Senna Tschudin (1):
      ARM: S3C24XX: removes unnecessary semicolon

Seung-Woo Kim (1):
      ARM: EXYNOS: fixed SYSMMU setup definition to mate parameter name

 arch/arm/mach-exynos/include/mach/sysmmu.h |    2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c         |    4 ++--
 arch/arm/plat-samsung/clock.c              |    5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)
