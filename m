From: Matthew Leach <matthew@mattleach.net>
Subject: [RFC PATCH 07/15] ARM: exynos: fixup debug macros for big-endian
Date: Wed,  8 Jun 2016 19:31:02 +0100
Message-ID: <20160608183110.13851-8-matthew@mattleach.net>
References: <20160608183110.13851-1-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160608183110.13851-1-matthew@mattleach.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben.dooks@codethink.co.uk>

The exynos low-level debug macros need to be fixed if the system is being
built big endian. Add the necessary endian swaps for accessing the registers
to get output working again

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/include/debug/samsung.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/include/debug/samsung.S b/arch/arm/include/debug/samsung.S
index 8d8d922..f4eeed2 100644
--- a/arch/arm/include/debug/samsung.S
+++ b/arch/arm/include/debug/samsung.S
@@ -15,11 +15,13 @@
 
 	.macro fifo_level_s5pv210 rd, rx
 		ldr	\rd, [\rx, # S3C2410_UFSTAT]
+ARM_BE8(rev \rd, \rd)
 		and	\rd, \rd, #S5PV210_UFSTAT_TXMASK
 	.endm
 
 	.macro  fifo_full_s5pv210 rd, rx
 		ldr	\rd, [\rx, # S3C2410_UFSTAT]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S5PV210_UFSTAT_TXFULL
 	.endm
 
@@ -28,6 +30,7 @@
 
 	.macro fifo_level_s3c2440 rd, rx
 		ldr	\rd, [\rx, # S3C2410_UFSTAT]
+ARM_BE8(rev \rd, \rd)
 		and	\rd, \rd, #S3C2440_UFSTAT_TXMASK
 	.endm
 
@@ -37,6 +40,7 @@
 
 	.macro  fifo_full_s3c2440 rd, rx
 		ldr	\rd, [\rx, # S3C2410_UFSTAT]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2440_UFSTAT_TXFULL
 	.endm
 
@@ -50,6 +54,7 @@
 
 	.macro	busyuart, rd, rx
 		ldr	\rd, [\rx, # S3C2410_UFCON]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2410_UFCON_FIFOMODE	@ fifo enabled?
 		beq	1001f				@
 		@ FIFO enabled...
@@ -61,6 +66,7 @@
 1001:
 		@ busy waiting for non fifo
 		ldr	\rd, [\rx, # S3C2410_UTRSTAT]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2410_UTRSTAT_TXFE
 		beq	1001b
 
@@ -69,6 +75,7 @@
 
 	.macro	waituart,rd,rx
 		ldr	\rd, [\rx, # S3C2410_UFCON]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2410_UFCON_FIFOMODE	@ fifo enabled?
 		beq	1001f				@
 		@ FIFO enabled...
@@ -80,6 +87,7 @@
 1001:
 		@ idle waiting for non fifo
 		ldr	\rd, [\rx, # S3C2410_UTRSTAT]
+ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2410_UTRSTAT_TXFE
 		beq	1001b
 
-- 
2.8.3
