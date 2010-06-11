From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 4/9] ARM: S3C64XX: Add support for secur clock
Date: Fri, 11 Jun 2010 21:48:56 +0200
Message-ID: <4C129328.7090400@gmail.com>
References: <cover.1276284559.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:46761 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760530Ab0FKTs6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jun 2010 15:48:58 -0400
Received: by mail-ww0-f46.google.com with SMTP id 18so1095668wwb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jun 2010 12:48:57 -0700 (PDT)
In-Reply-To: <cover.1276284559.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org

This patch adds correct register definitions for the secur clock, used by the
Samsung crypto engine.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index d3e11a1..8cbe949 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -716,6 +716,15 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div	= { .reg = S3C_CLK_DIV0, .shift = 20, .size = 4  },
 		.reg_src	= { .reg = NULL, .shift = 0, .size = 0  },
 		.sources	= &clkset_camif,
+	},  {
+		.clk	= {
+			.name		= "secur",
+			.id		= -1,
+			.ctrlbit	= S3C_CLKCON_SCLK_SECUR,
+			.enable		= s3c64xx_sclk_ctrl,
+			.parent		= &clk_h2,
+		},
+		.reg_div	= { .reg = S3C_CLK_DIV0, .shift = 18, .size = 2 },
 	},
 };
 
-- 
1.7.1
