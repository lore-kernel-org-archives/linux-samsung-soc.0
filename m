From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 0/7] ARM: SAMSUNG: Code cleanup for various devices
Date: Tue, 19 Jul 2011 17:34:59 +0530
Message-ID: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55568 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751353Ab1GSMEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 08:04:41 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOK007MYXJR4DG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:39 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOK00E78XJMQE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:39 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

 Use generic s3c_set_platdata to perform the same job. Saves a few lines
 of code. 
 
 The patches are created against "for-next" branch of Kukjin Kim's tree at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

 These patches are only compile tested.

 o To Kukjin Kim
  PATCH[1/7] ARM: SAMSUNG: Use generic s3c_set_platdata for TS
  PATCH[2/7] ARM: SAMSUNG: Use generic s3c_set_platdata for FB
  PATCH[3/7] ARM: SAMSUNG: Use generic s3c_set_platdata for HWMON
  PATCH[4/7] ARM: SAMSUNG: Use generic s3c_set_platdata for USB OHCI
  PATCH[5/7] ARM: SAMSUNG: Use generic s3c_set_platdata for NAND

 o To Ben Dooks
  PATCH[6/7] ARM: S3C64XX: Use generic s3c_set_platdata for OneNAND
  PATCH[7/7] ARM: S3C24XX: Use generic s3c_set_platdata for devices

 arch/arm/mach-s3c64xx/dev-onenand1.c |   10 +++-----
 arch/arm/plat-s3c24xx/devs.c         |   38 ++++++---------------------------
 arch/arm/plat-samsung/dev-fb.c       |   14 +----------
 arch/arm/plat-samsung/dev-hwmon.c    |   14 +----------
 arch/arm/plat-samsung/dev-nand.c     |    9 ++-----
 arch/arm/plat-samsung/dev-ts.c       |   14 +----------
 arch/arm/plat-samsung/dev-usb.c      |    9 +------
 7 files changed, 22 insertions(+), 86 deletions(-)

-- 
1.7.2.3
