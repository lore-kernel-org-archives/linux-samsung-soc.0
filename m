From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/5] Samsung cleanup for v3.9
Date: Mon, 04 Feb 2013 15:42:01 -0800
Message-ID: <120f01ce0331$3b9f2790$b2dd76b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38832 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755297Ab3BDXmQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 18:42:16 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHP003NPZ5AKTA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:12 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHP001C1Z65V280@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:11 +0900 (KST)
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

This is for removing useless codes.
Please pull it.

Thanks.

- Kukjin

The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:

  Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-samsung

for you to fetch changes up to 7cf580d03613b59fe4578e6717b0afd524ebad7b:

  ARM: S5PV210: remove useless ifdef in common.h (2013-02-04 14:35:48 -0800)

----------------------------------------------------------------
Kukjin Kim (3):
      ARM: dts: cleanup exynos5440.dtsi
      ARM: S5PC100: remove useless ifdef in common.h
      ARM: S5PV210: remove useless ifdef in common.h

 arch/arm/boot/dts/exynos5440.dtsi |    5 -----
 arch/arm/mach-s5pc100/common.h    |    9 ---------
 arch/arm/mach-s5pv210/common.h    |    9 ---------
 3 files changed, 23 deletions(-)
