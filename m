From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 1/2] S3C2443/S3C2416: Add adc registers
Date: Wed, 28 Sep 2011 08:42:19 +0200
Message-ID: <201109280842.20542.heiko@sntech.de>
References: <201109182241.48858.heiko@sntech.de> <201109182242.55394.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:38146 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388Ab1I1Gmd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 02:42:33 -0400
In-Reply-To: <201109182242.55394.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

The adc blocks of the S3C2443 and S3C2416 define some
additional registers and bits.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes since v1: add spaces around <<
 arch/arm/plat-samsung/include/plat/regs-adc.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-adc.h b/arch/arm/plat-samsung/include/plat/regs-adc.h
index 035e8c3..7061210 100644
--- a/arch/arm/plat-samsung/include/plat/regs-adc.h
+++ b/arch/arm/plat-samsung/include/plat/regs-adc.h
@@ -20,6 +20,7 @@
 #define S3C2410_ADCDAT0	   S3C2410_ADCREG(0x0C)
 #define S3C2410_ADCDAT1	   S3C2410_ADCREG(0x10)
 #define S3C64XX_ADCUPDN		S3C2410_ADCREG(0x14)
+#define S3C2443_ADCMUX		S3C2410_ADCREG(0x18)
 #define S3C64XX_ADCCLRINT	S3C2410_ADCREG(0x18)
 #define S5P_ADCMUX		S3C2410_ADCREG(0x1C)
 #define S3C64XX_ADCCLRINTPNDNUP	S3C2410_ADCREG(0x20)
@@ -33,6 +34,7 @@
 #define S3C2410_ADCCON_PRSCVLMASK	(0xFF<<6)
 #define S3C2410_ADCCON_SELMUX(x)	(((x)&0x7)<<3)
 #define S3C2410_ADCCON_MUXMASK		(0x7<<3)
+#define S3C2416_ADCCON_RESSEL		(1 << 3)
 #define S3C2410_ADCCON_STDBM		(1<<2)
 #define S3C2410_ADCCON_READ_START	(1<<1)
 #define S3C2410_ADCCON_ENABLE_START	(1<<0)
@@ -40,6 +42,7 @@
 
 
 /* ADCTSC Register Bits */
+#define S3C2443_ADCTSC_UD_SEN		(1 << 8)
 #define S3C2410_ADCTSC_YM_SEN		(1<<7)
 #define S3C2410_ADCTSC_YP_SEN		(1<<6)
 #define S3C2410_ADCTSC_XM_SEN		(1<<5)
-- 
1.7.5.4
