From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: SAMSUNG: remove two unused S3C boot options
Date: Sun, 06 Apr 2014 12:12:42 +0200
Message-ID: <1396779162.30640.14.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit 19a964644f1e ("ARM: SAMSUNG: remove all custom uncompress.h")
removed the only users of S3C_BOOT_ERROR_RESET and
S3C_BOOT_UART_FORCE_FIFO. Remove their Kconfig entries too.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 arch/arm/plat-samsung/Kconfig | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index b57e922f1614..f615c0e7b226 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -40,20 +40,6 @@ if PLAT_SAMSUNG
 
 comment "Boot options"
 
-config S3C_BOOT_ERROR_RESET
-	bool "S3C Reboot on decompression error"
-	help
-	  Say y here to use the watchdog to reset the system if the
-	  kernel decompressor detects an error during decompression.
-
-config S3C_BOOT_UART_FORCE_FIFO
-       bool "Force UART FIFO on during boot process"
-       default y
-       help
-         Say Y here to force the UART FIFOs on during the kernel
-	 uncompressor
-
-
 config S3C_LOWLEVEL_UART_PORT
 	int "S3C UART to use for low-level messages"
 	default 0
-- 
1.9.0
