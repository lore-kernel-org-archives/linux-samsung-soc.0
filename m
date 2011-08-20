From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/4] S3C2443: Define constant for HSSPI pclk
Date: Sat, 20 Aug 2011 18:02:15 +0200
Message-ID: <201108201802.16171.heiko@sntech.de>
References: <201108201757.56483.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:53340 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753583Ab1HTQCW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Aug 2011 12:02:22 -0400
In-Reply-To: <201108201757.56483.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

It's the same clock for 2443/2416/2450.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 5e06c72..df6434f 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -102,6 +102,7 @@
 #define S3C2443_PCLKCON_UART3		(1<<3)
 #define S3C2443_PCLKCON_IIC		(1<<4)
 #define S3C2443_PCLKCON_SDI		(1<<5)
+#define S3C2443_PCLKCON_HSSPI		(1<<6)
 #define S3C2443_PCLKCON_ADC		(1<<7)
 #define S3C2443_PCLKCON_AC97		(1<<8)
 #define S3C2443_PCLKCON_IIS		(1<<9)
-- 
1.7.2.3
