From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/7] S3C2443/S3C2416: Add adc registers
Date: Thu, 8 Sep 2011 21:52:27 +0200
Message-ID: <201109082152.27517.heiko@sntech.de>
References: <201109082151.29076.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201109082151.29076.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The adc blocks of the S3C2443 and S3C2416 define some
additional registers and bits.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/include/plat/regs-adc.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-adc.h b/arch/arm/plat-samsung/include/plat/regs-adc.h
index 035e8c3..f42c445 100644
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
+#define S3C2416_ADCCON_RESSEL		(1<<3)
 #define S3C2410_ADCCON_STDBM		(1<<2)
 #define S3C2410_ADCCON_READ_START	(1<<1)
 #define S3C2410_ADCCON_ENABLE_START	(1<<0)
@@ -40,6 +42,7 @@
 
 
 /* ADCTSC Register Bits */
+#define S3C2443_ADCTSC_UD_SEN		(1<<8)
 #define S3C2410_ADCTSC_YM_SEN		(1<<7)
 #define S3C2410_ADCTSC_YP_SEN		(1<<6)
 #define S3C2410_ADCTSC_XM_SEN		(1<<5)
-- 
1.7.2.3
