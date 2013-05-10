From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 39/42] arch/arm/plat-samsung: don't check resource with devm_ioremap_resource
Date: Fri, 10 May 2013 10:17:24 +0200
Message-ID: <1368173847-5661-40-git-send-email-wsa@the-dreams.de>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 arch/arm/plat-samsung/adc.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index ca07cb1..79690f2 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -381,11 +381,6 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(dev, "failed to find registers\n");
-		return -ENXIO;
-	}
-
 	adc->regs = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(adc->regs))
 		return PTR_ERR(adc->regs);
-- 
1.7.10.4
