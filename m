From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 5/6] ARM: S5PC110/S5PV210: Support ADC
Date: Thu, 30 Jun 2011 16:49:34 +0900
Message-ID: <1309420175-10301-6-git-send-email-myungjoo.ham@samsung.com>
References: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40951 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758455Ab1F3Htk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 03:49:40 -0400
In-reply-to: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jassi Brar <jassi.brar@samsung.com>, Seungwhan Youn <sw.youn@samsung.com>, linux-kernel@vger.kernel.org, myungjoo.ham@gmail.com

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 61e6c24..79907ec 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -126,7 +126,7 @@ void __init s5pv210_map_io(void)
 	s5pv210_default_sdhci2();
 	s5pv210_default_sdhci3();
 
-	s3c_adc_setname("s3c64xx-adc");
+	s3c_adc_setname("samsung-adc-v3");
 
 	s3c_cfcon_setname("s5pv210-pata");
 
-- 
1.7.4.1
