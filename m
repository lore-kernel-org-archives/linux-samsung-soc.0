From: Cedric Roux <sed@free.fr>
Subject: [PATCH v3 2/2] ARM: s3c24xx: Correct SD card write protect detection on Mini2440
Date: Fri,  7 Sep 2018 23:54:46 +0200
Message-ID: <20180907215446.15160-2-sed@free.fr>
References: <20180907215446.15160-1-sed@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907215446.15160-1-sed@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Cedric Roux <sed@free.fr>
List-Id: linux-samsung-soc@vger.kernel.org

The mini2440 computer uses "active high" to signal that the "write protect"
of the inserted MMC is set. The current code uses the opposite, leading to
a wrong detection of write protection. The solution is simply to use
".wprotect_invert = 1" in the description of the MMC.

Signed-off-by: Cedric Roux <sed@free.fr>
---
 arch/arm/mach-s3c24xx/mach-mini2440.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 4a0bf6abba8c..bfce7971d741 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -234,10 +234,11 @@ static struct s3c2410fb_mach_info mini2440_fb_info __initdata = {
 /* MMC/SD  */
 
 static struct s3c24xx_mci_pdata mini2440_mmc_cfg __initdata = {
-	.gpio_detect   = S3C2410_GPG(8),
-	.gpio_wprotect = S3C2410_GPH(8),
-	.set_power     = NULL,
-	.ocr_avail     = MMC_VDD_32_33|MMC_VDD_33_34,
+	.gpio_detect     = S3C2410_GPG(8),
+	.gpio_wprotect   = S3C2410_GPH(8),
+	.wprotect_invert = 1,
+	.set_power       = NULL,
+	.ocr_avail       = MMC_VDD_32_33|MMC_VDD_33_34,
 };
 
 /* NAND Flash on MINI2440 board */
-- 
2.18.0
