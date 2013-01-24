From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] ARM:plat-s3c24xx: for memcpy, reading more things out of
 boundary
Date: Thu, 24 Jan 2013 13:27:31 +0800
Message-ID: <5100C643.5010101@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:32451 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302Ab3AXF1e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 00:27:34 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


  the size is made by "plls_no + 1".
  so when copy from original buffer, need dec 1, or reading out of boundary.

additional info:
  plls_no is ARRARY_SIZE(plls).


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/arm/plat-s3c24xx/cpu-freq.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-s3c24xx/cpu-freq.c b/arch/arm/plat-s3c24xx/cpu-freq.c
index 4680799..df093b2 100644
--- a/arch/arm/plat-s3c24xx/cpu-freq.c
+++ b/arch/arm/plat-s3c24xx/cpu-freq.c
@@ -700,7 +700,8 @@ int __init s3c_plltab_register(struct cpufreq_frequency_table *plls,
 
 	vals = kmalloc(size, GFP_KERNEL);
 	if (vals) {
-		memcpy(vals, plls, size);
+		memcpy(vals, plls,
+			size - sizeof(struct cpufreq_frequency_table));
 		pll_reg = vals;
 
 		/* write a terminating entry, we don't store it in the
-- 
1.7.10.4
