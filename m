From: Cedric Roux <sed@free.fr>
Subject: [PATCH] mini2440 MMC correct write protect detection
Date: Tue, 4 Sep 2018 22:36:35 +0200
Message-ID: <85dac0df-2b75-9cc4-fde1-f62136974a1e@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

mini2440 MMC correct write protect detection

The mini2440 computer uses "active high" to signal that the "write protect"
of the inserted MMC is set. The current code uses the opposite, leading to
a wrong detection of write protection. The solution is simply to use
".wprotect_invert = 1" in the description of the MMC.

Signed-off-by: Cedric Roux <sed@free.fr>

--- arch/arm/mach-s3c24xx/mach-mini2440.c.orig	2018-09-04 22:15:20.696087528 +0200
+++ arch/arm/mach-s3c24xx/mach-mini2440.c	2018-09-04 22:15:32.708088023 +0200
@@ -232,6 +232,7 @@ static struct s3c2410fb_mach_info mini24
 /* MMC/SD  */
 
 static struct s3c24xx_mci_pdata mini2440_mmc_cfg __initdata = {
+   .wprotect_invert = 1,
    .gpio_detect   = S3C2410_GPG(8),
    .gpio_wprotect = S3C2410_GPH(8),
    .set_power     = NULL,
