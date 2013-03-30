From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: S5P64X0: Fix typo "CONFIG_S5P64X0_SETUP_SDHCI"
Date: Sat, 30 Mar 2013 10:54:39 +0100
Message-ID: <1364637279.1345.115.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:51377 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755400Ab3C3Jyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Mar 2013 05:54:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Commit ebc433c2890f8ecad2da39fe2dbf2b6e7b309afa ("ARM: S5P64X0: Add
HSMMC setup for host Controller") added the Kconfig symbol
S5P64X0_SETUP_SDHCI_GPIO. By accident it also used a macro
CONFIG_S5P64X0_SETUP_SDHCI. Fix that typo.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested. Since this typo has been in the tree since v3.3, and some code
has therefore (basically) been compiled out ever since, this does need
testing.

 arch/arm/plat-samsung/include/plat/sdhci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 9b87f38..5560586 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -206,7 +206,7 @@ static inline void s3c6400_default_sdhci2(void) { }
 
 /* S5P64X0 SDHCI setup */
 
-#ifdef CONFIG_S5P64X0_SETUP_SDHCI
+#ifdef CONFIG_S5P64X0_SETUP_SDHCI_GPIO
 static inline void s5p64x0_default_sdhci0(void)
 {
 #ifdef CONFIG_S3C_DEV_HSMMC
@@ -241,7 +241,7 @@ static inline void s5p64x0_default_sdhci1(void) { }
 static inline void s5p6440_default_sdhci2(void) { }
 static inline void s5p6450_default_sdhci2(void) { }
 
-#endif /* CONFIG_S5P64X0_SETUP_SDHCI */
+#endif /* CONFIG_S5P64X0_SETUP_SDHCI_GPIO */
 
 /* S5PC100 SDHCI setup */
 
-- 
1.7.11.7
