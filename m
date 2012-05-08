From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 0/4] ARM: S3C24XX: move some code from plat to mach directory
Date: Tue, 8 May 2012 20:34:50 +0200
Message-ID: <201205082034.50658.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:43606 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754601Ab2EHSe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 14:34:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>

Again the series of small moves of common code from the plat-s3c24xx to the
mach-s3c24xx directory.

This time without the wrong handled irq.c . Hopefully I'll get time to do it
properly later.

As the dev-uart.c move breaks the resource patch by Tushar Behera, I updated
the patch to fix the correct code and will submit it as a v2 to the resource
series.

Heiko Stuebner (4):
  ARM: S3C24XX: move plat-s3c24xx/cpu.c
  ARM: S3C24XX: move plat-s3c24xx/dev-uart.c into common.c
  ARM: S3C24XX: move common power-management code to mach-s3c24xx
  ARM: S3C24XX: move common clock init into common.c

 arch/arm/mach-s3c24xx/Makefile                     |    6 +
 .../{plat-s3c24xx/cpu.c => mach-s3c24xx/common.c}  |   93 ++++++++++++++++++-
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/irq-pm.c   |    0
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/pm.c       |    0
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/sleep.S    |    0
 arch/arm/plat-s3c24xx/Makefile                     |    6 -
 arch/arm/plat-s3c24xx/clock.c                      |   59 ------------
 arch/arm/plat-s3c24xx/dev-uart.c                   |  100 --------------------
 8 files changed, 98 insertions(+), 166 deletions(-)
 rename arch/arm/{plat-s3c24xx/cpu.c => mach-s3c24xx/common.c} (75%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/irq-pm.c (100%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/pm.c (100%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/sleep.S (100%)
 delete mode 100644 arch/arm/plat-s3c24xx/clock.c
 delete mode 100644 arch/arm/plat-s3c24xx/dev-uart.c

-- 
1.7.5.4
