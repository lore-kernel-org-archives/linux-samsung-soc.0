From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 5/8] ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
Date: Tue, 23 Jul 2013 01:49:22 +0200
Message-ID: <1374536965-3545-6-git-send-email-tomasz.figa@gmail.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:42684 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122Ab3GVXtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 19:49:46 -0400
In-Reply-To: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

This patch modifies s3c64xx DMA driver to prepare and unprepare clocks
in addition to enableind and disabling, since it is required by common
clock framework.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/mach-s3c64xx/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
index 759846c..c511dfa 100644
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -677,7 +677,7 @@ static int s3c64xx_dma_init1(int chno, enum dma_ch chbase,
 		goto err_map;
 	}
 
-	clk_enable(dmac->clk);
+	clk_prepare_enable(dmac->clk);
 
 	dmac->regs = regs;
 	dmac->chanbase = chbase;
@@ -711,7 +711,7 @@ static int s3c64xx_dma_init1(int chno, enum dma_ch chbase,
 	return 0;
 
 err_clk:
-	clk_disable(dmac->clk);
+	clk_disable_unprepare(dmac->clk);
 	clk_put(dmac->clk);
 err_map:
 	iounmap(regs);
-- 
1.8.3.2
