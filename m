From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/5] Samsung cleanup-s5p for v3.10
Date: Thu, 07 Mar 2013 11:23:32 +0900
Message-ID: <016701ce1ada$c35e6860$4a1b3920$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58744 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932301Ab3CGCXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 21:23:45 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ90040KQN8GWK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:23:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ90024UQN8LBA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:23:32 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Arnd, Olof,

Here is small cleanup for s5p stuff.

This is including useless ifdef.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-s5p

for you to fetch changes up to eb50cd0b2a083950457bf68241a9f040972b6908:

  ARM: S5PV210: remove useless ifdef in common.h (2013-03-05 18:37:10 +0900)

----------------------------------------------------------------
Kukjin Kim (2):
      ARM: S5PC100: remove useless ifdef in common.h
      ARM: S5PV210: remove useless ifdef in common.h

 arch/arm/mach-s5pc100/common.h |    9 ---------
 arch/arm/mach-s5pv210/common.h |    9 ---------
 2 files changed, 18 deletions(-)
