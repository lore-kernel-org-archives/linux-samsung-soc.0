From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 0/3] Fixes for breakage resulting from syscore_ops patch on s3c24xx
Date: Wed, 1 Jun 2011 18:21:37 +0200
Message-ID: <201106011821.38091.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40544 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755786Ab1FAQVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 12:21:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The syscore_ops patch from Rafael J. Wysocki introduced some small
glitches for the S3C24XX cpus resulting in compile errors.

Changes since v1: add missing Signed-off-by lines

Heiko Stuebner (3):
  Fix missing struct for s3c2410_dma_chan in s3c2410_dma_suspend_chan
  Move s3c24xx_irq_syscore_ops to plat-s3c24xx/irq.c
  remove the now empty mach-s3c2410/irq.c

 arch/arm/mach-s3c2410/Makefile |    1 -
 arch/arm/mach-s3c2410/irq.c    |   34 ----------------------------------
 arch/arm/plat-s3c24xx/dma.c    |    2 +-
 arch/arm/plat-s3c24xx/irq.c    |    6 ++++++
 4 files changed, 7 insertions(+), 36 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2410/irq.c
