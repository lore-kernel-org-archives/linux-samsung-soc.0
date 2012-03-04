From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/3] S3C24XX: Enable DMA on S3C2416 by sharing S3C2443-DMA
Date: Sun, 4 Mar 2012 18:42:35 +0100
Message-ID: <201203041842.35420.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34068 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754460Ab2CDRmt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Mar 2012 12:42:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The S3C2416/2450 contains the same DMA register layout as the S3C2443.
Therefore it can simply share this dma selection definition.

As we use the S3C2443_DMA the S3C2416_DMA is no longer necessary. The
third patch removes this remnant of the S3C24XX merge.

The whole series was made on top of the recent S3C24XX merge.

Heiko Stuebner (3):
  ARM: S3C24XX: Fix indentation of dma-s3c2443
  ARM: S3C24XX: Reuse S3C2443 dma for S3C2416
  ARM: S3C24XX: remove obsolete S3C2416_DMA option

 arch/arm/Kconfig                              |    1 -
 arch/arm/mach-s3c2416/Kconfig                 |   14 -----------
 arch/arm/mach-s3c2416/Makefile                |   12 ----------
 arch/arm/mach-s3c24xx/Kconfig                 |   10 ++++----
 arch/arm/mach-s3c24xx/Makefile                |    2 +-
 arch/arm/mach-s3c24xx/dma-s3c2443.c           |   30 ++++++++++++++++++++-----
 arch/arm/plat-samsung/include/plat/regs-dma.h |    2 +-
 7 files changed, 31 insertions(+), 40 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2416/Kconfig
 delete mode 100644 arch/arm/mach-s3c2416/Makefile

-- 
1.7.2.3
