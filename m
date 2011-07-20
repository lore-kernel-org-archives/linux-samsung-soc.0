From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/3] ARM: SAMSUNG: Cleanup mach/regs-fb.h from various machines
Date: Wed, 20 Jul 2011 19:02:28 +0530
Message-ID: <1311168751-30336-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13885 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979Ab1GTNhR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 09:37:17 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOM00LB6WHUW270@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:16 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOM00AJWWHWME@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patchset cleans up mach/regs-fb.h from S3C64XX, S5PC100, and S5PV210.
plat/regs-fb-v4.h is used instead to provide the same support.

Display testing done on SMDK6410, SMDKC100 and SMDKV210.
For other machines, its compile tested.

o To Kukjin Kim, Jingoo Han, Marek Szyprowski.
  ARM: S5PC100: Cleanup mach/regs-fb.h from mach-s5pc100
  ARM: S5PV210: Cleanup mach/regs-fb.h from mach-s5pv210
  ARM: S3C64XX: Cleanup mach/regs-fb.h from mach-s3c64xx

 arch/arm/mach-s3c64xx/include/mach/regs-fb.h |   21 -----
 arch/arm/mach-s3c64xx/mach-anw6410.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c             |    2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c             |    2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq5.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq7.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c        |    2 +-
 arch/arm/mach-s3c64xx/setup-fb-24bpp.c       |    1 -
 arch/arm/mach-s5pc100/include/mach/regs-fb.h |  105 --------------------------
 arch/arm/mach-s5pc100/mach-smdkc100.c        |    2 +-
 arch/arm/mach-s5pc100/setup-fb-24bpp.c       |    1 -
 arch/arm/mach-s5pv210/include/mach/regs-fb.h |   21 -----
 arch/arm/mach-s5pv210/mach-aquila.c          |    2 +-
 arch/arm/mach-s5pv210/mach-goni.c            |    2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c        |    2 +-
 arch/arm/mach-s5pv210/setup-fb-24bpp.c       |    1 -
 19 files changed, 13 insertions(+), 163 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/regs-fb.h
 delete mode 100644 arch/arm/mach-s5pc100/include/mach/regs-fb.h
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/regs-fb.h
