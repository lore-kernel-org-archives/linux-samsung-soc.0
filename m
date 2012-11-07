From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Statically define parent clock of the "camera" clock
Date: Wed,  7 Nov 2012 23:00:57 +0100
Message-ID: <1352325657-28885-2-git-send-email-sylvester.nawrocki@gmail.com>
References: <1352325657-28885-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:58543 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029Ab2KGWBr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 17:01:47 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so1202502eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 14:01:47 -0800 (PST)
In-Reply-To: <1352325657-28885-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

The "camera" clock defined in arch/arm/mach-s3c64xx/clock.c has null
clock source mux control register as it can have only one parent
clock. In such cases there is a need to configure the parent clock
statically, otherwise s3c_set_clksrc() bails out with an error message
"no parent clock specified" leaving the parent clock not configured.
Define statically the parent clock so it is possible to get or set rate
of the "camera" clock.

Reported-by: In-Bae Jeong <kukyakya@gmail.com>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 28041e8..85b9cf1 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -744,6 +744,7 @@ static struct clksrc_clk clksrcs[] = {
 			.name		= "camera",
 			.ctrlbit        = S3C_CLKCON_SCLK_CAM,
 			.enable		= s3c64xx_sclk_ctrl,
+			.parent		= &clk_h2,
 		},
 		.reg_div	= { .reg = S3C_CLK_DIV0, .shift = 20, .size = 4  },
 		.reg_src	= { .reg = NULL, .shift = 0, .size = 0  },
-- 
1.7.4.1
